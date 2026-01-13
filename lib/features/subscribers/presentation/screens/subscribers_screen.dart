import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/subscriber_controller.dart';

class SubscribersScreen extends ConsumerWidget {
  const SubscribersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // الاستماع لقائمة المشتركين
    final subscribersAsync = ref.watch(subscribersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة المشتركين'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddSubscriberDialog(context, ref),
        icon: const Icon(Icons.person_add),
        label: const Text('مشترك جديد'),
      ),
      body: subscribersAsync.when(
        data: (subscribers) {
          if (subscribers.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('لا يوجد مشتركين حتى الآن'),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: subscribers.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final sub = subscribers[index];
              final isActive = sub.status == 'active';
              
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: isActive ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  child: Icon(
                    isActive ? Icons.check : Icons.block,
                    color: isActive ? Colors.green : Colors.red,
                  ),
                ),
                title: Text(
                  sub.fullName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('رقم الهاتف: ${sub.phone ?? '-'}'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {
                    // هنا يمكن فتح نافذة التعديل لاحقاً
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('خاصية التعديل قادمة قريباً')),
                    );
                  },
                ),
                onTap: () {
                  // عرض التفاصيل
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('خطأ: $err')),
      ),
    );
  }

  void _showAddSubscriberDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final areaIdController = TextEditingController(text: '1'); // افتراضي مؤقتاً

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة مشترك جديد'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'الاسم الكامل'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'رقم الهاتف'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: areaIdController,
              decoration: const InputDecoration(labelText: 'رقم المنطقة (ID)'),
              keyboardType: TextInputType.number,
              autofillHints: const [AutofillHints.postalCode],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty) {
                // استدعاء الكونترولر للإضافة
                await ref.read(subscriberControllerProvider.notifier).addSubscriber(
                      fullName: nameController.text,
                      phone: phoneController.text,
                      areaId: int.tryParse(areaIdController.text) ?? 1,
                    );
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }
}