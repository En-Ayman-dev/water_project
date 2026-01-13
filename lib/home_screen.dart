import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/controllers/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // تحديد الصلاحيات بناءً على الدور
    final isAdmin = user.role == 'admin';
    final isCollector = user.role == 'collector' || isAdmin;
    final isReader = user.role == 'reader' || isAdmin;

    return Scaffold(
      appBar: AppBar(
        title: const Text('نظام إدارة المياه'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'تسجيل الخروج',
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // بطاقة المستخدم
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحباً بك، ${user.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getRoleName(user.role),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'الوصول السريع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // شبكة الأزرار الديناميكية
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                // 1. قسم التحصيل (للمحصل والمدير)
                if (isCollector)
                  _buildActionCard(
                    context,
                    title: 'تحصيل جديد',
                    icon: Icons.payments,
                    color: Colors.green,
                    onTap: () => context.push('/collection'),
                  ),
                
                // 2. قسم القراءات (للقارئ والمدير)
                if (isReader)
                  _buildActionCard(
                    context,
                    title: 'إدخال القراءات',
                    icon: Icons.edit_note,
                    color: Colors.deepOrange,
                    onTap: () => context.push('/readings'),
                  ),

                // 3. قسم المشتركين (للمدير فقط)
                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'سجل المشتركين',
                    icon: Icons.people,
                    color: Colors.blue,
                    onTap: () => context.go('/subscribers'),
                  ),

                // 4. قسم العدادات (للمدير فقط)
                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'سجل العدادات',
                    icon: Icons.speed,
                    color: Colors.orange,
                    onTap: () => context.go('/meters'),
                  ),

                // 5. قسم الفوترة (للمدير فقط)
                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'إدارة الفوترة',
                    icon: Icons.receipt_long,
                    color: Colors.purple,
                    onTap: () => context.go('/billing'),
                  ),
                
                // 6. قسم التقارير (للمحصل والمدير)
                if (isCollector)
                  _buildActionCard(
                    context,
                    title: 'التقارير',
                    icon: Icons.bar_chart,
                    color: Colors.teal,
                    onTap: () => context.push('/reports'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getRoleName(String role) {
    switch (role) {
      case 'admin': return 'مدير النظام';
      case 'collector': return 'موظف تحصيل';
      case 'reader': return 'قارئ عدادات';
      default: return role;
    }
  }

  Widget _buildActionCard(BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}