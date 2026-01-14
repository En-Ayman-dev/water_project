import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

part 'audit_controller.g.dart';

class AuditLogItem {
  final AuditLog log;
  final String? userName; // اسم الفاعل (قد يكون null إذا كان إجراء نظام)

  AuditLogItem(this.log, this.userName);
}

@riverpod
Future<List<AuditLogItem>> recentAuditLogs( ref) async {
  final db = ref.read(appDatabaseProvider);
  
  // استعلام مع Join لجلب اسم المستخدم
  final query = db.select(db.auditLogs).join([
    leftOuterJoin(db.users, db.users.id.equalsExp(db.auditLogs.userId)),
  ]);

  // الترتيب: الأحدث أولاً
  query.orderBy([OrderingTerm.desc(db.auditLogs.createdAt)]);
  
  // تحديد العدد (لتحسين الأداء)
  query.limit(100);

  final rows = await query.get();

  return rows.map((row) {
    return AuditLogItem(
      row.readTable(db.auditLogs),
      row.readTableOrNull(db.users)?.name,
    );
  }).toList();
}