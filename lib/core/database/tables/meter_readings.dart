import 'package:drift/drift.dart';
import 'billing_cycles.dart';
import 'meters.dart';

class MeterReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // الربط
  IntColumn get cycleId => integer().references(BillingCycles, #id)();
  IntColumn get meterId => integer().references(Meters, #id)();
  
  // البيانات
  IntColumn get previousReading => integer().withDefault(const Constant(0))();
  IntColumn get currentReading => integer()();
  IntColumn get units => integer()(); // الفرق المحسوب (للسرعة في الاستعلام)
  
  // معلومات إضافية
  TextColumn get status => text().withDefault(const Constant('normal'))(); // normal, missing, broken_meter
  TextColumn get note => text().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
  
  // قاعدة: لا يمكن تكرار قراءة لنفس العداد في نفس الدورة
  @override
  List<Set<Column>> get uniqueKeys => [{cycleId, meterId}];
}