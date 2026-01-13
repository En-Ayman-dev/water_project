import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

// الجداول السابقة
import 'daos/reports_dao.dart';
import 'tables/users.dart';
import 'tables/areas.dart';
import 'tables/subscribers.dart';
import 'tables/meters.dart';
import 'tables/tariffs.dart';
import 'tables/tariff_slabs.dart';
import 'tables/billing_cycles.dart';
import 'tables/invoices.dart';
import 'tables/invoice_slab_breakdowns.dart';
import 'tables/meter_readings.dart';
// الجداول الجديدة
import 'tables/payments.dart';
import 'tables/payment_allocations.dart';
import 'tables/adjustments.dart';
import 'tables/audit_logs.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Areas,
    Subscribers,
    Meters,
    Tariffs,
    TariffSlabs,
    BillingCycles,
    Invoices,
    InvoiceSlabBreakdowns,
    MeterReadings,
    Payments,
    PaymentAllocations,
    Adjustments,
    AuditLogs,
  ],
  daos: [ReportsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 9; // تم الحفاظ على الرقم كما طلبت

  Future<void> _createTableSafe(
    Migrator m,
    TableInfo<Table, Object?> table,
  ) async {
    try {
      await m.createTable(table);
    } catch (_) {
      // لو الجدول موجود، تجاهل
    }
  }

  Future<void> _addColumnSafe(
    Migrator m,
    TableInfo<Table, Object?> table,
    GeneratedColumn column,
  ) async {
    try {
      await m.addColumn(table, column);
    } catch (_) {
      // لو العمود موجود، تجاهل
    }
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // ✅ أنشئ الجداول الأساسية التي قد تكون ناقصة (بالترتيب الصحيح للعلاقات)
        await _createTableSafe(m, areas);
        await _createTableSafe(m, subscribers);
        await _createTableSafe(m, meters);

        await _createTableSafe(m, tariffs);
        await _createTableSafe(m, tariffSlabs);

        await _createTableSafe(m, billingCycles);
        await _addColumnSafe(m, billingCycles, billingCycles.closedAt);

        await _createTableSafe(m, invoices);
        await _createTableSafe(m, invoiceSlabBreakdowns);
        await _createTableSafe(m, meterReadings);

        await _createTableSafe(m, payments);
        await _createTableSafe(m, paymentAllocations);

        // ✅ إضافة الجداول الجديدة للحوكمة والتدقيق (تم دمجها هنا)
        await _createTableSafe(m, adjustments);
        await _createTableSafe(m, auditLogs);
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'water_app_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(ref) {
  return AppDatabase();
}
