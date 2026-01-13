import 'package:drift/drift.dart';
import 'users.dart';

class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // الفاعل
  IntColumn get userId => integer().nullable().references(Users, #id)(); // nullable في حال كان إجراء نظام System Action
  
  // الفعل
  TextColumn get action => text()(); // CREATE, UPDATE, DELETE, APPROVE, LOGIN
  TextColumn get entityType => text()(); // Subscriber, Invoice, Tariff, etc.
  IntColumn get entityId => integer().nullable()(); // ID الصف المتأثر
  
  // التفاصيل (يمكن تخزين JSON هنا لما تغير)
  TextColumn get details => text().nullable()(); 
  
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}