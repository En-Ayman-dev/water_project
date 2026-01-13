import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/database/app_database.dart';
import '../../domain/services/pricing_calculator.dart';
import '../../data/repository/tariff_repository_impl.dart';

part 'tariff_form_controller.g.dart';

// حالة النموذج
class TariffFormState {
  final TextEditingController nameController;
  final TextEditingController fixedFeeController;
  final List<SlabItemState> slabs;
  final CalculationResult? previewResult; // نتيجة المعاينة

  TariffFormState({
    required this.nameController,
    required this.fixedFeeController,
    this.slabs = const [],
    this.previewResult,
  });
}

class SlabItemState {
  final TextEditingController startController;
  final TextEditingController endController;
  final TextEditingController priceController;

  SlabItemState()
    : startController = TextEditingController(),
      endController = TextEditingController(),
      priceController = TextEditingController();
}

@riverpod
class TariffFormController extends _$TariffFormController {
  @override
  @override
  TariffFormState build() {
    final nameCtrl = TextEditingController();
    final feeCtrl = TextEditingController(text: '100');
    final firstSlab = SlabItemState()..startController.text = '0';

    ref.onDispose(() {
      nameCtrl.dispose();
      feeCtrl.dispose();
      for (final s in [firstSlab, ...state.slabs]) {
        s.startController.dispose();
        s.endController.dispose();
        s.priceController.dispose();
      }
    });

    return TariffFormState(
      nameController: nameCtrl,
      fixedFeeController: feeCtrl,
      slabs: [firstSlab],
    );
  }

  void addSlab() {
    final newSlabs = List<SlabItemState>.from(state.slabs);

    // محاولة ذكية لتحديد بداية الشريحة الجديدة بناءً على نهاية السابقة
    String nextStart = '0';
    if (newSlabs.isNotEmpty) {
      final lastEnd = newSlabs.last.endController.text;
      if (lastEnd.isNotEmpty) {
        nextStart = lastEnd; // البداية تكون نفس نهاية السابق
      }
    }

    newSlabs.add(SlabItemState()..startController.text = nextStart);
    state = TariffFormState(
      nameController: state.nameController,
      fixedFeeController: state.fixedFeeController,
      slabs: newSlabs,
      previewResult: state.previewResult,
    );
  }

  void removeSlab(int index) {
    if (state.slabs.length <= 1) return; // منع حذف آخر شريحة
    final newSlabs = List<SlabItemState>.from(state.slabs)..removeAt(index);
    state = TariffFormState(
      nameController: state.nameController,
      fixedFeeController: state.fixedFeeController,
      slabs: newSlabs,
      previewResult: state.previewResult,
    );
  }

  // دالة المعاينة (Sandbox Logic)
  void simulateCalculation(String unitsStr) {
    final units = int.tryParse(unitsStr);
    if (units == null) {
      state = TariffFormState(
        nameController: state.nameController,
        fixedFeeController: state.fixedFeeController,
        slabs: state.slabs,
        previewResult: null,
      );
      return;
    }

    // تحويل مدخلات النموذج إلى كائنات مؤقتة للحساب
    final tempTariff = Tariff(
      id: 0,
      name: 'Temp',
      fixedFee: double.tryParse(state.fixedFeeController.text) ?? 0.0,
      effectiveFrom: DateTime.now(),
      isActive: true,
      createdAt: DateTime.now(),
    );

    final tempSlabs = state.slabs.map((s) {
      return TariffSlab(
        id: 0,
        tariffId: 0,
        startUnit: int.tryParse(s.startController.text) ?? 0,
        endUnit: int.tryParse(s.endController.text), // null يعني مفتوح
        unitPrice: double.tryParse(s.priceController.text) ?? 0.0,
      );
    }).toList();

    // استدعاء الحاسبة
    final calculator = ref.read(pricingCalculatorProvider);
    final result = calculator.calculateBill(
      units: units,
      tariff: tempTariff,
      slabs: tempSlabs,
    );

    state = TariffFormState(
      nameController: state.nameController,
      fixedFeeController: state.fixedFeeController,
      slabs: state.slabs,
      previewResult: result,
    );
  }

  Future<void> saveToDatabase() async {
    final name = state.nameController.text;
    final fixedFee = double.tryParse(state.fixedFeeController.text) ?? 0.0;

    final tariffCompanion = TariffsCompanion(
      name: drift.Value(name),
      fixedFee: drift.Value(fixedFee),
      effectiveFrom: drift.Value(DateTime.now()),
      isActive: const drift.Value(true),
    );

    final slabsCompanions = state.slabs.map((s) {
      return TariffSlabsCompanion(
        startUnit: drift.Value(int.tryParse(s.startController.text) ?? 0),
        endUnit: drift.Value(int.tryParse(s.endController.text)),
        unitPrice: drift.Value(double.tryParse(s.priceController.text) ?? 0.0),
      );
    }).toList();

    await ref
        .read(tariffRepositoryProvider)
        .createTariffWithSlabs(tariffCompanion, slabsCompanions);
  }
}
