import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../meters/data/repository/meter_repository_impl.dart';

/// ✅ بديل عن @riverpod Stream<List<Meter>>
final metersListProvider = StreamProvider<List<Meter>>((ref) {
  return ref.watch(meterRepositoryProvider).watchAllMeters();
});

/// ✅ بديل عن @riverpod Future<List<Meter>>
final availableMetersProvider = FutureProvider<List<Meter>>((ref) {
  return ref.watch(meterRepositoryProvider).getAvailableMeters();
});

/// ✅ Controller بدون codegen
final meterControllerProvider =
    AsyncNotifierProvider<MeterController, void>(MeterController.new);

class MeterController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> addMeter(String meterNo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(meterRepositoryProvider);
      await repository.createMeter(
        MetersCompanion(
          meterNo: Value(meterNo),
          status: const Value('ok'),
        ),
      );
    });
  }

  Future<void> linkMeter(int meterId, int subscriberId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(meterRepositoryProvider);
      await repository.linkMeterToSubscriber(meterId, subscriberId);
    });
  }
}
