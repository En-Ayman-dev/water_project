import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/services/adjustment_service.dart';
import '../controllers/adjustments_controller.dart';

class AdjustmentsApprovalScreen extends ConsumerWidget {
  const AdjustmentsApprovalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsync = ref.watch(pendingAdjustmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('اعتماد التسويات والإعفاءات')),
      body: requestsAsync.when(
        data: (requests) {
          if (requests.isEmpty) {
            return const Center(child: Text('لا توجد طلبات معلقة', style: TextStyle(fontSize: 18, color: Colors.grey)));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final item = requests[index];
              final adj = item.adjustment;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.subscriberName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Chip(
                            label: Text(adj.type == 'discount' ? 'خصم' : 'إعفاء'),
                            backgroundColor: Colors.orange.withOpacity(0.2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('المبلغ: ${adj.amount} ريال', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      if (item.invoiceNo != null)
                        Text('على الفاتورة: ${item.invoiceNo}'),
                      const SizedBox(height: 8),
                      Text('السبب: ${adj.reason}'),
                      const SizedBox(height: 8),
                      Text('مقدم الطلب: ${item.requesterName}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => _handleAction(context, ref, adj.id, false),
                            child: const Text('رفض', style: TextStyle(color: Colors.red)),
                          ),
                          const SizedBox(width: 8),
                          FilledButton(
                            onPressed: () => _handleAction(context, ref, adj.id, true),
                            child: const Text('اعتماد وتطبيق'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _handleAction(BuildContext context, WidgetRef ref, int id, bool approve) async {
    try {
      if (approve) {
        await ref.read(adjustmentServiceProvider).approveRequest(id);
      } else {
        await ref.read(adjustmentServiceProvider).rejectRequest(id);
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(approve ? 'تم الاعتماد بنجاح' : 'تم الرفض'),
          backgroundColor: approve ? Colors.green : Colors.grey,
        ));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red));
      }
    }
  }
}