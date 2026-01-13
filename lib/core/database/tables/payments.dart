import 'package:drift/drift.dart';
import 'subscribers.dart';

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get receiptNo => text().unique()(); // رقم تسلسلي (RCPT-2024-0001)
  IntColumn get subscriberId => integer().references(Subscribers, #id)();
  RealColumn get amount => real()(); // المبلغ الكلي المدفوع في هذا الإيصال
  DateTimeColumn get paidAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get paymentMethod => text().withDefault(const Constant('cash'))(); // cash, transfer, etc.
  TextColumn get notes => text().nullable()();
  
  // حقول الحوكمة
  BoolColumn get isLocked => boolean().withDefault(const Constant(true))(); // الإيصال مقفل افتراضياً بمجرد إصداره
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}