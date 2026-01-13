import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/meter_controller.dart';

class MetersScreen extends ConsumerWidget {
  const MetersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metersAsync = ref.watch(metersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل العدادات'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMeterDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      body: metersAsync.when(
        data: (meters) {
          if (meters.isEmpty) {
            return const Center(child: Text('لا توجد عدادات مسجلة'));
          }
          return ListView.builder(
            itemCount: meters.length,
            itemBuilder: (context, index) {
              final meter = meters[index];
              return ListTile(
                leading: const Icon(Icons.speed),
                title: Text('عداد رقم: ${meter.meterNo}'),
                subtitle: Text(
                  meter.subscriberId != null 
                      ? 'مرتبط بمشترك (ID: ${meter.subscriberId})' 
                      : 'غير مرتبط (مخزن)',
                  style: TextStyle(
                    color: meter.subscriberId != null ? Colors.blue : Colors.orange,
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(meter.status),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('خطأ: $err')),
      ),
    );
  }

  void _showAddMeterDialog(BuildContext context, WidgetRef ref) {
    final meterNoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة عداد جديد'),
        content: TextField(
          controller: meterNoController,
          decoration: const InputDecoration(
            labelText: 'رقم العداد (تسلسلي)',
            prefixIcon: Icon(Icons.qr_code),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () async {
              if (meterNoController.text.isNotEmpty) {
                await ref.read(meterControllerProvider.notifier).addMeter(
                  meterNoController.text,
                );
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }
}