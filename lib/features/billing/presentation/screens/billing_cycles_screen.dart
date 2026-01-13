import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/billing_cycle_controller.dart';

class BillingCyclesScreen extends ConsumerWidget {
  const BillingCyclesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyclesAsync = ref.watch(billingCyclesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الدورات الشهرية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_suggest),
            tooltip: 'إعدادات التعرفة',
            onPressed: () {
              // التوجيه لصفحة التعرفة
              context.push('/billing/tariff-settings');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showOpenCycleDialog(context, ref),
        label: const Text('فتح دورة جديدة'),
        icon: const Icon(Icons.calendar_month),
      ),
      body: cyclesAsync.when(
        data: (cycles) {
          if (cycles.isEmpty) return const Center(child: Text('ابدأ بفتح دورة شهرية جديدة'));
          
          return ListView.builder(
            itemCount: cycles.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final cycle = cycles[index];
              final isOpen = cycle.status == 'open';
              
              return Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isOpen ? Colors.green : Colors.grey,
                    child: Icon(isOpen ? Icons.lock_open : Icons.lock, color: Colors.white),
                  ),
                  title: Text(cycle.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(isOpen ? 'مفتوحة - تقبل القراءات والفواتير' : 'مغلقة'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // الانتقال لصفحة التفاصيل (سنضيف المسار في الراوتر لاحقاً)
                    context.push('/cycles/${cycle.id}');
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('خطأ: $e')),
      ),
    );
  }

  void _showOpenCycleDialog(BuildContext context, WidgetRef ref) {
    // تبسيط: نختار الشهر الحالي افتراضياً
    final now = DateTime.now();
    int selectedYear = now.year;
    int selectedMonth = now.month;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('فتح دورة شهرية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('سيتم فتح دورة لشهر: $selectedMonth / $selectedYear'),
            const SizedBox(height: 8),
            const Text('تأكد من إغلاق الدورات السابقة قبل البدء.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          FilledButton(
            onPressed: () {
              ref.read(billingCycleControllerProvider.notifier).openNewCycle(selectedYear, selectedMonth);
              Navigator.pop(context);
            },
            child: const Text('تأكيد وفتح'),
          ),
        ],
      ),
    );
  }
}