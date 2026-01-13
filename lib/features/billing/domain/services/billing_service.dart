import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../data/repository/tariff_repository_impl.dart';
import '../repository/tariff_repository.dart';
import 'pricing_calculator.dart';

part 'billing_service.g.dart';

class BillingResult {
  final int count;
  final double totalAmount;
  final List<String> errors;

  BillingResult(this.count, this.totalAmount, {this.errors = const []});
}

@riverpod
BillingService billingService( ref) {
  return BillingService(
    ref.watch(appDatabaseProvider),
    ref.watch(pricingCalculatorProvider),
    ref.watch(tariffRepositoryProvider),
  );
}

class BillingService {
  final AppDatabase _db;
  final PricingCalculator _calculator;
  final TariffRepository _tariffRepo;

  BillingService(this._db, this._calculator, this._tariffRepo);

  /// الدالة الرئيسية لتوليد الفواتير لدورة كاملة
  Future<BillingResult> generateInvoicesForCycle(int cycleId) async {
    return _db.transaction(() async {
      final errors = <String>[];
      int generatedCount = 0;
      double totalGeneratedAmount = 0.0;

      // 1. التحقق من الدورة
      final cycle = await (_db.select(_db.billingCycles)..where((t) => t.id.equals(cycleId))).getSingle();
      if (cycle.status != 'open') {
        throw Exception('لا يمكن توليد فواتير لدورة مغلقة');
      }

      // 2. جلب التعرفة النشطة
      final tariff = await _tariffRepo.getActiveTariff();
      if (tariff == null) {
        throw Exception('لا توجد تعرفة نشطة. يرجى إعداد التعرفة أولاً.');
      }
      final slabs = await _tariffRepo.getTariffSlabs(tariff.id);

      // 3. جلب القراءات لهذه الدورة (مع بيانات المشترك)
      // نستخدم join للوصول لبيانات المشترك والتأكد من حالته
      final query = _db.select(_db.meterReadings).join([
        innerJoin(_db.meters, _db.meters.id.equalsExp(_db.meterReadings.meterId)),
        innerJoin(_db.subscribers, _db.subscribers.id.equalsExp(_db.meters.subscriberId)),
      ]);
      query.where(_db.meterReadings.cycleId.equals(cycleId));

      final rows = await query.get();

      for (final row in rows) {
        final reading = row.readTable(_db.meterReadings);
        final subscriber = row.readTable(_db.subscribers);

        // تخطي المشتركين الملغيين
        if (subscriber.status == 'canceled') continue;

        // التحقق مما إذا كانت الفاتورة قد تم إصدارها بالفعل لهذا المشترك في هذه الدورة
        final existingInvoice = await (_db.select(_db.invoices)
              ..where((t) => t.cycleId.equals(cycleId) & t.subscriberId.equals(subscriber.id)))
            .getSingleOrNull();

        if (existingInvoice != null) {
          // تم إصدارها سابقاً، نتجاوزها
          continue;
        }

        // 4. حساب المتأخرات (Arrears)
        // المتأخرات = مجموع (الإجمالي - المدفوع) للفواتير السابقة التي لم تكتمل
        final arrearsQuery = _db.select(_db.invoices)
          ..where((t) => 
            t.subscriberId.equals(subscriber.id) & 
            t.status.isNotValue('paid') & 
            t.status.isNotValue('canceled') &
            t.cycleId.isSmallerThanValue(cycleId) // فقط الدورات السابقة
          );
        
        final previousInvoices = await arrearsQuery.get();
        double totalArrears = 0.0;
        for (var inv in previousInvoices) {
          totalArrears += (inv.totalAmount - inv.paidAmount);
        }

        // 5. حساب الفاتورة الحالية
        final calcResult = _calculator.calculateBill(
          units: reading.units,
          tariff: tariff,
          slabs: slabs,
        );

        // المبلغ النهائي يشمل المتأخرات
        final grandTotal = calcResult.totalAmount + totalArrears;

        // 6. الحفظ في قاعدة البيانات
        final invoiceNo = 'INV-${cycle.year}${cycle.month.toString().padLeft(2, '0')}-${subscriber.id}';

        final invoiceId = await _db.into(_db.invoices).insert(InvoicesCompanion(
          invoiceNo: Value(invoiceNo),
          subscriberId: Value(subscriber.id),
          cycleId: Value(cycleId),
          tariffId: Value(tariff.id),
          meterId: Value(reading.meterId),
          units: Value(reading.units),
          fixedFeeAmount: Value(calcResult.fixedFee),
          consumptionAmount: Value(calcResult.consumptionAmount),
          arrearsAmount: Value(totalArrears),
          totalAmount: Value(grandTotal),
          status: const Value('unpaid'),
        ));

        // حفظ تفاصيل الشرائح (التجميد)
        for (final bd in calcResult.breakdowns) {
          await _db.into(_db.invoiceSlabBreakdowns).insert(InvoiceSlabBreakdownsCompanion(
            invoiceId: Value(invoiceId),
            slabStartUnit: Value(bd.start),
            slabEndUnit: Value(bd.end),
            unitPrice: Value(bd.price),
            unitsInSlab: Value(bd.unitsInSlab),
            amount: Value(bd.amount),
          ));
        }

        generatedCount++;
        totalGeneratedAmount += grandTotal;
      }

      return BillingResult(generatedCount, totalGeneratedAmount, errors: errors);
    });
  }
}