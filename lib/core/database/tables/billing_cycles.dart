import 'package:drift/drift.dart';

class BillingCycles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)(); // مثال: يناير 2024
  IntColumn get year => integer()();
  IntColumn get month => integer()();
  TextColumn get status => text().withDefault(const Constant('open'))(); // open, closed
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get closedAt => dateTime().nullable()(); // تاريخ إغلاق الدورة

  // لضمان عدم تكرار نفس الشهر والسنة
  @override
  List<Set<Column>> get uniqueKeys => [{year, month}];
}