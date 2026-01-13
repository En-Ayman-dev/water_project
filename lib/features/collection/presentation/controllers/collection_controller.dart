import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/database/app_database.dart';
import '../../domain/services/collection_service.dart';

part 'collection_controller.g.dart';

// حالة الواجهة
class CollectionState {
  final Subscriber? selectedSubscriber;
  final double totalDebt;
  final PaymentPreview? preview;
  final bool isLoading;

  CollectionState({
    this.selectedSubscriber,
    this.totalDebt = 0.0,
    this.preview,
    this.isLoading = false,
  });

  CollectionState copyWith({
    Subscriber? selectedSubscriber,
    double? totalDebt,
    PaymentPreview? preview,
    bool? isLoading,
  }) {
    return CollectionState(
      selectedSubscriber: selectedSubscriber ?? this.selectedSubscriber,
      totalDebt: totalDebt ?? this.totalDebt,
      preview: preview ?? this.preview,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CollectionController extends _$CollectionController {
  @override
  CollectionState build() {
    return CollectionState();
  }

  // 1. اختيار مشترك وحساب ديونه
  Future<void> selectSubscriber(Subscriber subscriber) async {
    state = state.copyWith(isLoading: true);
    
    final db = ref.read(appDatabaseProvider);
    
    // حساب الدين: فواتير غير مدفوعة (الإجمالي - المدفوع)
    final unpaidInvoices = await (db.select(db.invoices)
          ..where((t) => t.subscriberId.equals(subscriber.id) & t.status.isNotValue('paid')))
        .get();

    double debt = 0.0;
    for (var inv in unpaidInvoices) {
      debt += (inv.totalAmount - inv.paidAmount);
    }

    state = state.copyWith(
      selectedSubscriber: subscriber,
      totalDebt: debt,
      preview: null, // تصفير المعاينة السابقة
      isLoading: false,
    );
  }

  // 2. تحديث المعاينة عند تغيير المبلغ
  Future<void> updatePreview(String amountStr) async {
    final amount = double.tryParse(amountStr);
    if (amount == null || amount <= 0 || state.selectedSubscriber == null) {
      state = state.copyWith(preview: null);
      return;
    }

    final service = ref.read(collectionServiceProvider);
    final preview = await service.previewPaymentDistribution(
      state.selectedSubscriber!.id,
      amount,
    );

    state = state.copyWith(preview: preview);
  }

  // 3. تنفيذ الدفع
  Future<bool> submitPayment(String amountStr) async {
    final amount = double.tryParse(amountStr);
    if (amount == null || state.selectedSubscriber == null) return false;

    state = state.copyWith(isLoading: true);
    try {
      final service = ref.read(collectionServiceProvider);
      await service.collectPayment(
        subscriberId: state.selectedSubscriber!.id,
        amount: amount,
      );
      
      // إعادة تعيين الحالة بعد النجاح
      state = CollectionState(); 
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}