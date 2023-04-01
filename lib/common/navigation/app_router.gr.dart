// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignupView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordView(),
      );
    },
    AnimationRouteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AnimationRouteView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    HealthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HealthView(),
      );
    },
    WorkRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WorkView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    ReminderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ReminderView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        RouteConfig(
          SignupRoute.name,
          path: 'signup',
        ),
        RouteConfig(
          ForgotPasswordRoute.name,
          path: 'reset-password',
        ),
        RouteConfig(
          AnimationRouteRoute.name,
          path: 'animation-route',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: 'dashboard',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'health',
              fullMatch: true,
            ),
            RouteConfig(
              HealthRoute.name,
              path: 'health',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              WorkRoute.name,
              path: 'work',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ReminderRoute.name,
              path: 'reminder',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignupView]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: 'signup',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [ForgotPasswordView]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: 'reset-password',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [AnimationRouteView]
class AnimationRouteRoute extends PageRouteInfo<void> {
  const AnimationRouteRoute()
      : super(
          AnimationRouteRoute.name,
          path: 'animation-route',
        );

  static const String name = 'AnimationRouteRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [HealthView]
class HealthRoute extends PageRouteInfo<void> {
  const HealthRoute()
      : super(
          HealthRoute.name,
          path: 'health',
        );

  static const String name = 'HealthRoute';
}

/// generated route for
/// [WorkView]
class WorkRoute extends PageRouteInfo<void> {
  const WorkRoute()
      : super(
          WorkRoute.name,
          path: 'work',
        );

  static const String name = 'WorkRoute';
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [ReminderView]
class ReminderRoute extends PageRouteInfo<void> {
  const ReminderRoute()
      : super(
          ReminderRoute.name,
          path: 'reminder',
        );

  static const String name = 'ReminderRoute';
}
