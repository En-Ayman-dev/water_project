import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

part 'readings_controller.g.dart';

// نموذج يمثل العداد وحالة قراءته في الدورة الحالية
class MeterReadingStatus {
  final Meter meter;
  final Subscriber subscriber;
  final MeterReading? currentReading; // null إذا لم تتم القراءة بعد
  final int lastReadingValue; // القراءة السابقة المعتمدة

  MeterReadingStatus({
    required this.meter,
    required this.subscriber,
    this.currentReading,
    required this.lastReadingValue,
  });
}

@riverpod
class ReadingsController extends _$ReadingsController {
  @override
  FutureOr<List<MeterReadingStatus>> build(int cycleId) async {
    return _fetchMetersForCycle(cycleId);
  }

  Future<List<MeterReadingStatus>> _fetchMetersForCycle(int cycleId) async {
    final db = ref.read(appDatabaseProvider);
    
    // 1. جلب المشتركين والعدادات النشطة
    final query = db.select(db.meters).join([
      innerJoin(db.subscribers, db.subscribers.id.equalsExp(db.meters.subscriberId)),
    ]);
    // استثناء المشتركين الملغيين
    query.where(db.subscribers.status.isNotValue('canceled'));
    
    final rows = await query.get();
    final List<MeterReadingStatus> result = [];

    for (final row in rows) {
      final meter = row.readTable(db.meters);
      final subscriber = row.readTable(db.subscribers);

      // 2. هل توجد قراءة مسجلة في هذه الدورة؟
      final currentReading = await (db.select(db.meterReadings)
        ..where((t) => t.cycleId.equals(cycleId) & t.meterId.equals(meter.id)))
        .getSingleOrNull();

      // 3. جلب آخر قراءة سابقة (من دورات سابقة) لتحديد نقطة البداية
      // نبحث عن أحدث قراءة تاريخياً لهذا العداد باستثناء الدورة الحالية
      final lastReadingRow = await (db.select(db.meterReadings)
        ..where((t) => t.meterId.equals(meter.id) & t.cycleId.isNotValue(cycleId))
        ..orderBy([(t) => OrderingTerm(expression: t.currentReading, mode: OrderingMode.desc)])
        ..limit(1))
        .getSingleOrNull();

      final lastValue = lastReadingRow?.currentReading ?? 0;

      result.add(MeterReadingStatus(
        meter: meter,
        subscriber: subscriber,
        currentReading: currentReading,
        lastReadingValue: lastValue,
      ));
    }
    
    return result;
  }

  Future<void> submitReading({
    required int cycleId,
    required int meterId,
    required int currentVal,
    required int previousVal,
  }) async {
    final db = ref.read(appDatabaseProvider);

    // 🔒 1. التحقق الصارم من حالة الدورة (Strict Locking)
    // لا نسمح بأي تعديل إذا كانت الدورة مغلقة
    final cycle = await (db.select(db.billingCycles)..where((t) => t.id.equals(cycleId))).getSingle();
    
    if (cycle.status == 'closed') {
      throw Exception('⛔ عذراً: لا يمكن إدخال أو تعديل القراءات لأن الدورة مغلقة.');
    }

    // 2. التحقق المنطقي للقراءة
    if (currentVal < previousVal) {
      throw Exception('خطأ: القراءة الحالية أقل من السابقة!');
    }

    final units = currentVal - previousVal;

    // 3. الحفظ (نستخدم insertOnConflictUpdate للسماح بالتصحيح طالما الدورة مفتوحة)
    await db.into(db.meterReadings).insertOnConflictUpdate(MeterReadingsCompanion(
      cycleId: Value(cycleId),
      meterId: Value(meterId),
      previousReading: Value(previousVal),
      currentReading: Value(currentVal),
      units: Value(units),
      status: const Value('normal'),
      recordedAt: Value(DateTime.now()), // تحديث وقت الإدخال
    ));

    // 4. تحديث الواجهة
    ref.invalidateSelf();
  }
}