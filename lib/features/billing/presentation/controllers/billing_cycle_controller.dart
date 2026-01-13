import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/services/billing_service.dart';

/// 1) قائمة الدورات
final billingCyclesListProvider = StreamProvider<List<BillingCycle>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.billingCycles)..orderBy([
        (t) => OrderingTerm(expression: t.startDate, mode: OrderingMode.desc),
      ]))
      .watch();
});

/// 2) فواتير دورة محددة (Family)
final cycleInvoicesProvider = StreamProvider.family<List<Invoice>, int>((
  ref,
  cycleId,
) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(
    db.invoices,
  )..where((t) => t.cycleId.equals(cycleId))).watch();
});

/// 3) Controller (بدون codegen)
final billingCycleControllerProvider =
    AsyncNotifierProvider<BillingCycleController, void>(
      BillingCycleController.new,
    );

class BillingCycleController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> openNewCycle(int year, int month) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      final startDate = DateTime(year, month, 1);
      final endDate = DateTime(year, month + 1, 0); // آخر يوم في الشهر

      await db
          .into(db.billingCycles)
          .insert(
            BillingCyclesCompanion(
              name: Value('${_getMonthName(month)} $year'),
              year: Value(year),
              month: Value(month),
              startDate: Value(startDate),
              endDate: Value(endDate),
              status: const Value('open'),
            ),
          );
    });
  }

  Future<void> generateInvoices(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(billingServiceProvider);
      await service.generateInvoicesForCycle(cycleId);
    });
  }

  /// إنشاء قراءات عشوائية للاختبار
  Future<void> simulateRandomReadings(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      final activeMeters = await (db.select(
        db.meters,
      )..where((t) => t.subscriberId.isNotNull())).get();

      final random = Random();

      for (final meter in activeMeters) {
        final exists =
            await (db.select(db.meterReadings)..where(
                  (t) => t.cycleId.equals(cycleId) & t.meterId.equals(meter.id),
                ))
                .getSingleOrNull();

        if (exists == null) {
          final prevReading = 1000 + random.nextInt(500);
          final consumption = 10 + random.nextInt(100);
          final currReading = prevReading + consumption;

          await db
              .into(db.meterReadings)
              .insert(
                MeterReadingsCompanion(
                  cycleId: Value(cycleId),
                  meterId: Value(meter.id),
                  previousReading: Value(prevReading),
                  currentReading: Value(currReading),
                  units: Value(consumption),
                  status: const Value('normal'),
                ),
              );
        }
      }
    });
  }

  String _getMonthName(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return months[month - 1];
  }

  Future<void> closeCycle(int cycleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      await (db.update(
        db.billingCycles,
      )..where((t) => t.id.equals(cycleId))).write(
        BillingCyclesCompanion(
          status: const Value('closed'),
          closedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
