import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/audit/presentation/screens/audit_logs_screen.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/import/presentation/import_screen.dart';
import '../../features/subscribers/presentation/screens/meters_screen.dart';
import '../../features/subscribers/presentation/screens/subscribers_screen.dart';
import '../../features/billing/presentation/screens/billing_cycles_screen.dart';
import '../../features/billing/presentation/screens/cycle_details_screen.dart';
import '../../features/billing/presentation/screens/tariff_settings_screen.dart';
import '../../features/collection/presentation/screens/collection_screen.dart';
import '../../features/readings/presentation/screens/readings_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
// الاستيرادات الجديدة لشاشات الحوكمة
import '../../features/adjustments/presentation/screens/adjustments_approval_screen.dart';
import '../../features/adjustments/presentation/screens/adjustment_request_screen.dart';
// استيراد شاشة الاستيراد

import '../../home_screen.dart';
import '../database/app_database.dart';
import '../presentation/scaffold_with_nav.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>(
  debugLabel: 'dashboard',
);
final _shellNavigatorSubscribersKey = GlobalKey<NavigatorState>(
  debugLabel: 'subscribers',
);
final _shellNavigatorMetersKey = GlobalKey<NavigatorState>(
  debugLabel: 'meters',
);
final _shellNavigatorBillingKey = GlobalKey<NavigatorState>(
  debugLabel: 'billing',
);

@riverpod
GoRouter goRouter(ref) {
  // 🔥 هذا يخلي GoRouter يعمل refresh لما auth يتغير بدون ما نعيد إنشاء الراوتر
  final refresh = ValueNotifier<int>(0);

  ref.listen<AsyncValue<User?>>(authControllerProvider, (_, next) {
    // استخدام فحص النوع (is) بدلاً من getters لتفادي NoSuchMethodError
    final bool isLoading = next is AsyncLoading;
    final bool hasData = next is AsyncData;
    final bool hasError = next is AsyncError;

    print(
      '🔄 Router: Auth State Changed. IsLoading: $isLoading, HasData: $hasData, Error: $hasError',
    );

    // ✅ تصحيح جذري: استخدام microtask لجدولة التحديث في الدورة التالية
    Future.microtask(() {
      refresh.value++;
    });
  });

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    debugLogDiagnostics: true,
    refreshListenable: refresh,

    redirect: (context, state) {
      // ✅ سجل جديد للتأكد من دخول الدالة
      print(
        '🔎 Router: Redirect function called. Location: ${state.matchedLocation}',
      );

      final auth = ref.read(authControllerProvider); // AsyncValue<User?>

      if (auth is AsyncError) {
        print('🔴 Router: Auth has error! Stay at login.');
        return null;
      }

      if (auth is AsyncLoading) {
        print('⏳ Router: Auth is loading... Waiting.');
        return null;
      }

      // ✅ تصحيح: استخدام فحص النوع المباشر (is AsyncData) بدلاً من .asData لتجنب الخطأ
      final user = (auth is AsyncData) ? auth.value : null;

      final isLoggedIn = user != null;
      final isOnLogin = state.matchedLocation == '/login';

      print(
        '🧭 Router: Check Redirect. User: ${user?.username}, OnLogin: $isOnLogin',
      );

      if (!isLoggedIn && !isOnLogin) return '/login';
      if (isLoggedIn && isOnLogin) return '/home';

      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNav(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDashboardKey,
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSubscribersKey,
            routes: [
              GoRoute(
                path: '/subscribers',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SubscribersScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMetersKey,
            routes: [
              GoRoute(
                path: '/meters',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MetersScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBillingKey,
            routes: [
              GoRoute(
                path: '/billing',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BillingCyclesScreen()),
                routes: [
                  GoRoute(
                    path: 'cycles/:id',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return CycleDetailsScreen(cycleId: id);
                    },
                  ),
                  GoRoute(
                    path: 'tariff-settings',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const TariffSettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/collection',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CollectionScreen(),
      ),
      GoRoute(
        path: '/readings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ReadingsScreen(),
      ),
      GoRoute(
        path: '/reports',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ReportsScreen(),
      ),
      // المسارات الجديدة للحوكمة
      GoRoute(
        path: '/audit-logs',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AuditLogsScreen(),
      ),
      GoRoute(
        path: '/adjustments-approval',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AdjustmentsApprovalScreen(),
      ),
      GoRoute(
        path: '/adjustment-request',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AdjustmentRequestScreen(),
      ),
      // مسار الاستيراد
      GoRoute(
        path: '/import',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ImportScreen(),
      ),
    ],
  );
}
