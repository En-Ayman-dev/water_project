import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/repository/subscriber_repository.dart';

part 'subscriber_repository_impl.g.dart';

class SubscriberRepositoryImpl implements SubscriberRepository {
  SubscriberRepositoryImpl(this.db);
  final AppDatabase db;

  @override
  Stream<List<Subscriber>> watchAllSubscribers() {
    return db.select(db.subscribers).watch();
  }

  @override
  Future<Subscriber?> getSubscriberById(int id) {
    final q = db.select(db.subscribers)..where((s) => s.id.equals(id));
    return q.getSingleOrNull();
  }

  @override
  Future<int> createSubscriber(SubscribersCompanion subscriber) {
    return db.into(db.subscribers).insert(subscriber);
  }

  @override
  Future<bool> updateSubscriber(Subscriber subscriber) async {
    return db.update(db.subscribers).replace(subscriber);
  }

  @override
  Future<List<Subscriber>> searchSubscribers(String query) {
    final q = db.select(db.subscribers)
      ..where((s) =>
          s.fullName.like('%$query%') |
          s.phone.like('%$query%'));
    return q.get();
  }
}

@riverpod
SubscriberRepository subscriberRepository(ref) {
  final db = ref.watch(appDatabaseProvider);
  return SubscriberRepositoryImpl(db);
}
