import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart'; // تأكد من إضافة fl_chart في pubspec.yaml
import 'features/auth/presentation/controllers/auth_controller.dart';
// استيراد متحكم لوحة التحكم الجديد
import 'features/dashboard/presentation/controllers/dashboard_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;
    // مراقبة بيانات الإحصائيات
    final statsAsync = ref.watch(dashboardStatsProvider);

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
          // زر لتحديث الإحصائيات يدوياً
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'تحديث البيانات',
            onPressed: () => ref.refresh(dashboardStatsProvider),
          ),
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
            // 1. قسم الترحيب
            Text(
              'مرحباً بك، ${user.name}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              _getRoleName(user.role),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // 2. لوحة المعلومات (Dashboard) - تظهر عند تحميل البيانات
            statsAsync.when(
              data: (stats) => Column(
                children: [
                  // الصف الأول: المشتركين والعدادات
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: 'المشتركين',
                          value: '${stats.totalSubscribers}',
                          icon: Icons.people,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: 'العدادات',
                          value: '${stats.activeMeters}',
                          icon: Icons.speed,
                          color: Colors.green,
                          subtitle: '${stats.brokenMeters} معطل',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // الصف الثاني: المالية (للمدير والمحصل)
                  if (isCollector)
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            context,
                            title: 'ديون السوق',
                            value: _formatCurrency(stats.totalDebt),
                            icon: Icons.money_off,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildStatCard(
                            context,
                            title: 'تحصيل الشهر',
                            value: _formatCurrency(stats.monthlyCollection),
                            icon: Icons.attach_money,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 16),

                  // الرسم البياني (نسبة التحصيل)
                  if (isAdmin && stats.totalDebt > 0)
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 30,
                                  sections: [
                                    PieChartSectionData(
                                      color: Colors.teal,
                                      value: stats.collectionRate,
                                      title:
                                          '${stats.collectionRate.toStringAsFixed(0)}%',
                                      radius: 40,
                                      titleStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    PieChartSectionData(
                                      color: Colors.red.shade200,
                                      value: 100 - stats.collectionRate,
                                      title: '',
                                      radius: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'مؤشر الأداء',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'نسبة التحصيل مقابل الديون',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, s) => Container(
                padding: const EdgeInsets.all(12),
                color: Colors.red.withOpacity(0.1),
                child: Text(
                  'خطأ في تحميل الإحصائيات: $e',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),

            const Text(
              'القائمة الرئيسية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 3. شبكة الأزرار الديناميكية (القديمة)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                if (isCollector)
                  _buildActionCard(
                    context,
                    title: 'تحصيل جديد',
                    icon: Icons.payments,
                    color: Colors.green,
                    onTap: () => context.push('/collection'),
                  ),

                if (isReader)
                  _buildActionCard(
                    context,
                    title: 'إدخال القراءات',
                    icon: Icons.edit_note,
                    color: Colors.deepOrange,
                    onTap: () => context.push('/readings'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'سجل المشتركين',
                    icon: Icons.people,
                    color: Colors.blue,
                    onTap: () => context.go('/subscribers'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'سجل العدادات',
                    icon: Icons.speed,
                    color: Colors.orange,
                    onTap: () => context.go('/meters'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'إدارة الفوترة',
                    icon: Icons.receipt_long,
                    color: Colors.purple,
                    onTap: () => context.go('/billing'),
                  ),

                if (isCollector)
                  _buildActionCard(
                    context,
                    title: 'التقارير',
                    icon: Icons.bar_chart,
                    color: Colors.teal,
                    onTap: () => context.push('/reports'),
                  ),

                if (isCollector)
                  _buildActionCard(
                    context,
                    title: 'طلب خصم/تسوية',
                    icon: Icons.discount,
                    color: Colors.indigo,
                    onTap: () => context.push('/adjustment-request'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'اعتماد التسويات',
                    icon: Icons.gavel,
                    color: Colors.amber.shade800,
                    onTap: () => context.push('/adjustments-approval'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'سجل التدقيق',
                    icon: Icons.security,
                    color: Colors.blueGrey,
                    onTap: () => context.push('/audit-logs'),
                  ),

                if (isAdmin)
                  _buildActionCard(
                    context,
                    title: 'استيراد بيانات',
                    icon: Icons.upload_file,
                    color: Colors.green.shade800,
                    onTap: () => context.push('/import'),
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
      case 'admin':
        return 'مدير النظام';
      case 'collector':
        return 'موظف تحصيل';
      case 'reader':
        return 'قارئ عدادات';
      default:
        return role;
    }
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }

  // بطاقة الإحصائيات الصغيرة
  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    String? subtitle,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 20, color: color),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
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
