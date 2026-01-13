import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/billing_cycle_controller.dart';

class CycleDetailsScreen extends ConsumerWidget {
  final int cycleId;

  const CycleDetailsScreen({super.key, required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. تحديد حالة الدورة الحالية (هل هي مغلقة؟)
    final cyclesList = ref.watch(billingCyclesListProvider).asData?.value ?? [];

    // محاولة العثور على الدورة، أو استخدام عنصر نائب لتجنب الخطأ أثناء التحميل
    final currentCycle = cyclesList.firstWhere(
      (c) => c.id == cycleId,
        orElse: () => cyclesList.first, // ✅ لا يرجّع null أبدًا
    );

    final isClosed = currentCycle.status == 'closed';

    final invoicesAsync = ref.watch(cycleInvoicesProvider(cycleId));
    final controller = ref.read(billingCycleControllerProvider.notifier);

    // نستمع لحالة الكونترولر لعرض التحميل أو الرسائل
    ref.listen(billingCycleControllerProvider, (prev, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('خطأ: ${next.error}')));
      }
      if (prev is AsyncLoading && next is! AsyncLoading) {
        // إذا لم يكن خطأ، فهي عملية ناجحة
        if (next is! AsyncError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تمت العملية بنجاح')));
        }
      }
    });

    final isLoading = ref.watch(billingCycleControllerProvider) is AsyncLoading;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${currentCycle.name} (${isClosed ? "مغلقة" : "مفتوحة"})',
          ),
          actions: [
            // زر الإقفال يظهر فقط إذا كانت الدورة مفتوحة
            if (!isClosed)
              IconButton(
                icon: const Icon(Icons.lock_outline, color: Colors.redAccent),
                tooltip: 'إقفال الدورة نهائياً',
                onPressed: () => _confirmCloseCycle(context, ref),
              ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'العمليات'),
              Tab(text: 'الفواتير الصادرة'),
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                // التبويب 1: العمليات
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // رسالة تنبيه إذا كانت مغلقة
                      if (isClosed)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.red.withOpacity(0.3),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.lock, color: Colors.red),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'هذه الدورة مغلقة محاسبيًا، لا يمكن إجراء تعديلات أو إصدار فواتير جديدة.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),

                      _buildActionCard(
                        context,
                        title: '1. تسجيل القراءات',
                        description:
                            'تسجيل قراءات العدادات للمشتركين لهذه الدورة.',
                        icon: Icons.speed,
                        buttonText: 'محاكاة قراءات (Test)',
                        // تعطيل الزر إذا كانت مغلقة أو جار التحميل
                        onTap: (isClosed || isLoading)
                            ? null
                            : () => controller.simulateRandomReadings(cycleId),
                        color: isClosed ? Colors.grey : Colors.orange,
                      ),
                      const SizedBox(height: 16),
                      _buildActionCard(
                        context,
                        title: '2. توليد الفواتير',
                        description:
                            'حساب وإصدار الفواتير بناءً على القراءات والتعرفة.',
                        icon: Icons.receipt_long,
                        buttonText: 'توليد الفواتير الآن',
                        // تعطيل الزر إذا كانت مغلقة أو جار التحميل
                        onTap: (isClosed || isLoading)
                            ? null
                            : () => controller.generateInvoices(cycleId),
                        color: isClosed ? Colors.grey : Colors.blue,
                      ),
                    ],
                  ),
                ),

                // التبويب 2: قائمة الفواتير
                invoicesAsync.when(
                  data: (invoices) {
                    if (invoices.isEmpty) {
                      return const Center(
                        child: Text('لم يتم إصدار فواتير بعد'),
                      );
                    }
                    return ListView.builder(
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final invoice = invoices[index];
                        return ListTile(
                          title: Text('مشترك #${invoice.subscriberId}'),
                          subtitle: Text('${invoice.units} وحدة'),
                          trailing: Text(
                            '${invoice.totalAmount.toStringAsFixed(2)} ريال',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          leading: const Icon(Icons.receipt),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, s) => Center(child: Text('خطأ: $e')),
                ),
              ],
            ),
            if (isLoading)
              Container(
                color: Colors.black54,
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  // نافذة تأكيد الإقفال
  void _confirmCloseCycle(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد إقفال الدورة'),
        content: const Text(
          'هل أنت متأكد من إقفال هذه الدورة الشهرية؟\n\n'
          '⚠️ لا يمكن التراجع عن هذا الإجراء.\n'
          '⚠️ لن تتمكن من إضافة قراءات أو تعديل فواتير بعد الآن.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ref
                  .read(billingCycleControllerProvider.notifier)
                  .closeCycle(cycleId);
              Navigator.pop(context);
            },
            child: const Text('نعم، إقفال نهائي'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required String buttonText,
    required VoidCallback? onTap,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onTap,
              style: FilledButton.styleFrom(backgroundColor: color),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
