import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../core/database/app_database.dart';

part 'receipt_service.g.dart';

@riverpod
ReceiptService receiptService(ref) {
  return ReceiptService(ref);
}

class ReceiptService {
  final _ref;

  ReceiptService(this._ref);

  Future<void> printReceipt(int paymentId) async {
    final db = _ref.read(appDatabaseProvider);

    // 1. جلب بيانات الإيصال
    final payment = await (db.select(
      db.payments,
    )..where((t) => t.id.equals(paymentId))).getSingle();

    // 2. جلب بيانات المشترك
    final subscriber = await (db.select(
      db.subscribers,
    )..where((t) => t.id.equals(payment.subscriberId))).getSingle();

    // 3. جلب المنطقة
    final area = await (db.select(
      db.areas,
    )..where((t) => t.id.equals(subscriber.areaId))).getSingle();

    // 4. الحسابات المالية (المتأخرات - المسلم - الباقي)
    final allInvoices = await (db.select(
      db.invoices,
    )..where((t) => t.subscriberId.equals(subscriber.id))).get();

    double remainingDebt = 0.0;
    for (var inv in allInvoices) {
      if (inv.status != 'paid') {
        remainingDebt += (inv.totalAmount - inv.paidAmount);
      }
    }

    final double paidNow = payment.amount;
    final double previousDebt = remainingDebt + paidNow;

    // 5. إعداد ملف PDF
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.notoSansArabicRegular();
    final fontBold = await PdfGoogleFonts.notoSansArabicBold();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.DefaultTextStyle(
              style: pw.TextStyle(font: font, fontSize: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                children: [
                  // ===== Header (احترافي + محاذاة) =====
                  pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Text(
                          'نظام إدارة المياه',
                          style: pw.TextStyle(font: fontBold, fontSize: 18),
                        ),
                        pw.SizedBox(height: 2),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(width: 0.8),
                            borderRadius: const pw.BorderRadius.all(
                              pw.Radius.circular(6),
                            ),
                          ),
                          child: pw.Text(
                            'سند قبض',
                            style: pw.TextStyle(font: fontBold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 8),
                  _solidDivider(),
                  pw.SizedBox(height: 6),

                  // ===== Receipt Meta =====
                  _buildKeyValueBlock(
                    font: font,
                    fontBold: fontBold,
                    rows: [
                      _kv('رقم السند', '#${payment.receiptNo}'),
                      _kv(
                        'التاريخ',
                        intl.DateFormat(
                          'yyyy-MM-dd HH:mm',
                        ).format(payment.paidAt),
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 6),
                  _dashedDivider(),
                  pw.SizedBox(height: 6),

                  // ===== Subscriber Info =====
                  pw.Text(
                    'بيانات المشترك',
                    style: pw.TextStyle(font: fontBold, fontSize: 11),
                  ),
                  pw.SizedBox(height: 4),

                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(width: 0.8),
                      borderRadius: const pw.BorderRadius.all(
                        pw.Radius.circular(6),
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        _buildRow('المشترك:', subscriber.fullName, fontBold),
                        _buildRow('المنطقة:', area.name, font),
                        _buildRow('رقم الهاتف:', subscriber.phone ?? '-', font),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 8),
                  _dashedDivider(),
                  pw.SizedBox(height: 8),

                  // ===== Financial Box =====
                  pw.Text(
                    'الملخص المالي',
                    style: pw.TextStyle(font: fontBold, fontSize: 11),
                  ),
                  pw.SizedBox(height: 4),

                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(width: 1),
                      borderRadius: const pw.BorderRadius.all(
                        pw.Radius.circular(6),
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        _buildMoneyRow(
                          'المتأخرات السابقة:',
                          previousDebt,
                          font,
                        ),
                        pw.SizedBox(height: 4),
                        _thinDivider(),
                        pw.SizedBox(height: 4),

                        // المسلم بشكل بارز
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 6,
                          ),
                          decoration: pw.BoxDecoration(
                            color: PdfColors.grey200,
                            borderRadius: const pw.BorderRadius.all(
                              pw.Radius.circular(6),
                            ),
                          ),
                          child: _buildMoneyRow(
                            'المسلم (المدفوع):',
                            paidNow,
                            fontBold,
                            isLarge: true,
                          ),
                        ),

                        pw.SizedBox(height: 4),
                        _thinDivider(),
                        pw.SizedBox(height: 4),

                        _buildMoneyRow('الباقي عليه:', remainingDebt, font),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 10),
                  _solidDivider(),
                  pw.SizedBox(height: 8),

                  // ===== Footer =====
                  pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Text(
                          'شكراً لسدادكم',
                          style: pw.TextStyle(font: fontBold, fontSize: 10),
                        ),
                        pw.SizedBox(height: 3),
                        pw.Text(
                          'المحصل: ${payment.collectorId}',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 8,
                            color: PdfColors.grey700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    // 6. فتح نافذة الطباعة/المشاركة
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Receipt_${payment.receiptNo}',
    );
  }

  // ====== دوال مساعدة للرسم (الموجودة عندك كما هي) ======
  pw.Widget _buildRow(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            child: pw.Text(
              label,
              style: pw.TextStyle(font: font, fontSize: 10),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Expanded(
            child: pw.Text(
              value,
              style: pw.TextStyle(font: font, fontSize: 10),
              textAlign: pw.TextAlign.left,
              maxLines: 2,
              overflow: pw.TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildMoneyRow(
    String label,
    double amount,
    pw.Font font, {
    bool isLarge = false,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            child: pw.Text(
              label,
              style: pw.TextStyle(font: font, fontSize: isLarge ? 14 : 10),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            '${amount.toStringAsFixed(2)} ريال',
            style: pw.TextStyle(
              font: font,
              fontSize: isLarge ? 14 : 10,
              fontWeight: isLarge ? pw.FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }

  // ====== إضافات تنسيق (بدون تغيير الجوهر) ======

  // فاصل رفيع
  pw.Widget _thinDivider() => pw.Divider(height: 1, thickness: 0.6);

  // فاصل صلب أوضح
  pw.Widget _solidDivider() => pw.Divider(height: 1, thickness: 1);

  // فاصل متقطع (بديل pw.Divider(style: dashed) غير المدعوم)
  pw.Widget _dashedDivider({
    double dashWidth = 4,
    double dashGap = 2.5,
    double thickness = 0.8,
    PdfColor color = PdfColors.grey700,
  }) {
    return pw.LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints!.maxWidth;
        final dashCount = (boxWidth / (dashWidth + dashGap)).floor().clamp(
          8,
          200,
        );

        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return pw.Container(
              width: dashWidth,
              height: thickness,
              color: color,
            );
          }),
        );
      },
    );
  }

  // كتلة Key/Value منسقة
  pw.Widget _buildKeyValueBlock({
    required pw.Font font,
    required pw.Font fontBold,
    required List<_KV> rows,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(width: 0.8),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      child: pw.Column(
        children: rows
            .map(
              (r) => pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 2),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      '${r.k}:',
                      style: pw.TextStyle(font: fontBold, fontSize: 10),
                    ),
                    pw.Text(r.v, style: pw.TextStyle(font: font, fontSize: 10)),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  _KV _kv(String k, String v) => _KV(k, v);
}

class _KV {
  final String k;
  final String v;
  _KV(this.k, this.v);
}
