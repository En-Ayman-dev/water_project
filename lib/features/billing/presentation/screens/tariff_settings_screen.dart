import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/tariff_form_controller.dart';

class TariffSettingsScreen extends ConsumerWidget {
  const TariffSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(tariffFormControllerProvider);
    final controller = ref.read(tariffFormControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('إعدادات التعرفة الجديدة')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. البيانات الأساسية
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('البيانات الأساسية', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextField(
                      controller: formState.nameController,
                      decoration: const InputDecoration(labelText: 'اسم التعرفة (مثال: تعرفة 2024)'),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: formState.fixedFeeController,
                      decoration: const InputDecoration(labelText: 'الرسوم الثابتة الشهرية'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. جدول الشرائح
            const Text('شرائح الاستهلاك', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: formState.slabs.length,
              itemBuilder: (context, index) {
                final slab = formState.slabs[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: slab.startController,
                            decoration: const InputDecoration(labelText: 'من'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: slab.endController,
                            decoration: const InputDecoration(labelText: 'إلى (اتركه فارغاً للنهاية)'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: slab.priceController,
                            decoration: const InputDecoration(labelText: 'السعر'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.removeSlab(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            OutlinedButton.icon(
              onPressed: controller.addSlab,
              icon: const Icon(Icons.add),
              label: const Text('إضافة شريحة'),
            ),
            const SizedBox(height: 24),

            // 3. منطقة المعاينة (Sandbox)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.science, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('محاكاة الحساب (Sandbox)', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'جرب إدخال كمية استهلاك (وحدة)',
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => controller.simulateCalculation(val),
                  ),
                  if (formState.previewResult != null) ...[
                    const Divider(height: 32),
                    _buildResultRow('الاستهلاك:', '${formState.previewResult!.consumptionAmount.toStringAsFixed(2)} ريال'),
                    _buildResultRow('الرسوم الثابتة:', '${formState.previewResult!.fixedFee.toStringAsFixed(2)} ريال'),
                    const Divider(),
                    _buildResultRow('الإجمالي:', '${formState.previewResult!.totalAmount.toStringAsFixed(2)} ريال', isBold: true),
                    const SizedBox(height: 8),
                    const Text('تفاصيل الشرائح:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ...formState.previewResult!.breakdowns.map((b) => Text(
                      '• [${b.start} - ${b.end ?? '∞'}]: ${b.unitsInSlab} وحدة × ${b.price} = ${b.amount}',
                      style: const TextStyle(fontSize: 12),
                    )),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. زر الحفظ
            FilledButton(
              onPressed: () async {
                await controller.saveToDatabase();
                if (context.mounted) Navigator.pop(context);
              },
              style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
              child: const Text('اعتماد التعرفة وحفظ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.green : null)),
        ],
      ),
    );
  }
}