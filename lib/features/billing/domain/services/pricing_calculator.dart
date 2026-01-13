import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';

part 'pricing_calculator.g.dart';

class CalculationResult {
  final int totalUnits;
  final double consumptionAmount;
  final double fixedFee;
  final double totalAmount;
  final List<SlabBreakdown> breakdowns;

  CalculationResult({
    required this.totalUnits,
    required this.consumptionAmount,
    required this.fixedFee,
    required this.totalAmount,
    required this.breakdowns,
  });
}

class SlabBreakdown {
  final int start;
  final int? end;
  final double price;
  final int unitsInSlab;
  final double amount;

  SlabBreakdown({
    required this.start,
    required this.end,
    required this.price,
    required this.unitsInSlab,
    required this.amount,
  });
}

@riverpod
PricingCalculator pricingCalculator( ref) {
  return PricingCalculator();
}

class PricingCalculator {
  CalculationResult calculateBill({
    required int units,
    required Tariff tariff,
    required List<TariffSlab> slabs,
  }) {
    double totalConsumptionAmount = 0.0;
    List<SlabBreakdown> breakdowns = [];
    int remainingUnits = units;

    // التأكد من ترتيب الشرائح
    slabs.sort((a, b) => a.startUnit.compareTo(b.startUnit));

    for (var slab in slabs) {
      if (remainingUnits <= 0) break;

      int slabRange;
      if (slab.endUnit == null) {
        // شريحة مفتوحة (إلى ما لا نهاية)
        slabRange = remainingUnits;
      } else {
        // حساب حجم الشريحة (مثلاً من 0 إلى 20 = 20 وحدة)
        // ملاحظة: نفترض هنا الشرائح متصلة وتبدأ من 0
        // المنطق الدقيق يعتمد على (end - start) للشريحة الحالية بالنسبة لاستهلاكنا
        // الأسهل للحساب التراكمي:
        slabRange = slab.endUnit! - slab.startUnit; 
      }

      int unitsInThisSlab = 0;
      if (remainingUnits >= slabRange) {
        unitsInThisSlab = slabRange;
      } else {
        unitsInThisSlab = remainingUnits;
      }

      double amount = unitsInThisSlab * slab.unitPrice;
      totalConsumptionAmount += amount;
      remainingUnits -= unitsInThisSlab;

      breakdowns.add(SlabBreakdown(
        start: slab.startUnit,
        end: slab.endUnit,
        price: slab.unitPrice,
        unitsInSlab: unitsInThisSlab,
        amount: amount,
      ));
    }

    return CalculationResult(
      totalUnits: units,
      consumptionAmount: totalConsumptionAmount,
      fixedFee: tariff.fixedFee,
      totalAmount: totalConsumptionAmount + tariff.fixedFee,
      breakdowns: breakdowns,
    );
  }
}