import 'package:drift/drift.dart';
import 'areas.dart';

class Subscribers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(min: 1, max: 150)();
  TextColumn get phone => text().nullable()(); // رقم الهاتف اختياري
  IntColumn get areaId => integer().references(Areas, #id)(); // ربط بالمنطقة
  TextColumn get status => text().withDefault(const Constant('active'))(); // active, suspended, canceled
  TextColumn get address => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}