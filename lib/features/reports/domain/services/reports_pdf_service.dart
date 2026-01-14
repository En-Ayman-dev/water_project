import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart' as intl;
import 'package:drift/drift.dart'; // لاستخدام innerJoin وغيرها
import '../../../../core/database/app_database.dart';

part 'reports_pdf_service.g.dart';

@riverpod
ReportsPdfService reportsPdfService( ref) {
  return ReportsPdfService(ref);
}

class ReportsPdfService {
  final  _ref;

  ReportsPdfService(this._ref);

  /// 1. طباعة تقرير التحصيل اليومي
  Future<void> printDailyCollectionReport(DateTime date) async {
    final db = _ref.read(appDatabaseProvider);
    
    // تحديد بداية ونهاية اليوم
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    // جلب المدفوعات مع أسماء المشتركين والمحصلين
    final query = db.select(db.payments).join([
      innerJoin(db.subscribers, db.subscribers.id.equalsExp(db.payments.subscriberId)),
      leftOuterJoin(db.users, db.users.id.equalsExp(db.payments.collectorId)),
    ]);

    query.where(db.payments.paidAt.isBetweenValues(startOfDay, endOfDay));
    query.orderBy([OrderingTerm.desc(db.payments.paidAt)]);

    final rows = await query.get();

    // حساب الإجمالي
    double totalAmount = 0;
    final List<List<String>> tableData = [];

    for (var row in rows) {
      final payment = row.readTable(db.payments);
      final sub = row.readTable(db.subscribers);
      final collector = row.readTableOrNull(db.users);

      totalAmount += payment.amount;

      tableData.add([
        payment.receiptNo.toString(),
        sub.fullName,
        '${payment.amount.toStringAsFixed(0)} ريال',
        collector?.name ?? '-',
        intl.DateFormat('HH:mm').format(payment.paidAt),
      ]);
    }

    // توليد PDF
    await _generatePdfDocument(
      title: 'تقرير التحصيل اليومي',
      subtitle: 'التاريخ: ${intl.DateFormat('yyyy-MM-dd').format(date)}',
      headers: ['رقم السند', 'اسم المشترك', 'المبلغ', 'المحصل', 'الوقت'],
      data: tableData,
      totalLabel: 'إجمالي التحصيل',
      totalValue: '${totalAmount.toStringAsFixed(0)} ريال',
    );
  }

  /// 2. طباعة كشف المتأخرات (الديون)
  Future<void> printArrearsReport() async {
    final db = _ref.read(appDatabaseProvider);

    // جلب الفواتير غير المدفوعة وتجميعها حسب المشترك
    // بما أن Drift لا يدعم GroupBy المعقد بسهولة في Dart المباشر، سنجلب الفواتير ونعالجها
    final invoices = await (db.select(db.invoices).join([
       innerJoin(db.subscribers, db.subscribers.id.equalsExp(db.invoices.subscriberId)),
    ])..where(db.invoices.status.isNotValue('paid'))).get();

    // تجميع الديون لكل مشترك
    final Map<String, double> debtMap = {};
    
    for (var row in invoices) {
      final invoice = row.readTable(db.invoices);
      final sub = row.readTable(db.subscribers);
      
      final debt = invoice.totalAmount - invoice.paidAmount;
      if (debt > 0) {
        debtMap[sub.fullName] = (debtMap[sub.fullName] ?? 0) + debt;
      }
    }

    // تحويل للخريطة وترتيبها من الأكبر للأصغر
    var sortedEntries = debtMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // الأكبر أولاً

    final List<List<String>> tableData = [];
    double totalArrears = 0;

    for (var entry in sortedEntries) {
      totalArrears += entry.value;
      tableData.add([
        entry.key, // الاسم
        '${entry.value.toStringAsFixed(0)} ريال', // المبلغ
        'مستحق', // ملاحظات
      ]);
    }

    await _generatePdfDocument(
      title: 'كشف المتأخرات والديون',
      subtitle: 'تقرير بأرصدة المشتركين المدينين (الأعلى مديونية)',
      headers: ['اسم المشترك', 'إجمالي الدين', 'الحالة'],
      data: tableData,
      totalLabel: 'إجمالي الديون في السوق',
      totalValue: '${totalArrears.toStringAsFixed(0)} ريال',
    );
  }

  /// دالة مساعدة عامة لبناء ملف PDF مع جدول
  Future<void> _generatePdfDocument({
    required String title,
    required String subtitle,
    required List<String> headers,
    required List<List<String>> data,
    required String totalLabel,
    required String totalValue,
  }) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.notoSansArabicRegular();
    final fontBold = await PdfGoogleFonts.notoSansArabicBold();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(base: font, bold: fontBold),
        build: (context) => [
          pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                // الترويسة
                pw.Header(
                  level: 0,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('نظام إدارة المياه', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                      pw.Text(title, style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
                    ],
                  ),
                ),
                pw.Text(subtitle, style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey700)),
                pw.SizedBox(height: 20),

                // الجدول
                pw.TableHelper.fromTextArray(
                  headers: headers,
                  data: data,
                  border: null,
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
                  headerDecoration: const pw.BoxDecoration(color: PdfColors.blue700),
                  rowDecoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey300))),
                  cellAlignment: pw.Alignment.centerLeft,
                  cellAlignments: {
                    0: pw.Alignment.centerRight, // محاذاة العمود الأول لليمين (عربي)
                    1: pw.Alignment.centerRight,
                  },
                ),
                pw.Divider(),

                // الإجمالي
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  margin: const pw.EdgeInsets.only(top: 10),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text('$totalLabel: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text(totalValue, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.red, fontSize: 14)),
                    ],
                  ),
                ),
                
                pw.SizedBox(height: 20),
                pw.Footer(
                  leading: pw.Text(intl.DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()), style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
                  trailing: pw.Text('صفحة ${context.pageNumber} من ${context.pagesCount}', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
      name: 'Report_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}