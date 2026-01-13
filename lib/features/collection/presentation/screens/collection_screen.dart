import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../subscribers/presentation/controllers/subscriber_controller.dart';
import '../controllers/collection_controller.dart';

class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({super.key});

  @override
  ConsumerState<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends ConsumerState<CollectionScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(collectionControllerProvider);
    final controller = ref.read(collectionControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('تحصيل الفواتير')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. قسم اختيار المشترك
            _buildSubscriberSelector(context, ref, state.selectedSubscriber),
            const SizedBox(height: 16),

            // 2. بطاقة الديون
            if (state.selectedSubscriber != null) ...[
              Card(
                color: state.totalDebt > 0 ? Colors.red.shade900.withOpacity(0.3) : Colors.green.shade900.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text('إجمالي المديونية المستحقة', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      Text(
                        '${state.totalDebt.toStringAsFixed(2)} ريال',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 3. إدخال المبلغ
              TextField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'المبلغ المستلم',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _amountController.clear();
                      controller.updatePreview('');
                    },
                  ),
                ),
                onChanged: (val) => controller.updatePreview(val),
              ),
              const SizedBox(height: 16),

              // 4. معاينة التوزيع (Simulation)
              if (state.preview != null && state.preview!.allocations.isNotEmpty) ...[
                const Text('معاينة التوزيع (FIFO):', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.preview!.allocations.length,
                  itemBuilder: (context, index) {
                    final alloc = state.preview!.allocations[index];
                    final isFullPay = alloc.newStatus == 'paid';
                    
                    return ListTile(
                      dense: true,
                      leading: Icon(
                        isFullPay ? Icons.check_circle : Icons.timelapse,
                        color: isFullPay ? Colors.green : Colors.orange,
                      ),
                      title: Text(alloc.invoice.invoiceNo),
                      subtitle: Text('سيتم سداد: ${alloc.amountToPay.toStringAsFixed(2)} ريال'),
                      trailing: Text(
                        isFullPay ? 'سداد كامل' : 'متبقي: ${alloc.remainingInvoiceBalance.toStringAsFixed(2)}',
                        style: TextStyle(color: isFullPay ? Colors.green : Colors.orange, fontSize: 12),
                      ),
                    );
                  },
                ),
                const Divider(),
                if (state.preview!.remainingDebt > 0.1) 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'سيبقى رصيد مدين بعد الدفع: ${state.preview!.remainingDebt.toStringAsFixed(2)} ريال',
                      style: const TextStyle(color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                
                const SizedBox(height: 16),
                
                // 5. زر التنفيذ
                FilledButton.icon(
                  onPressed: state.isLoading 
                    ? null 
                    : () async {
                        try {
                          final success = await controller.submitPayment(_amountController.text);
                          if (success && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم التحصيل وحفظ الإيصال بنجاح!')),
                            );
                            _amountController.clear();
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red),
                            );
                          }
                        }
                      },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: state.isLoading 
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                    : const Icon(Icons.print),
                  label: const Text('اعتماد التحصيل وإصدار الإيصال'),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  // ودجت اختيار المشترك (Modal Bottom Sheet)
  Widget _buildSubscriberSelector(BuildContext context, WidgetRef ref, Subscriber? selected) {
    return InkWell(
      onTap: () => _showSubscriberSearchSheet(context, ref),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.person_search, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('المشترك', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(
                    selected?.fullName ?? 'اضغط لاختيار مشترك...',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
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
          return Consumer(
            builder: (context, ref, _) {
              // نعيد استخدام مزود قائمة المشتركين الموجود سابقاً
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
                            leading: const CircleAvatar(child: Icon(Icons.person)),
                            title: Text(sub.fullName),
                            subtitle: Text(sub.phone ?? '-'),
                            onTap: () {
                              ref.read(collectionControllerProvider.notifier).selectSubscriber(sub);
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
          );
        },
      ),
    );
  }
}