// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../audit/application/audit_service.dart';

part 'excel_import_service.g.dart';

@Riverpod(keepAlive: true)
ExcelImportService excelImportService( ref) {
  return ExcelImportService(ref);
}

class ExcelImportService {
  final  _ref;

  ExcelImportService(this._ref);

  Future<int> pickAndImportFile() async {
    // ثبّت القراءات مبكرًا
    final db = _ref.read(appDatabaseProvider);
    final audit = _ref.read(auditServiceProvider);

    // 1) اختيار الملف (تجنب custom لتفادي مشاكل plugin على بعض المنصات)
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result == null) return 0;

    final picked = result.files.single;

    if (!picked.name.toLowerCase().endsWith('.xlsx')) {
      throw Exception('الملف يجب أن يكون بصيغة .xlsx');
    }

    // 2) قراءة الملف
    final bytes = picked.bytes ?? await File(picked.path!).readAsBytes();

    final excel = Excel.decodeBytes(bytes);
    int successCount = 0;

    final sheet = excel.tables[excel.tables.keys.first];
    if (sheet == null) throw Exception('ملف الاكسل فارغ');

    await db.transaction(() async {
      for (var i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];
        if (row.isEmpty) continue;

        try {
          final nameVal = row.length > 1 ? row[1]?.value : null;
          if (nameVal == null) continue;
          final fullName = nameVal.toString();

          double openingBalance = 0.0;
          if (row.length > 12 && row[12]?.value != null) {
            openingBalance = double.tryParse(row[12]!.value.toString()) ?? 0.0;
          }

          final subscriberId = await db.into(db.subscribers).insert(
                SubscribersCompanion(
                  fullName: Value(fullName),
                  phone: const Value(null),
                  areaId: const Value(1),
                  status: const Value('active'),
                  createdAt: Value(DateTime.now()),
                ),
              );

          final serialVal = row.isNotEmpty ? (row[0]?.value?.toString() ?? 'AUTO-$subscriberId') : 'AUTO-$subscriberId';

          await db.into(db.meters).insert(
                MetersCompanion(
                  meterNo: Value(serialVal),
                  subscriberId: Value(subscriberId),
                  status: const Value('ok'),
                  installedAt: Value(DateTime.now()),
                ),
              );

          if (openingBalance > 0) {
            final cycle = await (db.select(db.billingCycles)..limit(1)).getSingleOrNull();
            final int cycleId = cycle?.id ??
                await db.into(db.billingCycles).insert(
                      BillingCyclesCompanion(
                        name: const Value('رصيد افتتاحي'),
                        startDate: Value(DateTime(2020, 1, 1)),
                        endDate: Value(DateTime(2020, 1, 31)),
                        status: const Value('closed'),
                      ),
                    );

            await db.into(db.invoices).insert(
                  InvoicesCompanion(
                    invoiceNo: Value('OP-$subscriberId'),
                    subscriberId: Value(subscriberId),
                    cycleId: Value(cycleId),
                    tariffId: const Value(1),
                    meterId: const Value(null),
                    units: const Value(0),
                    fixedFeeAmount: const Value(0),
                    consumptionAmount: const Value(0),
                    arrearsAmount: Value(openingBalance),
                    adjustmentsAmount: const Value(0),
                    totalAmount: Value(openingBalance),
                    status: const Value('unpaid'),
                    issuedAt: Value(DateTime.now()),
                  ),
                );
          }

          successCount++;
        } catch (e) {
          // تجاهل الصف مع تسجيل الخطأ
          // ignore: avoid_print
          print('Error importing row $i: $e');
        }
      }

      await audit.log(
        action: 'IMPORT_EXCEL',
        entityType: 'System',
        details: 'تم استيراد $successCount مشترك من ملف Excel',
      );
    });

    return successCount;
  }
}
