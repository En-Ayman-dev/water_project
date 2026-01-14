import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../audit/application/audit_service.dart';

part 'adjustment_service.g.dart';

@riverpod
AdjustmentService adjustmentService( ref) {
  return AdjustmentService(ref);
}

class AdjustmentService {
  final  _ref;

  AdjustmentService(this._ref);

  /// 1. تقديم طلب خصم/إعفاء
  Future<void> submitRequest({
    required int subscriberId,
    required int? invoiceId,
    required String type, // 'discount', 'exempt'
    required double amount,
    required String reason,
  }) async {
    final db = _ref.read(appDatabaseProvider);
    final user = _ref.read(authControllerProvider).value;

    if (user == null) throw Exception('يجب تسجيل الدخول أولاً');

    await db.transaction(() async {
      final id = await db.into(db.adjustments).insert(AdjustmentsCompanion(
        subscriberId: Value(subscriberId),
        invoiceId: Value(invoiceId),
        type: Value(type),
        amount: Value(amount),
        reason: Value(reason),
        status: const Value('pending'),
        requestedBy: Value(user.id),
        createdAt: Value(DateTime.now()),
      ));

      // تسجيل في التدقيق
      await _ref.read(auditServiceProvider).log(
        action: 'REQUEST_ADJUSTMENT',
        entityType: 'Adjustment',
        entityId: id,
        details: 'طلب $type بمبلغ $amount. السبب: $reason',
      );
    });
  }

  /// 2. اعتماد الطلب (للمدير فقط)
  Future<void> approveRequest(int adjustmentId) async {
    final db = _ref.read(appDatabaseProvider);
    final user = _ref.read(authControllerProvider).value;

    // التحقق من الصلاحية
    if (user == null || user.role != 'admin') {
      throw Exception('ليس لديك صلاحية لاعتماد التسويات');
    }

    await db.transaction(() async {
      // جلب الطلب
      final adjustment = await (db.select(db.adjustments)
            ..where((t) => t.id.equals(adjustmentId)))
          .getSingle();

      if (adjustment.status != 'pending') {
        throw Exception('هذا الطلب تمت معالجته مسبقاً');
      }

      // أ) تحديث حالة الطلب
      await (db.update(db.adjustments)..where((t) => t.id.equals(adjustmentId)))
          .write(AdjustmentsCompanion(
        status: const Value('approved'),
        approvedBy: Value(user.id),
        approvedAt: Value(DateTime.now()),
      ));

      // ب) تطبيق الأثر المالي على الفاتورة (إذا كان مرتبطاً بفاتورة)
      if (adjustment.invoiceId != null) {
        final invoice = await (db.select(db.invoices)
              ..where((t) => t.id.equals(adjustment.invoiceId!)))
            .getSingle();

        // حساب القيم الجديدة
        // ملاحظة: الخصم يقلل الإجمالي، الغرامة تزيده
        // سنفترض هنا أن النوع discount أو exempt يقلل القيمة
        final isReduction = ['discount', 'exempt'].contains(adjustment.type);
        
        final double newAdjustmentAmount = invoice.adjustmentsAmount + (isReduction ? adjustment.amount : -adjustment.amount);
        final double newTotal = invoice.totalAmount - (isReduction ? adjustment.amount : -adjustment.amount);

        // منع القيمة السالبة للفاتورة
        if (newTotal < 0) {
           throw Exception('لا يمكن أن تكون قيمة الفاتورة بالسالب');
        }

        await (db.update(db.invoices)..where((t) => t.id.equals(invoice.id)))
            .write(InvoicesCompanion(
          adjustmentsAmount: Value(newAdjustmentAmount),
          totalAmount: Value(newTotal),
        ));
      }

      // ج) التدقيق
      await _ref.read(auditServiceProvider).log(
        action: 'APPROVE_ADJUSTMENT',
        entityType: 'Adjustment',
        entityId: adjustmentId,
        details: 'تم اعتماد التسوية وتعديل الفاتورة',
      );
    });
  }

  /// 3. رفض الطلب
  Future<void> rejectRequest(int adjustmentId) async {
    final db = _ref.read(appDatabaseProvider);
    final user = _ref.read(authControllerProvider).value;

    if (user == null || user.role != 'admin') {
      throw Exception('ليس لديك صلاحية');
    }

    await db.transaction(() async {
      await (db.update(db.adjustments)..where((t) => t.id.equals(adjustmentId)))
          .write(AdjustmentsCompanion(
        status: const Value('rejected'),
        approvedBy: Value(user.id), // هنا يعني من قام بالرفض
        approvedAt: Value(DateTime.now()),
      ));

      await _ref.read(auditServiceProvider).log(
        action: 'REJECT_ADJUSTMENT',
        entityType: 'Adjustment',
        entityId: adjustmentId,
        details: 'تم رفض طلب التسوية',
      );
    });
  }
}