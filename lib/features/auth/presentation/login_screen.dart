// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart'; // ✅ إضافة مكتبة التوجيه

// import 'controllers/auth_controller.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     // ✅ الاستماع لحالة الخطأ فقط لعرض رسالة منبثقة
//     ref.listen<AsyncValue>(authControllerProvider, (_, state) {
//       if (state is AsyncError) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(state.error.toString().replaceAll('Exception: ', '')),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     });

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Icon(
//                 Icons.water_drop,
//                 size: 80,
//                 color: theme.colorScheme.primary,
//               ),
//               const SizedBox(height: 32),
//               Text(
//                 'نظام إدارة المياه',
//                 style: theme.textTheme.headlineMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'تسجيل الدخول للمتابعة',
//                 style: theme.textTheme.bodyLarge?.copyWith(
//                   color: theme.colorScheme.onSurfaceVariant,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 48),
//               TextFormField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'اسم المستخدم',
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'كلمة المرور',
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               FilledButton(
//                 onPressed: () async {
//                   final username = usernameController.text.trim();
//                   final password = passwordController.text;

//                   // 1. إخفاء لوحة المفاتيح
//                   FocusScope.of(context).unfocus();

//                   // 2. تنفيذ عملية الدخول
//                   await ref
//                       .read(authControllerProvider.notifier)
//                       .login(username, password);
                  
//                   // 3. التحقق اليدوي والتوجيه القسري
//                   if (context.mounted) {
//                     final authState = ref.read(authControllerProvider);
                    
//                     // استخدام فحص النوع (is) للتأكد من نجاح العملية
//                     if (authState is AsyncData && authState.value != null) {
//                       print('🚀 LoginScreen: Manual navigation to /home');
//                       context.go('/home'); // ✅ إجبار التطبيق على الانتقال
//                     }
//                   }
//                 },
//                 style: FilledButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('دخول'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // ✅ إضافة مكتبة التوجيه

import 'controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // ✅ الاستماع لحالة الخطأ فقط لعرض رسالة منبثقة
    ref.listen<AsyncValue>(authControllerProvider, (_, state) {
      if (state is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString().replaceAll('Exception: ', '')),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.water_drop,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'نظام إدارة المياه',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'تسجيل الدخول للمتابعة',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'اسم المستخدم',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () async {
                  final username = usernameController.text.trim();
                  final password = passwordController.text;

                  // 1. إخفاء لوحة المفاتيح
                  FocusScope.of(context).unfocus();

                  // 2. تنفيذ عملية الدخول
                  await ref
                      .read(authControllerProvider.notifier)
                      .login(username, password);
                  
                  // 3. التحقق اليدوي والتوجيه القسري
                  if (context.mounted) {
                    final authState = ref.read(authControllerProvider);
                    
                    // استخدام فحص النوع (is) للتأكد من نجاح العملية
                    if (authState is AsyncData && authState.value != null) {
                      print('🚀 LoginScreen: Manual navigation to /home');
                      context.go('/home'); // ✅ إجبار التطبيق على الانتقال
                    }
                  }
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('دخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}