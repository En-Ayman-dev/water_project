import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/excel_import_service.dart';

class ImportScreen extends ConsumerStatefulWidget {
  const ImportScreen({super.key});

  @override
  ConsumerState<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends ConsumerState<ImportScreen> {
  bool _isLoading = false;
  String _statusMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('استيراد البيانات (Excel)')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.file_upload, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              'تنبيه: يجب أن يكون ملف Excel بصيغة .xlsx ويحتوي على الأعمدة بالترتيب القياسي للنظام.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '(العمود الثاني للإسم - العمود الثالث عشر للمتأخرات السابقة)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 48),

            if (_isLoading)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('جاري المعالجة... يرجى الانتظار'),
                ],
              )
            else
              FilledButton.icon(
                onPressed: () => _startImport(ref),
                icon: const Icon(Icons.folder_open),
                label: const Text('اختيار ملف واستيراد'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),

            if (_statusMessage.isNotEmpty) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue.withOpacity(0.1),
                child: Text(
                  _statusMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _startImport(WidgetRef ref) async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final service = ref.read(excelImportServiceProvider);
      final count = await service.pickAndImportFile();

      // final count = await ref
          // .read(excelImportServiceProvider)
          // .pickAndImportFile();
      if (mounted) {
        setState(() {
          _statusMessage = count > 0
              ? 'تمت العملية بنجاح! \n تم استيراد $count مشترك.'
              : 'لم يتم استيراد أي بيانات (قد يكون الملف فارغاً أو تم الإلغاء).';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _statusMessage = 'حدث خطأ أثناء الاستيراد:\n$e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
