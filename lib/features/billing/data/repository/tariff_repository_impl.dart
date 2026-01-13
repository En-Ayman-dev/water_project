import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/repository/tariff_repository.dart';

part 'tariff_repository_impl.g.dart';

class TariffRepositoryImpl implements TariffRepository {
  final AppDatabase _db;

  TariffRepositoryImpl(this._db);

  @override
  Future<Tariff?> getActiveTariff() {
    return (_db.select(_db.tariffs)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm(expression: t.effectiveFrom, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<List<TariffSlab>> getTariffSlabs(int tariffId) {
    return (_db.select(_db.tariffSlabs)
          ..where((t) => t.tariffId.equals(tariffId))
          ..orderBy([(t) => OrderingTerm(expression: t.startUnit)])) // ترتيب تصاعدي مهم
        .get();
  }

  @override
  Future<void> createTariffWithSlabs(
      TariffsCompanion tariff, List<TariffSlabsCompanion> slabs) async {
    await _db.transaction(() async {
      // 1. إيقاف أي تعرفة سابقة (اختياري حسب سياسة العمل، سنفترضه هنا)
      // await (_db.update(_db.tariffs)..where((t) => t.isActive)).write(const TariffsCompanion(isActive: Value(false)));

      // 2. إضافة التعرفة الجديدة
      final tariffId = await _db.into(_db.tariffs).insert(tariff);

      // 3. إضافة الشرائح
      for (final slab in slabs) {
        await _db.into(_db.tariffSlabs).insert(
              slab.copyWith(tariffId: Value(tariffId)),
            );
      }
    });
  }

  @override
  Stream<List<TariffWithSlabs>> watchAllTariffs() {
    final tariffStream = (_db.select(_db.tariffs)
          ..orderBy([(t) => OrderingTerm(expression: t.effectiveFrom, mode: OrderingMode.desc)]))
        .watch();

    return tariffStream.asyncMap((tariffs) async {
      final List<TariffWithSlabs> result = [];
      for (final tariff in tariffs) {
        final slabs = await getTariffSlabs(tariff.id);
        result.add(TariffWithSlabs(tariff, slabs));
      }
      return result;
    });
  }
}

@riverpod
TariffRepository tariffRepository( ref) {
  final db = ref.watch(appDatabaseProvider);
  return TariffRepositoryImpl(db);
}