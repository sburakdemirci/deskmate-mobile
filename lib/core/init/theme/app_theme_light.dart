import 'package:deskmate/core/init/theme/default_text_theme.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  static const _FONT_FAMILY = 'POPPINS';

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: _FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        brightness: Brightness.light,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black87, size: 21)),
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: OutlineInputBorder()),
        scaffoldBackgroundColor: const Color(0xfff1f3f8),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: const ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: const EdgeInsets.all(5),
      labelColor: _appColorScheme.onSecondary,
      labelStyle: DefaultTextTheme.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.apply(fontFamily: _FONT_FAMILY);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: Colors.blueAccent,
        // primaryVariant: Colors.white, //xx
        secondary: Colors.green,
        // secondaryVariant: colorSchemeLight!.azure,
        surface: Colors.blue, //xx
        background: const Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
