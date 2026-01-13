import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';

/// Provider يدوي (بدون codegen)
final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(AuthController.new);

class AuthController extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return null; // الحالة الافتراضية: غير مسجل دخول
  }

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = ref.read(appDatabaseProvider);

      final user = await (db.select(db.users)
            ..where((t) => t.username.equals(username)))
          .getSingleOrNull();

      if (user == null) {
        throw Exception('اسم المستخدم غير صحيح');
      }

      // MVP: مقارنة مباشرة (بدون hashing)
      if (user.passwordHash != password) {
        throw Exception('كلمة المرور غير صحيحة');
      }

      if (!user.isActive) {
        throw Exception('هذا الحساب موقوف');
      }

      return user;
    });
  }

  void logout() {
    state = const AsyncData(null);
  }

  Future<void> ensureAdminExists() async {
    final db = ref.read(appDatabaseProvider);

    final admin = await (db.select(db.users)
          ..where((t) => t.username.equals('admin')))
        .getSingleOrNull();

    if (admin == null) {
      await db.into(db.users).insert(UsersCompanion(
        name: const Value('System Admin'),
        username: const Value('admin'),
        passwordHash: const Value('admin123'),
        role: const Value('admin'),
        isActive: const Value(true),
      ));
    }

    final reader = await (db.select(db.users)
          ..where((t) => t.username.equals('reader')))
        .getSingleOrNull();

    if (reader == null) {
      await db.into(db.users).insert(UsersCompanion(
        name: const Value('Meter Reader'),
        username: const Value('reader'),
        passwordHash: const Value('123'),
        role: const Value('reader'),
      ));
    }

    final collector = await (db.select(db.users)
          ..where((t) => t.username.equals('collector')))
        .getSingleOrNull();

    if (collector == null) {
      await db.into(db.users).insert(UsersCompanion(
        name: const Value('Cash Collector'),
        username: const Value('collector'),
        passwordHash: const Value('123'),
        role: const Value('collector'),
      ));
    }
  }
}
