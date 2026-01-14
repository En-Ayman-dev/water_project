import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../auth/presentation/controllers/auth_controller.dart';

part 'audit_service.g.dart';

@Riverpod(keepAlive: true)
AuditService auditService( ref) {
  return AuditService(ref);
}

class AuditService {
  final  _ref;

  AuditService(this._ref);

  /// دالة التسجيل الرئيسية
  /// [action]: نوع العملية (CREATE, UPDATE, DELETE, LOGIN, PRINT)
  /// [entityType]: اسم الجدول أو الكيان (Subscriber, Invoice, Tariff)
  /// [entityId]: رقم الصف المتأثر (اختياري)
  /// [details]: تفاصيل إضافية نصية أو JSON (اختياري)
  Future<void> log({
    required String action,
    required String entityType,
    int? entityId,
    String? details,
  }) async {
    try {
      final db = _ref.read(appDatabaseProvider);
      
      // محاولة الحصول على المستخدم الحالي (الفاعل)
      final userState = _ref.read(authControllerProvider);
      final userId = userState.value?.id;

      await db.into(db.auditLogs).insert(AuditLogsCompanion(
        userId: Value(userId), // يمكن أن يكون null إذا كانت عملية نظام
        action: Value(action),
        entityType: Value(entityType),
        entityId: Value(entityId),
        details: Value(details),
        createdAt: Value(DateTime.now()),
      ));
    } catch (e) {
      // يجب ألا توقف خدمة التدقيق سير العمل الرئيسي في حال فشلها
      print('Audit Log Failed: $e'); 
    }
  }
}