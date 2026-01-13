// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// // استيراد الشاشات
// import '../../features/auth/presentation/login_screen.dart';
// import '../../features/readings/presentation/screens/readings_screen.dart';
// import '../../features/reports/presentation/screens/reports_screen.dart';
// import '../../features/subscribers/presentation/screens/meters_screen.dart';
// import '../../features/subscribers/presentation/screens/subscribers_screen.dart';
// import '../../features/billing/presentation/screens/billing_cycles_screen.dart'; // جديد
// import '../../features/billing/presentation/screens/cycle_details_screen.dart'; // جديد
// import '../../features/billing/presentation/screens/tariff_settings_screen.dart'; // جديد
// import '../../home_screen.dart';
// import '../../features/collection/presentation/screens/collection_screen.dart'; // استيراد جديد
// import '../presentation/scaffold_with_nav.dart';

// part 'app_router.g.dart';

// // مفاتيح التنقل
// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>(
//   debugLabel: 'dashboard',
// );
// final _shellNavigatorSubscribersKey = GlobalKey<NavigatorState>(
//   debugLabel: 'subscribers',
// );
// final _shellNavigatorMetersKey = GlobalKey<NavigatorState>(
//   debugLabel: 'meters',
// );
// final _shellNavigatorBillingKey = GlobalKey<NavigatorState>(
//   debugLabel: 'billing',
// ); // مفتاح جديد

// @riverpod
// GoRouter goRouter(ref) {
//   return GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: '/login',
//     debugLogDiagnostics: true,
//     routes: [
//       // 1) تسجيل الدخول
//       GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

//       // 2) صفحات Full-screen فوق الـ Shell (تخفي الشريط السفلي)
//       GoRoute(
//         path: '/collection',
//         parentNavigatorKey: _rootNavigatorKey,
//         builder: (context, state) => const CollectionScreen(),
//       ),
//       GoRoute(
//         path: '/reports',
//         parentNavigatorKey: _rootNavigatorKey,
//         builder: (context, state) => const ReportsScreen(),
//       ),

//       // 3) التطبيق الرئيسي داخل الـ Shell
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return ScaffoldWithNav(navigationShell: navigationShell);
//         },
//         branches: [
//           // الفرع 0: الرئيسية
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorDashboardKey,
//             routes: [
//               GoRoute(
//                 path: '/home',
//                 pageBuilder: (context, state) =>
//                     const NoTransitionPage(child: HomeScreen()),
//               ),
//             ],
//           ),

//           // الفرع 1: المشتركين
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorSubscribersKey,
//             routes: [
//               GoRoute(
//                 path: '/subscribers',
//                 pageBuilder: (context, state) =>
//                     const NoTransitionPage(child: SubscribersScreen()),
//               ),
//             ],
//           ),

//           // الفرع 2: العدادات
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorMetersKey,
//             routes: [
//               GoRoute(
//                 path: '/meters',
//                 pageBuilder: (context, state) =>
//                     const NoTransitionPage(child: MetersScreen()),
//               ),
//             ],
//           ),

//           // الفرع 3: الفوترة
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorBillingKey,
//             routes: [
//               GoRoute(
//                 path: '/billing',
//                 pageBuilder: (context, state) =>
//                     const NoTransitionPage(child: BillingCyclesScreen()),
//                 routes: [
//                   GoRoute(
//                     path: 'cycles/:id',
//                     parentNavigatorKey: _rootNavigatorKey, // ✅ صحيح هنا
//                     builder: (context, state) {
//                       final id = int.parse(state.pathParameters['id']!);
//                       return CycleDetailsScreen(cycleId: id);
//                     },
//                   ),
//                   GoRoute(
//                     path: 'tariff-settings',
//                     parentNavigatorKey: _rootNavigatorKey, // ✅ صحيح هنا
//                     builder: (context, state) => const TariffSettingsScreen(),
//                   ),
//                   GoRoute(
//                     path: '/readings',
//                     parentNavigatorKey: _rootNavigatorKey,
//                     builder: (context, state) => const ReadingsScreen(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/subscribers/presentation/screens/meters_screen.dart';
import '../../features/subscribers/presentation/screens/subscribers_screen.dart';
import '../../features/billing/presentation/screens/billing_cycles_screen.dart';
import '../../features/billing/presentation/screens/cycle_details_screen.dart';
import '../../features/billing/presentation/screens/tariff_settings_screen.dart';
import '../../features/collection/presentation/screens/collection_screen.dart';
import '../../features/readings/presentation/screens/readings_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
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

  ref.listen<AsyncValue<User?>>(authControllerProvider, (_, __) {
    refresh.value++;
  });

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    debugLogDiagnostics: true,
    refreshListenable: refresh,

    redirect: (context, state) {
      final auth = ref.read(authControllerProvider); // AsyncValue<User?>

      // ✅ ممنوع isLoading نهائياً — نتحقق بالـ type فقط
      final user = auth.asData?.value;
      final isLoggedIn = user != null;

      final isOnLogin = state.matchedLocation == '/login';

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
    ],
  );
}
