import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../view/auth/forgot_password/view/forgot_password_view.dart';
import '../../view/auth/login/view/login_view.dart';
import '../../view/auth/signup/view/signup_view.dart';
import '../../view/auth/splash/view/splash_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/health/view/health_view.dart';
import '../../view/work/view/work_view.dart';

part 'app_router.gr.dart';

//note if your changes does not reflect, run build runner watch
@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      path: 'splash',
    ),
    AutoRoute(
      page: LoginView,
      path: 'login',
    ),
    AutoRoute(
      page: SignupView,
      path: 'signup',
    ),
    AutoRoute(
      page: ForgotPasswordView,
      path: 'reset-password',
    ),
    AutoRoute(page: DashboardView, path: 'dashboard', initial: true, children: [
      AutoRoute(page: HealthView, path: 'health', initial: true),
      AutoRoute(
        page: WorkView,
        path: 'work',
      )
    ]),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}
