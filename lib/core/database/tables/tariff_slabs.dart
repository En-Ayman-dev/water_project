import 'package:drift/drift.dart';
import 'tariffs.dart';

class TariffSlabs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tariffId => integer().references(Tariffs, #id)(); // ربط بالتعرفة
  IntColumn get startUnit => integer()(); // بداية الشريحة (مثلاً 0)
  IntColumn get endUnit => integer().nullable()(); // نهاية الشريحة (null = إلى ما لا نهاية)
  RealColumn get unitPrice => real()(); // سعر الوحدة في هذه الشريحة
}