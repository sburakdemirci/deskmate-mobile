// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:deskmate/common/view/animation_route/view/animation_route_view.dart'
    as _i1;
import 'package:deskmate/view/auth/forgot_password/view/forgot_password_view.dart'
    as _i3;
import 'package:deskmate/view/auth/login/view/login_view.dart' as _i5;
import 'package:deskmate/view/auth/signup/view/signup_view.dart' as _i4;
import 'package:deskmate/view/auth/splash/view/splash_view.dart' as _i2;
import 'package:deskmate/view/dashboard/dashboard_view.dart' as _i8;
import 'package:deskmate/view/health/view/health_view.dart' as _i6;
import 'package:deskmate/view/onboarding/onboarding_view.dart' as _i11;
import 'package:deskmate/view/profile/view/profile_view.dart' as _i9;
import 'package:deskmate/view/reminder/view/reminder_view.dart' as _i7;
import 'package:deskmate/view/work/view/work_view.dart' as _i10;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AnimationRouteView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AnimationRouteView(),
      );
    },
    SplashView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
      );
    },
    ForgotPasswordView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordView(),
      );
    },
    SignupView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignupView(),
      );
    },
    LoginView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginView(),
      );
    },
    HealthView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HealthView(),
      );
    },
    ReminderView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ReminderView(),
      );
    },
    DashboardView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileView(),
      );
    },
    WorkView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.WorkView(),
      );
    },
    OnboardingView.name: (routeData) {
      final args = routeData.argsAs<OnboardingViewArgs>(
          orElse: () => const OnboardingViewArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OnboardingView(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimationRouteView]
class AnimationRouteView extends _i12.PageRouteInfo<void> {
  const AnimationRouteView({List<_i12.PageRouteInfo>? children})
      : super(
          AnimationRouteView.name,
          initialChildren: children,
        );

  static const String name = 'AnimationRouteView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashView]
class SplashView extends _i12.PageRouteInfo<void> {
  const SplashView({List<_i12.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordView]
class ForgotPasswordView extends _i12.PageRouteInfo<void> {
  const ForgotPasswordView({List<_i12.PageRouteInfo>? children})
      : super(
          ForgotPasswordView.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignupView]
class SignupView extends _i12.PageRouteInfo<void> {
  const SignupView({List<_i12.PageRouteInfo>? children})
      : super(
          SignupView.name,
          initialChildren: children,
        );

  static const String name = 'SignupView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginView]
class LoginView extends _i12.PageRouteInfo<void> {
  const LoginView({List<_i12.PageRouteInfo>? children})
      : super(
          LoginView.name,
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HealthView]
class HealthView extends _i12.PageRouteInfo<void> {
  const HealthView({List<_i12.PageRouteInfo>? children})
      : super(
          HealthView.name,
          initialChildren: children,
        );

  static const String name = 'HealthView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ReminderView]
class ReminderView extends _i12.PageRouteInfo<void> {
  const ReminderView({List<_i12.PageRouteInfo>? children})
      : super(
          ReminderView.name,
          initialChildren: children,
        );

  static const String name = 'ReminderView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DashboardView]
class DashboardView extends _i12.PageRouteInfo<void> {
  const DashboardView({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardView.name,
          initialChildren: children,
        );

  static const String name = 'DashboardView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileView]
class ProfileView extends _i12.PageRouteInfo<void> {
  const ProfileView({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.WorkView]
class WorkView extends _i12.PageRouteInfo<void> {
  const WorkView({List<_i12.PageRouteInfo>? children})
      : super(
          WorkView.name,
          initialChildren: children,
        );

  static const String name = 'WorkView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnboardingView]
class OnboardingView extends _i12.PageRouteInfo<OnboardingViewArgs> {
  OnboardingView({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          OnboardingView.name,
          args: OnboardingViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingView';

  static const _i12.PageInfo<OnboardingViewArgs> page =
      _i12.PageInfo<OnboardingViewArgs>(name);
}

class OnboardingViewArgs {
  const OnboardingViewArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'OnboardingViewArgs{key: $key}';
  }
}
