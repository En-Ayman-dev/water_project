import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;
import '../controllers/reports_controller.dart';
// استيراد خدمة الطباعة
import '../../domain/services/reports_pdf_service.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // التاريخ الحالي للتقرير اليومي
    final today = DateTime.now();
    final collectionAsync = ref.watch(dailyCollectionReportProvider(today));
    final debtorsAsync = ref.watch(topDebtorsReportProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لوحة التقارير'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.today), text: 'تحصيل اليوم'),
              Tab(icon: Icon(Icons.warning_amber), text: 'الديون المتعثرة'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ================= التبويب 1: تحصيل اليوم =================
            collectionAsync.when(
              data: (data) {
                if (data.isEmpty) {
                  return _buildEmptyState('لا يوجد تحصيل مسجل لهذا اليوم');
                }
                
                double totalToday = 0;
                for (var item in data) totalToday += item.totalAmount;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // بطاقة الإجمالي الكبير
                      Card(
                        color: Colors.green.shade800,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              const Text('إجمالي إيراد اليوم', style: TextStyle(color: Colors.white70)),
                              const SizedBox(height: 8),
                              Text(
                                '${totalToday.toStringAsFixed(0)} ريال',
                                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                intl.DateFormat('yyyy-MM-dd').format(today),
                                style: const TextStyle(color: Colors.white38),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // زر الطباعة (جديد)
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () async {
                             try {
                               await ref.read(reportsPdfServiceProvider).printDailyCollectionReport(today);
                             } catch (e) {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ في الطباعة: $e')));
                             }
                          },
                          icon: const Icon(Icons.print),
                          label: const Text('طباعة التقرير اليومي (PDF)'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // التفاصيل حسب الطريقة
                      const Align(alignment: Alignment.centerRight, child: Text('ملخص العمليات:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            return ListTile(
                              leading: Icon(
                                item.method == 'cash' ? Icons.money : Icons.account_balance,
                                color: Colors.blue,
                              ),
                              title: Text(item.method == 'cash' ? 'نقدي (Cash)' : 'أخرى (${item.method})'),
                              subtitle: Text('${item.count} عمليات'),
                              trailing: Text(
                                '${item.totalAmount.toStringAsFixed(0)} ريال',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),

            // ================= التبويب 2: المدينين =================
            debtorsAsync.when(
              data: (debtors) {
                if (debtors.isEmpty) return _buildEmptyState('سجل نظيف! لا يوجد متعثرين');
                
                return Column(
                  children: [
                    // زر الطباعة (جديد)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () async {
                             try {
                               await ref.read(reportsPdfServiceProvider).printArrearsReport();
                             } catch (e) {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ في الطباعة: $e')));
                             }
                          },
                          icon: const Icon(Icons.print),
                          label: const Text('طباعة كشف المتأخرات (PDF)'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: Colors.red.shade700,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: debtors.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final debtor = debtors[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.red.shade100,
                              child: Text('${index + 1}', style: const TextStyle(color: Colors.red)),
                            ),
                            title: Text(debtor.subscriberName),
                            subtitle: Text(debtor.phone),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${debtor.totalDebt.toStringAsFixed(0)} ريال',
                                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  '${debtor.unpaidInvoicesCount} فواتير',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bar_chart, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}