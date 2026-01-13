import '../../../../core/database/app_database.dart';

abstract class TariffRepository {
  /// جلب التعرفة النشطة حالياً
  Future<Tariff?> getActiveTariff();

  /// جلب الشرائح الخاصة بتعرفة معينة
  Future<List<TariffSlab>> getTariffSlabs(int tariffId);

  /// إنشاء تعرفة جديدة مع شرائحها
  Future<void> createTariffWithSlabs(TariffsCompanion tariff, List<TariffSlabsCompanion> slabs);

  /// مراقبة جميع التعرفات (لصفحة الإعدادات)
  Stream<List<TariffWithSlabs>> watchAllTariffs();
}

/// كلاس مساعد لدمج التعرفة مع شرائحها في كائن واحد
class TariffWithSlabs {
  final Tariff tariff;
  final List<TariffSlab> slabs;

  TariffWithSlabs(this.tariff, this.slabs);
}