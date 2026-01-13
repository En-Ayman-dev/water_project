import 'package:drift/drift.dart';
import 'subscribers.dart';
import 'invoices.dart';
import 'users.dart';

class Adjustments extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // الربط بالمشترك والفاتورة
  IntColumn get subscriberId => integer().references(Subscribers, #id)();
  IntColumn get invoiceId => integer().nullable().references(Invoices, #id)(); // يمكن أن يكون الخصم عاماً أو على فاتورة محددة
  
  // تفاصيل العملية
  TextColumn get type => text()(); // 'discount' (خصم), 'exempt' (إعفاء), 'penalty' (غرامة)
  RealColumn get amount => real()();
  TextColumn get reason => text()();
  
  // دورة الاعتماد
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, approved, rejected
  IntColumn get requestedBy => integer().references(Users, #id)();
  IntColumn get approvedBy => integer().nullable().references(Users, #id)();
  DateTimeColumn get approvedAt => dateTime().nullable()();
  
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}