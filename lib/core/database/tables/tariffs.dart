import 'package:drift/drift.dart';

class Tariffs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)(); // مثال: تعرفة 2024
  RealColumn get fixedFee => real().withDefault(const Constant(100.0))(); // الرسوم الثابتة الشهرية
  DateTimeColumn get effectiveFrom => dateTime()(); // تاريخ سريان التعرفة
  BoolColumn get isActive => boolean().withDefault(const Constant(true))(); // لتفعيل/إيقاف تعرفة
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}