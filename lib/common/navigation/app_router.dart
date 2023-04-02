import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashView.page,
    ),
    AutoRoute(
      page: OnboardingView.page,
      path: '/',
    ),
    AutoRoute(
      page: LoginView.page,
    ),
    AutoRoute(
      page: SignupView.page,
    ),
    AutoRoute(
      page: ForgotPasswordView.page,
    ),
    AutoRoute(
      page: AnimationRouteView.page,
    ),
    AutoRoute(
      page: DashboardView.page,
      children: [
        AutoRoute(
          page: HealthView.page,
          path: '',
        ),
        AutoRoute(
          page: WorkView.page,
        ),
        AutoRoute(
          page: ProfileView.page,
        ),
        AutoRoute(
          page: ReminderView.page,
        )
      ],
    ),
  ];

  static AppRouter? _instance;
  static AppRouter? get instance {
    _instance ??= AppRouter();
    return _instance;
  }
}
