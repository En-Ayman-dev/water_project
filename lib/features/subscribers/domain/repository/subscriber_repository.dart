import '../../../../core/database/app_database.dart';

abstract class SubscriberRepository {
  /// جلب جميع المشتركين (يمكن إضافة الفلترة لاحقاً)
  Stream<List<Subscriber>> watchAllSubscribers();
  
  /// جلب مشترك محدد
  Future<Subscriber?> getSubscriberById(int id);
  
  /// إضافة مشترك جديد
  Future<int> createSubscriber(SubscribersCompanion subscriber);
  
  /// تعديل بيانات مشترك
  Future<bool> updateSubscriber(Subscriber subscriber);
  
  /// البحث عن مشتركين بالاسم أو الرقم
  Future<List<Subscriber>> searchSubscribers(String query);
}