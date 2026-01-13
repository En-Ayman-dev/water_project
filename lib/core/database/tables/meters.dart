import 'package:drift/drift.dart';
import 'subscribers.dart';

class Meters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get meterNo => text().unique()(); // رقم العداد يجب أن يكون فريداً
  IntColumn get subscriberId => integer().nullable().references(Subscribers, #id)(); // يمكن أن يكون العداد غير مربوط مؤقتاً (مخزن)
  TextColumn get status => text().withDefault(const Constant('ok'))(); // ok, broken, replaced, lost
  DateTimeColumn get installedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastReadingDate => dateTime().nullable()(); // لتسهيل التحقق لاحقاً
}