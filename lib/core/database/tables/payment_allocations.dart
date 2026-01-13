import 'package:drift/drift.dart';
import 'payments.dart';
import 'invoices.dart';

class PaymentAllocations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get paymentId => integer().references(Payments, #id, onDelete: KeyAction.cascade)();
  IntColumn get invoiceId => integer().references(Invoices, #id)(); // الفاتورة التي تم سداد جزء منها أو كلها
  RealColumn get amount => real()(); // المبلغ المخصص لهذه الفاتورة تحديداً
}