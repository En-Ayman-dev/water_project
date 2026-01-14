import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../subscribers/presentation/controllers/subscriber_controller.dart';
import '../controllers/adjustment_request_controller.dart';

class AdjustmentRequestScreen extends ConsumerStatefulWidget {
  const AdjustmentRequestScreen({super.key});

  @override
  ConsumerState<AdjustmentRequestScreen> createState() => _AdjustmentRequestScreenState();
}

class _AdjustmentRequestScreenState extends ConsumerState<AdjustmentRequestScreen> {
  final _amountController = TextEditingController();
  final _reasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adjustmentRequestControllerProvider);
    final controller = ref.read(adjustmentRequestControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('طلب خصم / تسوية')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. اختيار المشترك
              _buildSubscriberSelector(context, ref, state.selectedSubscriber),
              const SizedBox(height: 16),

              // 2. اختيار الفاتورة (يظهر فقط عند اختيار مشترك)
              if (state.selectedSubscriber != null)
                Consumer(
                  builder: (context, ref, _) {
                    final invoicesAsync = ref.watch(subscriberInvoicesProvider(state.selectedSubscriber!.id));
                    
                    return invoicesAsync.when(
                      data: (invoices) {
                        return DropdownButtonFormField<Invoice>(
                          value: state.selectedInvoice,
                          decoration: const InputDecoration(
                            labelText: 'ربط بفاتورة معينة (اختياري)',
                            border: OutlineInputBorder(),
                            helperText: 'اتركه فارغاً إذا كان الخصم عاماً',
                          ),
                          items: [
                             const DropdownMenuItem<Invoice>(
                              value: null,
                              child: Text('بدون فاتورة محددة (خصم عام)'),
                            ),
                            ...invoices.map((inv) {
                            return DropdownMenuItem(
                              value: inv,
                              child: Text('${inv.invoiceNo} (${inv.totalAmount} ريال)'),
                            );
                          })],
                          onChanged: (val) => controller.selectInvoice(val),
                        );
                      },
                      loading: () => const LinearProgressIndicator(),
                      error: (e, s) => Text('خطأ في تحميل الفواتير: $e'),
                    );
                  },
                ),
              const SizedBox(height: 16),

              // 3. نوع التسوية
              DropdownButtonFormField<String>(
                value: state.type,
                decoration: const InputDecoration(
                  labelText: 'نوع العملية',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'discount', child: Text('خصم (Discount)')),
                  DropdownMenuItem(value: 'exempt', child: Text('إعفاء (Exemption)')),
                  DropdownMenuItem(value: 'penalty', child: Text('غرامة (Penalty)')),
                ],
                onChanged: (val) {
                  if (val != null) controller.setType(val);
                },
              ),
              const SizedBox(height: 16),

              // 4. المبلغ
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'قيمة المبلغ',
                  border: OutlineInputBorder(),
                  suffixText: 'ريال',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'مطلوب';
                  if (double.tryParse(val) == null) return 'رقم غير صحيح';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 5. السبب
              TextFormField(
                controller: _reasonController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'سبب التسوية (للتدقيق)',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.length < 5) return 'يرجى كتابة سبب واضح';
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // زر الإرسال
              FilledButton.icon(
                onPressed: state.isLoading ? null : () => _submit(context, controller),
                icon: state.isLoading 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) 
                  : const Icon(Icons.send),
                label: const Text('رفع الطلب للاعتماد'),
                style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, AdjustmentRequestController controller) async {
    if (!_formKey.currentState!.validate()) return;
    
    try {
      final success = await controller.submitRequest(
        amount: double.parse(_amountController.text),
        reason: _reasonController.text,
      );

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم رفع الطلب بنجاح، بانتظار الاعتماد'), backgroundColor: Colors.green),
        );
        Navigator.pop(context); // العودة للخلف
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Widget _buildSubscriberSelector(BuildContext context, WidgetRef ref, Subscriber? selected) {
    return InkWell(
      onTap: () => _showSubscriberSearchSheet(context, ref),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                selected?.fullName ?? 'اختر المشترك...',
                style: TextStyle(
                  fontSize: 16,
                  color: selected == null ? Colors.grey : null,
                  fontWeight: selected == null ? null : FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _showSubscriberSearchSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          final subscribersAsync = ref.watch(subscribersListProvider);
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('اختر المشترك', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: subscribersAsync.when(
                  data: (list) => ListView.builder(
                    controller: scrollController,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final sub = list[index];
                      return ListTile(
                        title: Text(sub.fullName),
                        subtitle: Text(sub.phone ?? '-'),
                        onTap: () {
                          ref.read(adjustmentRequestControllerProvider.notifier).selectSubscriber(sub);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, s) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}