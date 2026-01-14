import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;
import '../controllers/audit_controller.dart';

class AuditLogsScreen extends ConsumerWidget {
  const AuditLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(recentAuditLogsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('سجل التدقيق والمراقبة')),
      body: logsAsync.when(
        data: (logs) {
          if (logs.isEmpty) {
            return const Center(child: Text('السجل فارغ', style: TextStyle(color: Colors.grey)));
          }

          return ListView.separated(
            itemCount: logs.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = logs[index];
              return _buildLogTile(item);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildLogTile(AuditLogItem item) {
    final log = item.log;
    final dateStr = intl.DateFormat('yyyy-MM-dd HH:mm').format(log.createdAt);
    
    // تحديد الأيقونة واللون بناءً على نوع العملية
    IconData icon;
    Color color;

    if (log.action.contains('CREATE') || log.action.contains('ADD')) {
      icon = Icons.add_circle_outline;
      color = Colors.green;
    } else if (log.action.contains('UPDATE') || log.action.contains('EDIT')) {
      icon = Icons.edit;
      color = Colors.blue;
    } else if (log.action.contains('DELETE') || log.action.contains('REMOVE')) {
      icon = Icons.delete_outline;
      color = Colors.red;
    } else if (log.action.contains('APPROVE')) {
      icon = Icons.check_circle_outline;
      color = Colors.teal;
    } else if (log.action.contains('REJECT')) {
      icon = Icons.cancel_outlined;
      color = Colors.deepOrange;
    } else {
      icon = Icons.info_outline;
      color = Colors.grey;
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Row(
        children: [
          Text(
            _translateAction(log.action),
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(width: 8),
          Text(
            '(${_translateEntity(log.entityType)})',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (log.details != null)
            Text(log.details!, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.person, size: 12, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(item.userName ?? 'النظام', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              const SizedBox(width: 16),
              Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(dateStr, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  String _translateAction(String action) {
    // ترجمة بسيطة لأكواد العمليات
    switch (action) {
      case 'CREATE': return 'إضافة';
      case 'UPDATE': return 'تعديل';
      case 'DELETE': return 'حذف';
      case 'LOGIN': return 'تسجيل دخول';
      case 'REQUEST_ADJUSTMENT': return 'طلب تسوية';
      case 'APPROVE_ADJUSTMENT': return 'اعتماد تسوية';
      case 'REJECT_ADJUSTMENT': return 'رفض تسوية';
      case 'UPDATE_STATUS': return 'تغيير حالة';
      default: return action;
    }
  }

  String _translateEntity(String entity) {
    switch (entity) {
      case 'Subscriber': return 'مشترك';
      case 'Invoice': return 'فاتورة';
      case 'Payment': return 'إيصال';
      case 'Adjustment': return 'تسوية';
      case 'Tariff': return 'تعرفة';
      default: return entity;
    }
  }
}