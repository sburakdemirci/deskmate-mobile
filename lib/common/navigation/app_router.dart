import 'package:auto_route/auto_route.dart';
import 'package:deskmate/view/auth/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../../view/auth/login/view/login_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      path: 'splash',
      initial: true,
    ),
    AutoRoute(
      page: LoginView,
      path: 'login',
    )
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter();
}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}
