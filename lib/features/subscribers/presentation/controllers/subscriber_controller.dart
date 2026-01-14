import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repository/subscriber_repository_impl.dart';
// استيراد خدمة التدقيق
import '../../../audit/application/audit_service.dart';

final subscribersListProvider = StreamProvider<List<Subscriber>>((ref) {
  return ref.watch(subscriberRepositoryProvider).watchAllSubscribers();
});

final subscriberControllerProvider =
    AsyncNotifierProvider<SubscriberController, void>(SubscriberController.new);

class SubscriberController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> addSubscriber({
    required String fullName,
    required String phone,
    required int areaId,
    String? address,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(subscriberRepositoryProvider);
      
      // تنفيذ الإضافة والحصول على المعرف الجديد
      final newId = await repository.createSubscriber(
        SubscribersCompanion(
          fullName: Value(fullName),
          phone: Value(phone),
          areaId: Value(areaId),
          address: Value(address),
          status: const Value('active'),
        ),
      );

      // تسجيل العملية في سجل التدقيق
      await ref.read(auditServiceProvider).log(
        action: 'CREATE',
        entityType: 'Subscriber',
        entityId: newId,
        details: 'إضافة مشترك جديد: $fullName',
      );
    });
  }

  Future<void> toggleStatus(Subscriber subscriber) async {
    final newStatus = subscriber.status == 'active' ? 'suspended' : 'active';
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(subscriberRepositoryProvider);
      
      // تنفيذ التحديث
      await repository.updateSubscriber(
        subscriber.copyWith(status: newStatus),
      );

      // تسجيل العملية في سجل التدقيق
      await ref.read(auditServiceProvider).log(
        action: 'UPDATE_STATUS',
        entityType: 'Subscriber',
        entityId: subscriber.id,
        details: 'تغيير حالة المشترك إلى: $newStatus',
      );
    });
  }
}