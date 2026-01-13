import 'package:drift/drift.dart';

class Areas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  // يمكن إضافة parentId لاحقاً للتدرج الهرمي، حالياً نكتفي بالاسم
}