import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/database/app_database.dart';

/// Provider يدوي (بدون codegen)
final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(AuthController.new);

class AuthController extends AsyncNotifier<User?> {
  static const _prefKeyUser = 'logged_in_username';

  @override
  FutureOr<User?> build() async {
    print('🔵 AuthController: Start Building...');
    
    try {
      // 1. ضمان وجود المستخدمين الأساسيين في قاعدة البيانات
      await ensureAdminExists();
      print('🟢 AuthController: Admin check passed.');

      // 2. التحقق من التخزين المحلي لاستعادة الجلسة
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString(_prefKeyUser);
      print('🟡 AuthController: Found username in prefs: $username');

      if (username != null) {
        final db = ref.read(appDatabaseProvider);
        final user = await (db.select(db.users)
              ..where((t) => t.username.equals(username)))
            .getSingleOrNull();
        
        // إذا وجدنا المستخدم، نعيده كحالة مسجلة
        if (user != null && user.isActive) {
          print('🟢 AuthController: User restored successfully: ${user.username}');
          return user;
        } else {
          print('🔴 AuthController: User found in prefs but NOT in DB or Inactive.');
        }
      }
    } catch (e, st) {
      // التقاط أي خطأ صامت وطباعته
      print('🔴🔴🔴 AuthController FATAL ERROR: $e');
      print(st);
      // في حالة الخطأ، نعود لحالة "غير مسجل" بدلاً من تعليق التطبيق
      return null;
    }

    print('⚪ AuthController: No user session found. Defaulting to null.');
    return null; // الحالة الافتراضية: غير مسجل دخول
  }

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      print('🔵 AuthController: Attempting login for $username');
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

      // حفظ الجلسة محلياً
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKeyUser, user.username);

      print('🟢 AuthController: Login successful for ${user.username}');
      return user;
    });
  }

  Future<void> logout() async {
    print('🔵 AuthController: Logging out...');
    // حذف الجلسة
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefKeyUser);
    
    state = const AsyncData(null);
  }

  Future<void> ensureAdminExists() async {
    final db = ref.read(appDatabaseProvider);

    try {
      final admin = await (db.select(db.users)
            ..where((t) => t.username.equals('admin')))
          .getSingleOrNull();

      if (admin == null) {
        print('🟡 AuthController: Creating Admin User...');
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
        print('🟡 AuthController: Creating Reader User...');
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
        print('🟡 AuthController: Creating Collector User...');
        await db.into(db.users).insert(UsersCompanion(
          name: const Value('Cash Collector'),
          username: const Value('collector'),
          passwordHash: const Value('123'),
          role: const Value('collector'),
        ));
      }
    } catch (e) {
      print('🔴 AuthController: Error inside ensureAdminExists: $e');
      rethrow; // نعيد رمي الخطأ ليتم التقاطه في build
    }
  }
}