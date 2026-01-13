import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/repository/meter_repository.dart';

part 'meter_repository_impl.g.dart';

class MeterRepositoryImpl implements MeterRepository {
  MeterRepositoryImpl(this.db);
  final AppDatabase db;

  @override
  Stream<List<Meter>> watchAllMeters() {
    return db.select(db.meters).watch();
  }

  @override
  Future<List<Meter>> getAvailableMeters() {
    final q = db.select(db.meters)
      ..where((m) => m.subscriberId.isNull());
    return q.get();
  }

  @override
  Future<int> createMeter(MetersCompanion meter) {
    return db.into(db.meters).insert(meter);
  }

  @override
  Future<void> linkMeterToSubscriber(int meterId, int subscriberId) async {
    await (db.update(db.meters)..where((m) => m.id.equals(meterId))).write(
      MetersCompanion(subscriberId: Value(subscriberId)),
    );
  }

  @override
  Future<void> updateMeterStatus(int meterId, String status) async {
    await (db.update(db.meters)..where((m) => m.id.equals(meterId))).write(
      MetersCompanion(status: Value(status)),
    );
  }
}

@riverpod
MeterRepository meterRepository(ref) {
  final db = ref.watch(appDatabaseProvider);
  return MeterRepositoryImpl(db);
}
