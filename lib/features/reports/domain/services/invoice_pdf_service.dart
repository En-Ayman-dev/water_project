import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart' as intl;
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

part 'invoice_pdf_service.g.dart';

@riverpod
InvoicePdfService invoicePdfService( ref) {
  return InvoicePdfService(ref);
}

class InvoicePdfService {
  final  _ref;

  InvoicePdfService(this._ref);

  Future<void> printSpotInvoice(int meterReadingId) async {
    final db = _ref.read(appDatabaseProvider);

    // 1. جلب بيانات القراءة
    final reading = await (db.select(db.meterReadings)..where((t) => t.id.equals(meterReadingId))).getSingle();
    
    // 2. جلب بيانات العداد والمشترك
    final meter = await (db.select(db.meters)..where((t) => t.id.equals(reading.meterId))).getSingle();
    final sub = await (db.select(db.subscribers)..where((t) => t.id.equals(meter.subscriberId))).getSingle();

    // 3. جلب أو حساب الفاتورة المرتبطة (سنقوم بحساب القيم فوراً للعرض)
    // سنجلب التعرفة الحالية لحساب التكلفة التقديرية أو الحقيقية
    // للتبسيط في الفوترة الفورية، سنعرض الوحدات والمتأخرات
    
    // جلب المتأخرات السابقة (مجموع الفواتير غير المدفوعة سابقاً)
    final invoices = await (db.select(db.invoices)..where((t) => t.subscriberId.equals(sub.id) & t.status.isNotValue('paid'))).get();
    double totalArrears = 0;
    for(var inv in invoices) {
      totalArrears += (inv.totalAmount - inv.paidAmount);
    }

    // تصميم الفاتورة
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.notoSansArabicRegular();
    final fontBold = await PdfGoogleFonts.notoSansArabicBold();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80, // ورق حراري
        margin: const pw.EdgeInsets.all(10),
        build: (context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('فاتورة مياه', style: pw.TextStyle(font: fontBold, fontSize: 16)),
                pw.Divider(),
                _row('المشترك:', sub.fullName, font),
                _row('رقم العداد:', meter.meterNo, font),
                _row('التاريخ:', intl.DateFormat('yyyy-MM-dd').format(DateTime.now()), font),
                // pw.Divider(style: pw.BorderStyle.dashed),
                
                // تفاصيل القراءة
                _row('القراءة الحالية:', '${reading.currentReading}', fontBold),
                _row('القراءة السابقة:', '${reading.previousReading}', font),
                _row('الاستهلاك:', '${reading.units} وحدة', fontBold),
                
                // pw.Divider(style: pw.BorderStyle.dashed),
                
                // مخلص مالي (تقديري أو فعلي إذا تم توليد الفاتورة)
                // هنا سنعرض المتأخرات كأهم معلومة للمحصل
                _row('إجمالي المتأخرات:', '${totalArrears.toStringAsFixed(0)} ريال', fontBold),
                
                pw.SizedBox(height: 10),
                pw.Text('سدد فاتورتك أولاً بأول', style: pw.TextStyle(font: font, fontSize: 10)),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (format) => pdf.save(), name: 'Invoice_${sub.id}');
  }

  pw.Widget _row(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(font: font, fontSize: 10)),
          pw.Text(value, style: pw.TextStyle(font: font, fontSize: 10)),
        ],
      ),
    );
  }
}