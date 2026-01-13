import 'package:drift/drift.dart';
import 'subscribers.dart';
import 'billing_cycles.dart';
import 'tariffs.dart';
import 'meters.dart';

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNo => text().unique()(); // رقم فاتورة فريد (INV-2024-0001)
  
  // العلاقات
  IntColumn get subscriberId => integer().references(Subscribers, #id)();
  IntColumn get cycleId => integer().references(BillingCycles, #id)();
  IntColumn get tariffId => integer().references(Tariffs, #id)();
  IntColumn get meterId => integer().nullable().references(Meters, #id)(); // اختياري في حال كان تقديري أو مقطوعية
  
  // البيانات المالية (Snapshot)
  IntColumn get units => integer()(); // كمية الاستهلاك
  RealColumn get fixedFeeAmount => real()(); // الرسوم الثابتة وقت الإصدار
  RealColumn get consumptionAmount => real()(); // قيمة الاستهلاك فقط
  RealColumn get adjustmentsAmount => real().withDefault(const Constant(0.0))(); // خصومات أو إضافات
  RealColumn get arrearsAmount => real().withDefault(const Constant(0.0))(); // المتأخرات السابقة
  RealColumn get totalAmount => real()(); // المبلغ النهائي المستحق
  RealColumn get paidAmount => real().withDefault(const Constant(0.0))(); // ما تم دفعه حتى الآن

  // الحالة
  TextColumn get status => text().withDefault(const Constant('unpaid'))(); // unpaid, partial, paid, canceled
  DateTimeColumn get issuedAt => dateTime().withDefault(currentDateAndTime)();
}