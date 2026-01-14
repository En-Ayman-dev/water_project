import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../billing/presentation/controllers/billing_cycle_controller.dart';
import '../../../reports/domain/services/invoice_pdf_service.dart';
import '../controllers/readings_controller.dart';

class ReadingsScreen extends ConsumerWidget {
  const ReadingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. جلب الدورات لمعرفة الدورة المفتوحة حالياً
    final cyclesAsync = ref.watch(billingCyclesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('إدخال القراءات')),
      body: cyclesAsync.when(
        data: (cycles) {
          // البحث عن الدورة المفتوحة
          final openCycle = cycles.where((c) => c.status == 'open').firstOrNull;

          if (openCycle == null) {
            return _buildNoCycleState();
          }

          // إذا وجدت دورة مفتوحة، نعرض قائمة العدادات الخاصة بها
          return _ReadingsList(cycleId: openCycle.id);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('خطأ: $e')),
      ),
    );
  }

  Widget _buildNoCycleState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock_clock, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'لا توجد دورة مفتوحة حالياً',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('يجب فتح دورة شهرية جديدة من قسم "إدارة الفوترة" أولاً'),
        ],
      ),
    );
  }
}

class _ReadingsList extends ConsumerWidget {
  final int cycleId;
  const _ReadingsList({required this.cycleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readingsAsync = ref.watch(readingsControllerProvider(cycleId));

    return readingsAsync.when(
      data: (readings) {
        if (readings.isEmpty) {
          return const Center(child: Text('لا يوجد مشتركين نشطين'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: readings.length,
          itemBuilder: (context, index) {
            final item = readings[index];
            final isRecorded = item.currentReading != null;

            return Card(
              // تمييز القراءة المسجلة بلون مختلف
              color: isRecorded ? Colors.green.withOpacity(0.1) : null,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isRecorded ? Colors.green : Colors.grey,
                  child: Icon(
                    isRecorded ? Icons.check : Icons.hourglass_empty,
                    color: Colors.white,
                  ),
                ),
                title: Text(item.subscriber.fullName),
                subtitle: Text('العداد: ${item.meter.meterNo}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isRecorded) ...[
                      Text(
                        '${item.currentReading!.currentReading}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'استهلاك: ${item.currentReading!.units}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ] else ...[
                      const Text(
                        'السابقة:',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      Text(
                        '${item.lastReadingValue}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
                onTap: () => _showReadingDialog(context, ref, item, cycleId),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }

  // نافذة إدخال القراءة
  // نافذة إدخال القراءة مع الطباعة الفورية
  void _showReadingDialog(
    BuildContext context,
    WidgetRef ref,
    MeterReadingStatus item,
    int cycleId,
  ) {
    final controller = TextEditingController();
    if (item.currentReading != null) {
      controller.text = item.currentReading!.currentReading.toString();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('قراءة: ${item.subscriber.fullName}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'السابقة: ${item.lastReadingValue}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_back, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'أدخل القراءة الحالية',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.speed),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          // زر الحفظ والطباعة
          FilledButton.icon(
            icon: const Icon(Icons.print),
            label: const Text('حفظ وطباعة الفاتورة'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green, // لون مميز للعملية
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () async {
              final currentVal = int.tryParse(controller.text);
              if (currentVal == null) return;

              try {
                // 1. حفظ القراءة
                // ملاحظة: نحتاج تعديل submitReading لترجع ID القراءة الجديدة لنطبعه
                // سنقوم بحيلة بسيطة: نحفظ ثم نجلب آخر قراءة لهذا العداد
                await ref
                    .read(readingsControllerProvider(cycleId).notifier)
                    .submitReading(
                      cycleId: cycleId,
                      meterId: item.meter.id,
                      currentVal: currentVal,
                      previousVal: item.lastReadingValue,
                    );

                if (context.mounted) {
                  Navigator.pop(context); // إغلاق الديالوج

                  // 2. البحث عن القراءة التي تم حفظها للتو للطباعة
                  // (يمكن تحسين هذا بجعل الكنترولر يرجع الـ ID، لكن هذا يعمل حالياً)
                  final db = ref.read(appDatabaseProvider);
                  final reading =
                      await (db.select(db.meterReadings)..where(
                            (t) =>
                                t.cycleId.equals(cycleId) &
                                t.meterId.equals(item.meter.id),
                          ))
                          .getSingle();

                  // 3. استدعاء خدمة طباعة الفاتورة
                  // استيراد: import '../../domain/services/invoice_pdf_service.dart';
                  await ref
                      .read(invoicePdfServiceProvider)
                      .printSpotInvoice(reading.id);
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('خطأ: ${e.toString()}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
