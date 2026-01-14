import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';

part 'adjustments_controller.g.dart';

// جلب الطلبات المعلقة (Pending) للمدير
@riverpod
Stream<List<AdjustmentWithDetails>> pendingAdjustments( ref) {
  final db = ref.watch(appDatabaseProvider);
  
  // نستخدم Join لجلب اسم المشترك مع الطلب
  final query = db.select(db.adjustments).join([
    innerJoin(db.subscribers, db.subscribers.id.equalsExp(db.adjustments.subscriberId)),
    leftOuterJoin(db.invoices, db.invoices.id.equalsExp(db.adjustments.invoiceId)),
    innerJoin(db.users, db.users.id.equalsExp(db.adjustments.requestedBy)),
  ]);

  query.where(db.adjustments.status.equals('pending'));
  query.orderBy([OrderingTerm.desc(db.adjustments.createdAt)]);

  return query.watch().map((rows) {
    return rows.map((row) {
      return AdjustmentWithDetails(
        adjustment: row.readTable(db.adjustments),
        subscriberName: row.readTable(db.subscribers).fullName,
        invoiceNo: row.readTableOrNull(db.invoices)?.invoiceNo,
        requesterName: row.readTable(db.users).name,
      );
    }).toList();
  });
}

class AdjustmentWithDetails {
  final Adjustment adjustment;
  final String subscriberName;
  final String? invoiceNo;
  final String requesterName;

  AdjustmentWithDetails({
    required this.adjustment,
    required this.subscriberName,
    this.invoiceNo,
    required this.requesterName,
  });
}