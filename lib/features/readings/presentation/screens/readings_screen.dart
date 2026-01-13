import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../billing/presentation/controllers/billing_cycle_controller.dart';
import '../controllers/readings_controller.dart';

class ReadingsScreen extends ConsumerStatefulWidget {
  const ReadingsScreen({super.key});

  @override
  ConsumerState<ReadingsScreen> createState() => _ReadingsScreenState();
}

class _ReadingsScreenState extends ConsumerState<ReadingsScreen> {
  BillingCycle? _selectedCycle;

  @override
  Widget build(BuildContext context) {
    // جلب الدورات لاختيار الدورة المفتوحة
    final cyclesAsync = ref.watch(billingCyclesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل القراءات')),
      body: cyclesAsync.when(
        data: (cycles) {
          // محاولة تحديد الدورة المفتوحة تلقائياً
          final openCycles = cycles.where((c) => c.status == 'open').toList();
          
          if (openCycles.isEmpty) {
            return const Center(child: Text('لا توجد دورة مفتوحة حالياً. يرجى فتح دورة أولاً.'));
          }

          // تحديد الدورة المختارة
          _selectedCycle ??= openCycles.first;

          return Column(
            children: [
              // شريط اختيار الدورة
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<BillingCycle>(
                  value: _selectedCycle,
                  decoration: const InputDecoration(
                    labelText: 'الدورة الحالية',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  items: openCycles.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text(c.name),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedCycle = val);
                  },
                ),
              ),
              
              const Divider(height: 1),

              // قائمة العدادات للدورة المختارة
              Expanded(
                child: _MetersList(cycleId: _selectedCycle!.id),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _MetersList extends ConsumerWidget {
  final int cycleId;

  const _MetersList({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readingsAsync = ref.watch(readingsControllerProvider(cycleId));

    return readingsAsync.when(
      data: (items) {
        if (items.isEmpty) return const Center(child: Text('لا توجد عدادات نشطة'));

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = items[index];
            final isRead = item.currentReading != null;

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: isRead ? Colors.green : Colors.orange,
                child: Icon(isRead ? Icons.check : Icons.hourglass_empty, color: Colors.white),
              ),
              title: Text(item.subscriber.fullName),
              subtitle: Text(
                'عداد: ${item.meter.meterNo} | السابقة: ${item.lastReadingValue}',
                style: const TextStyle(fontSize: 12),
              ),
              trailing: isRead 
                ? Text(
                    '${item.currentReading!.units} وحدة',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  )
                : const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: isRead 
                ? null // منع التعديل بعد القراءة (أو يمكن السماح به بصلاحية خاصة)
                : () => _showEntryDialog(context, ref, item),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }

  void _showEntryDialog(BuildContext context, WidgetRef ref, MeterReadingStatus item) {
    final controller = TextEditingController();
    int? consumption;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('إدخال قراءة: ${item.subscriber.fullName}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('القراءة السابقة:'),
                    Text('${item.lastReadingValue}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'القراءة الحالية',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.speed),
                  ),
                  onChanged: (val) {
                    final curr = int.tryParse(val);
                    if (curr != null) {
                      setState(() {
                        consumption = curr - item.lastReadingValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                if (consumption != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: consumption! >= 0 ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          consumption! >= 0 ? 'الاستهلاك: $consumption وحدة' : 'خطأ: القراءة أقل من السابقة!',
                          style: TextStyle(
                            color: consumption! >= 0 ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
              FilledButton(
                onPressed: (consumption == null || consumption! < 0) 
                  ? null 
                  : () async {
                      try {
                        await ref.read(readingsControllerProvider(cycleId).notifier).submitReading(
                          cycleId: cycleId,
                          meterId: item.meter.id,
                          currentVal: int.parse(controller.text),
                          previousVal: item.lastReadingValue,
                        );
                        if (context.mounted) Navigator.pop(context);
                      } catch (e) {
                         // Error handling handled by UI state mostly
                      }
                    },
                child: const Text('حفظ'),
              ),
            ],
          );
        },
      ),
    );
  }
}