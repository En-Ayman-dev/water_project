import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/subscribers.dart';
import '../tables/invoices.dart';
import '../tables/payments.dart';

part 'reports_dao.g.dart';

class DailyCollectionModel {
  final double totalAmount;
  final int count;
  final String? method;

  DailyCollectionModel(this.totalAmount, this.count, this.method);
}

class DebtorModel {
  final String subscriberName;
  final String phone;
  final double totalDebt;
  final int unpaidInvoicesCount;

  DebtorModel(
    this.subscriberName,
    this.phone,
    this.totalDebt,
    this.unpaidInvoicesCount,
  );
}

@DriftAccessor(tables: [Subscribers, Invoices, Payments])
class ReportsDao extends DatabaseAccessor<AppDatabase> with _$ReportsDaoMixin {
  ReportsDao(super.db);

  // 1. تقرير التحصيل اليومي (مجمع حسب طريقة الدفع)
  Future<List<DailyCollectionModel>> getDailyCollectionSummary(
    DateTime date,
  ) async {
    // تحديد بداية ونهاية اليوم
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final amount = payments.amount.sum();
    final count = payments.id.count();

    final query = selectOnly(payments)
      ..addColumns([amount, count, payments.paymentMethod])
      ..where(payments.paidAt.isBetweenValues(startOfDay, endOfDay))
      ..groupBy([payments.paymentMethod]);

    return query.map((row) {
      return DailyCollectionModel(
        row.read(amount) ?? 0.0,
        row.read(count) ?? 0,
        row.read(payments.paymentMethod),
      );
    }).get();
  }

  // 2. تقرير المتأخرات (أعلى المدينين)
  Future<List<DebtorModel>> getTopDebtors({int limit = 10}) async {
    final debtExpression = invoices.totalAmount - invoices.paidAmount;
    final totalDebt = debtExpression.sum();
    final invoiceCount = invoices.id.count();

    final query =
        select(subscribers).join([
            innerJoin(
              invoices,
              invoices.subscriberId.equalsExp(subscribers.id),
            ),
          ])
          ..where(invoices.status.isNotValue('paid'))
          ..addColumns([totalDebt, invoiceCount])
          ..groupBy([subscribers.id])
          ..orderBy([
            OrderingTerm(expression: totalDebt, mode: OrderingMode.desc),
          ])
          ..limit(limit);

    return query.map((row) {
      final sub = row.readTable(subscribers);
      return DebtorModel(
        sub.fullName,
        sub.phone ?? '',
        row.read(totalDebt) ?? 0.0,
        row.read(invoiceCount) ?? 0,
      );
    }).get();
  }
}
