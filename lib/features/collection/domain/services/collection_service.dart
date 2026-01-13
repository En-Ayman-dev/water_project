import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';

part 'collection_service.g.dart';

/// نتيجة معاينة الدفع (للعرض قبل الحفظ)
class PaymentPreview {
  final double totalToPay;
  final double remainingDebt;
  final List<AllocationPreview> allocations;

  PaymentPreview(this.totalToPay, this.remainingDebt, this.allocations);
}

class AllocationPreview {
  final Invoice invoice;
  final double amountToPay;
  final double remainingInvoiceBalance;
  final String newStatus;

  AllocationPreview(this.invoice, this.amountToPay, this.remainingInvoiceBalance, this.newStatus);
}

@riverpod
CollectionService collectionService( ref) {
  return CollectionService(ref.watch(appDatabaseProvider));
}

class CollectionService {
  final AppDatabase _db;

  CollectionService(this._db);

  /// 1. دالة لمعاينة التوزيع فقط (دون حفظ)
  Future<PaymentPreview> previewPaymentDistribution(int subscriberId, double paymentAmount) async {
    final unpaidInvoices = await (_db.select(_db.invoices)
          ..where((t) => t.subscriberId.equals(subscriberId) & t.status.isNotValue('paid'))
          ..orderBy([(t) => OrderingTerm(expression: t.issuedAt, mode: OrderingMode.asc)])) // FIFO
        .get();

    List<AllocationPreview> allocations = [];
    double remainingCash = paymentAmount;

    for (final inv in unpaidInvoices) {
      if (remainingCash <= 0) break;

      final double due = inv.totalAmount - inv.paidAmount;
      final double toPay = remainingCash >= due ? due : remainingCash;
      
      final double newPaidAmount = inv.paidAmount + toPay;
      final String newStatus = newPaidAmount >= inv.totalAmount ? 'paid' : 'partial';

      allocations.add(AllocationPreview(
        inv,
        toPay,
        inv.totalAmount - newPaidAmount,
        newStatus,
      ));

      remainingCash -= toPay;
    }

    // حساب الدين المتبقي الكلي للمشترك بعد هذه العملية
    // (تقريبي للمعاينة)
    return PaymentPreview(paymentAmount - remainingCash, remainingCash, allocations);
  }

  /// 2. دالة التحصيل الفعلية (Transaction)
  Future<int> collectPayment({
    required int subscriberId,
    required double amount,
    String method = 'cash',
    String? notes,
  }) async {
    return _db.transaction(() async {
      if (amount <= 0) throw Exception('المبلغ يجب أن يكون أكبر من صفر');

      // 1. جلب الفواتير (FIFO)
      final unpaidInvoices = await (_db.select(_db.invoices)
            ..where((t) => t.subscriberId.equals(subscriberId) & t.status.isNotValue('paid'))
            ..orderBy([(t) => OrderingTerm(expression: t.issuedAt, mode: OrderingMode.asc)]))
          .get();

      if (unpaidInvoices.isEmpty) throw Exception('لا توجد مستحقات على هذا المشترك');

      // 2. إنشاء سجل الإيصال (Payment Header)
      final receiptNo = 'RCPT-${DateTime.now().millisecondsSinceEpoch}'; // رقم تسلسلي بسيط
      final paymentId = await _db.into(_db.payments).insert(PaymentsCompanion(
        receiptNo: Value(receiptNo),
        subscriberId: Value(subscriberId),
        amount: Value(amount),
        paymentMethod: Value(method),
        notes: Value(notes),
        paidAt: Value(DateTime.now()),
        isLocked: const Value(true), // إقفال فوري
      ));

      double remainingCash = amount;

      // 3. التوزيع على الفواتير
      for (final inv in unpaidInvoices) {
        if (remainingCash <= 0) break;

        final double due = inv.totalAmount - inv.paidAmount;
        // نأخذ الأقل: إما المبلغ المتبقي معنا، أو المبلغ المستحق على الفاتورة
        final double toPay = remainingCash >= due ? due : remainingCash;

        // تحديث الفاتورة
        final double newPaidAmount = inv.paidAmount + toPay;
        final String newStatus = (newPaidAmount >= inv.totalAmount - 0.01) ? 'paid' : 'partial'; // 0.01 تسامح في الفواصل

        await (_db.update(_db.invoices)..where((t) => t.id.equals(inv.id))).write(
          InvoicesCompanion(
            paidAmount: Value(newPaidAmount),
            status: Value(newStatus),
          ),
        );

        // إنشاء التخصيص (Allocation)
        await _db.into(_db.paymentAllocations).insert(PaymentAllocationsCompanion(
          paymentId: Value(paymentId),
          invoiceId: Value(inv.id),
          amount: Value(toPay),
        ));

        remainingCash -= toPay;
      }

      // إذا بقي مبلغ فائض (Overpayment)
      if (remainingCash > 0) {
        // في MVP الحالي، نمنع الدفع بالزيادة لتجنب تعقيد الأرصدة الدائنة
        // يمكن تغيير هذا لاحقاً لإضافته في "محفظة المشترك"
        throw Exception('المبلغ المدفوع أكبر من إجمالي الدين المستحق (${amount - remainingCash})');
      }

      return paymentId;
    });
  }
}