import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/services/billing_service.dart';
// استيراد خدمة التدقيق لتوثيق عملية الإغلاق
import '../../../audit/application/audit_service.dart';

/// 1) قائمة الدورات
final billingCyclesListProvider = StreamProvider<List<BillingCycle>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.billingCycles)..orderBy([
        (t) => OrderingTerm(expression: t.startDate, mode: OrderingMode.desc),
      ]))
      .watch();
});

/// 2) فواتير دورة محددة (Family)
final cycleInvoicesProvider = StreamProvider.family<List<Invoice>, int>((
  ref,
  cycleId,
) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(
    db.invoices,
  )..where((t) => t.cycleId.equals(cycleId))).watch();
});

/// 3) Controller (بدون codegen)
final billingCycleControllerProvider =
    AsyncNotifierProvider<BillingCycleController, void>(
      BillingCycleController.new,
    );

class BillingCycleController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> openNewCycle(int year, int month) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      final startDate = DateTime(year, month, 1);
      final endDate = DateTime(year, month + 1, 0); // آخر يوم في الشهر

      final id = await db
          .into(db.billingCycles)
          .insert(
            BillingCyclesCompanion(
              name: Value('${_getMonthName(month)} $year'),
              year: Value(year),
              month: Value(month),
              startDate: Value(startDate),
              endDate: Value(endDate),
              status: const Value('open'),
            ),
          );
      
      // توثيق العملية
      await ref.read(auditServiceProvider).log(
        action: 'CREATE',
        entityType: 'BillingCycle',
        entityId: id,
        details: 'تم فتح دورة جديدة: ${_getMonthName(month)} $year',
      );
    });
  }

  Future<void> generateInvoices(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      // 🔒 التحقق الصارم: هل الدورة مغلقة؟
      final cycle = await (db.select(db.billingCycles)..where((t) => t.id.equals(cycleId))).getSingle();
      if (cycle.status == 'closed') {
        throw Exception('⛔ عذراً: لا يمكن توليد الفواتير لأن الدورة مغلقة ومؤرشفة.');
      }

      final service = ref.read(billingServiceProvider);
      await service.generateInvoicesForCycle(cycleId);
      
      // توثيق العملية
      await ref.read(auditServiceProvider).log(
        action: 'GENERATE_INVOICES',
        entityType: 'BillingCycle',
        entityId: cycleId,
        details: 'تم توليد فواتير الدورة',
      );
    });
  }

  /// إنشاء قراءات عشوائية للاختبار
  Future<void> simulateRandomReadings(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      // 🔒 التحقق الصارم
      final cycle = await (db.select(db.billingCycles)..where((t) => t.id.equals(cycleId))).getSingle();
      if (cycle.status == 'closed') {
        throw Exception('⛔ عذراً: لا يمكن تعديل القراءات لأن الدورة مغلقة.');
      }

      final activeMeters = await (db.select(
        db.meters,
      )..where((t) => t.subscriberId.isNotNull())).get();

      final random = Random();
      int count = 0;

      for (final meter in activeMeters) {
        final exists =
            await (db.select(db.meterReadings)..where(
                  (t) => t.cycleId.equals(cycleId) & t.meterId.equals(meter.id),
                ))
                .getSingleOrNull();

        if (exists == null) {
          final prevReading = 1000 + random.nextInt(500);
          final consumption = 10 + random.nextInt(100);
          final currReading = prevReading + consumption;

          await db
              .into(db.meterReadings)
              .insert(
                MeterReadingsCompanion(
                  cycleId: Value(cycleId),
                  meterId: Value(meter.id),
                  previousReading: Value(prevReading),
                  currentReading: Value(currReading),
                  units: Value(consumption),
                  status: const Value('normal'),
                ),
              );
          count++;
        }
      }
      
      if (count > 0) {
        await ref.read(auditServiceProvider).log(
          action: 'SIMULATE_READINGS',
          entityType: 'BillingCycle',
          entityId: cycleId,
          details: 'تم توليد $count قراءة عشوائية للاختبار',
        );
      }
    });
  }

  String _getMonthName(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return months[month - 1];
  }

  Future<void> closeCycle(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      // تنفيذ الإغلاق
      await (db.update(
        db.billingCycles,
      )..where((t) => t.id.equals(cycleId))).write(
        BillingCyclesCompanion(
          status: const Value('closed'),
          closedAt: Value(DateTime.now()),
        ),
      );

      // 📝 توثيق حدث الإغلاق (هام جداً للحوكمة)
      await ref.read(auditServiceProvider).log(
        action: 'CLOSE_CYCLE',
        entityType: 'BillingCycle',
        entityId: cycleId,
        details: 'تم إغلاق الدورة الشهرية ومنع التعديل عليها',
      );
    });
  }
}