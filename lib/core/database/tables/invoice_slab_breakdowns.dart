import 'package:drift/drift.dart';
import 'invoices.dart';

class InvoiceSlabBreakdowns extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().references(Invoices, #id, onDelete: KeyAction.cascade)();
  
  // تفاصيل الشريحة وقت الحساب
  IntColumn get slabStartUnit => integer()();
  IntColumn get slabEndUnit => integer().nullable()();
  RealColumn get unitPrice => real()();
  IntColumn get unitsInSlab => integer()(); // كم وحدة تم حسابها في هذه الشريحة
  RealColumn get amount => real()(); // المبلغ لهذه الشريحة
}