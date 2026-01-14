import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/services/adjustment_service.dart';

part 'adjustment_request_controller.g.dart';

// حالة النموذج
class AdjustmentRequestState {
  final Subscriber? selectedSubscriber;
  final Invoice? selectedInvoice;
  final String type; // discount, exempt, penalty
  final bool isLoading;

  AdjustmentRequestState({
    this.selectedSubscriber,
    this.selectedInvoice,
    this.type = 'discount',
    this.isLoading = false,
  });

  AdjustmentRequestState copyWith({
    Subscriber? selectedSubscriber,
    Invoice? selectedInvoice,
    String? type,
    bool? isLoading,
  }) {
    return AdjustmentRequestState(
      selectedSubscriber: selectedSubscriber ?? this.selectedSubscriber,
      selectedInvoice: selectedInvoice ?? this.selectedInvoice, // يمكن أن يكون null
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AdjustmentRequestController extends _$AdjustmentRequestController {
  @override
  AdjustmentRequestState build() {
    return AdjustmentRequestState();
  }

  void selectSubscriber(Subscriber sub) {
    // عند تغيير المشترك، نصفر الفاتورة المختارة
    state = state.copyWith(selectedSubscriber: sub, selectedInvoice: null);
  }

  void selectInvoice(Invoice? invoice) {
    state = state.copyWith(selectedInvoice: invoice);
  }

  void setType(String type) {
    state = state.copyWith(type: type);
  }

  Future<bool> submitRequest({
    required double amount,
    required String reason,
  }) async {
    if (state.selectedSubscriber == null) return false;

    state = state.copyWith(isLoading: true);

    try {
      final service = ref.read(adjustmentServiceProvider);
      
      await service.submitRequest(
        subscriberId: state.selectedSubscriber!.id,
        invoiceId: state.selectedInvoice?.id,
        type: state.type,
        amount: amount,
        reason: reason,
      );

      // إعادة تعيين الحالة بعد النجاح
      state = AdjustmentRequestState();
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
@riverpod
Future<List<dynamic>> subscriberInvoices(Ref ref, int subscriberId) async  {
  final db = ref.read(appDatabaseProvider);
  return (db.select(db.invoices)
        ..where((t) => t.subscriberId.equals(subscriberId))
        ..orderBy([
          (t) => OrderingTerm(expression: t.issuedAt, mode: OrderingMode.desc)
        ]))
      .get();
}
