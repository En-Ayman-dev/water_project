import '../../../../core/database/app_database.dart';

abstract class MeterRepository {
  /// مراقبة جميع العدادات
  Stream<List<Meter>> watchAllMeters();
  
  /// جلب العدادات غير المرتبطة (للاختيار منها عند إنشاء مشترك)
  Future<List<Meter>> getAvailableMeters();
  
  /// إضافة عداد جديد
  Future<int> createMeter(MetersCompanion meter);
  
  /// ربط عداد بمشترك
  Future<void> linkMeterToSubscriber(int meterId, int subscriberId);
  
  /// تغيير حالة العداد (معطل، سليم، إلخ)
  Future<void> updateMeterStatus(int meterId, String status);
}