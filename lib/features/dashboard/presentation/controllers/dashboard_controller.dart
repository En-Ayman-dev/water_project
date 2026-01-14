import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';

part 'dashboard_controller.g.dart';

class DashboardStats {
  final int totalSubscribers;
  final int activeMeters;
  final int brokenMeters;
  final double totalDebt; // إجمالي الديون في السوق
  final double monthlyCollection; // تحصيل هذا الشهر
  final double collectionRate; // نسبة التحصيل

  DashboardStats({
    required this.totalSubscribers,
    required this.activeMeters,
    required this.brokenMeters,
    required this.totalDebt,
    required this.monthlyCollection,
    required this.collectionRate,
  });
}

@riverpod
Future<DashboardStats> dashboardStats(Ref ref) async {
  final db = ref.read(appDatabaseProvider);

  // ===================== 1) عدد المشتركين =====================
  final subscribersCountExpr = db.subscribers.id.count();

  final totalSubscribers =
      await (db.selectOnly(db.subscribers)..addColumns([subscribersCountExpr]))
              .map((row) => row.read(subscribersCountExpr))
              .getSingle() ??
          0;

  // ===================== 2) العدادات (سليم/معطل) =====================
  final metersCountExpr = db.meters.id.count();

  final activeMeters =
      await (db.selectOnly(db.meters)
            ..addColumns([metersCountExpr])
            ..where(db.meters.status.equals('ok')))
          .map((row) => row.read(metersCountExpr))
          .getSingle() ??
      0;

  final brokenMeters =
      await (db.selectOnly(db.meters)
            ..addColumns([metersCountExpr])
            ..where(db.meters.status.equals('broken')))
          .map((row) => row.read(metersCountExpr))
          .getSingle() ??
      0;

  // ===================== 3) إجمالي الديون (آمن بدون SQL خام) =====================
  // الدين = مجموع (totalAmount - paidAmount) للفواتير غير المدفوعة
  // هذا يحميك من مشاكل اختلاف أسماء الأعمدة في قاعدة البيانات.
  final invoices = await db.select(db.invoices).get();

  double totalDebt = 0.0;
  double totalInvoicedAllTime = 0.0;

  for (final inv in invoices) {
    totalInvoicedAllTime += inv.totalAmount;
    if (inv.status != 'paid') {
      totalDebt += (inv.totalAmount - inv.paidAmount);
    }
  }

  // ===================== 4) تحصيل الشهر الحالي =====================
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

  final monthlySumExpr = db.payments.amount.sum();

  final monthlyCollection =
      await (db.selectOnly(db.payments)
            ..addColumns([monthlySumExpr])
            ..where(db.payments.paidAt.isBetweenValues(startOfMonth, endOfMonth)))
          .map((row) => row.read(monthlySumExpr))
          .getSingle() ??
      0.0;

  // ===================== 5) نسبة التحصيل =====================
  double collectionRate = 0.0;
  if (totalInvoicedAllTime > 0) {
    collectionRate =
        ((totalInvoicedAllTime - totalDebt) / totalInvoicedAllTime) * 100;

    // حماية من القيم الشاذة
    if (collectionRate.isNaN) collectionRate = 0.0;
    if (collectionRate < 0) collectionRate = 0.0;
    if (collectionRate > 100) collectionRate = 100.0;
  }

  return DashboardStats(
    totalSubscribers: totalSubscribers,
    activeMeters: activeMeters,
    brokenMeters: brokenMeters,
    totalDebt: totalDebt,
    monthlyCollection: monthlyCollection,
    collectionRate: collectionRate,
  );
}
