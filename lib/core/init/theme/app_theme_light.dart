import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'default_text_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  static const _fontFamily = 'NunitoSans';

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: _fontFamily,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        brightness: Brightness.light,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black87, size: 25)),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black,
          labelStyle: const TextStyle(),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(18),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                alignment: Alignment.center,
                shape: const StadiumBorder())),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              textTheme: ButtonTextTheme.primary,
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
    return ThemeData.light(useMaterial3: true)
        .textTheme
        .apply(fontFamily: _fontFamily, displayColor: Colors.black);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: const Color.fromARGB(255, 70, 182, 242),
        // primaryVariant: Colors.white, //xx
        secondary: Colors.green,
        // secondaryVariant: colorSchemeLight!.azure,
        surface: Colors.blue, //xx
        background: const Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.black,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
