import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get appTheme => Theme.of(this);
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  SizedBox get lowHeightSizedBoxSpace => SizedBox(height: lowValue);
  SizedBox get mediumHeightSizedBoxSpace => SizedBox(height: mediumValue);
  SizedBox get highHeightSizedBoxSpace => SizedBox(height: highValue);

  SizedBox get lowWidthSizedBoxSpace => SizedBox(width: lowValue);
  SizedBox get mediumWidthtSizedBoxSpace => SizedBox(width: mediumValue);
  SizedBox get highWidthSizedBoxSpace => SizedBox(width: highValue);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get notchHeight => mediaQuery.viewPadding.bottom;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
  double get maxValue => height * 0.2;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension BottomSheetExtension on BuildContext {
  double get bottomSheetMaxSafeHeight =>
      (height - notchHeight - lowValue) / height;

  double get bottomSheetMinHeight => height * 0.2 / height;
  double get bottomSheetLowHeight => height * 0.3 / height;
  double get bottomSheetMediumHeight => height * 0.5 / height;
  double get bottomSheetHighHeight => height * 0.7 / height;
}

//Device operating system checking with context value
// extension DeviceOSExtension on BuildContext {
//   bool get isAndroidDevice => Platform.isAndroid;
//   bool get isIOSDevice => Platform.isIOS;
//   bool get isWindowsDevice => Platform.isWindows;
//   bool get isLinuxDevice => Platform.isLinux;
//   bool get isMacOSDevice => Platform.isMacOS;
// }

//Device Screen Type By Width(300-600-900)
//Values from https://flutter.dev/docs/development/ui/layout/building-adaptive-apps
// extension ContextDeviceTypeExtension on BuildContext {
//   bool get isSmallScreen =>
//       width >= ResponsibilityConstants.instance.smallScreenSize &&
//               width < ResponsibilityConstants.instance.mediumScreenSize
//           ? true
//           : false;

//   bool get isMediumScreen =>
//       width >= ResponsibilityConstants.instance.mediumScreenSize &&
//               width < ResponsibilityConstants.instance.largeScreenSize
//           ? true
//           : false;

//   bool get isLargeScreen =>
//       width >= ResponsibilityConstants.instance.largeScreenSize ? true : false;
// }

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 100);
  Duration get durationNormal => const Duration(seconds: 1);
  Duration get durationSlow => const Duration(seconds: 2);
  Duration get durationVerySlow => const Duration(seconds: 5);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalPaddingLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get onlyLeftPaddingLow => EdgeInsets.only(left: lowValue);
  EdgeInsets get onlyLeftPaddingNormal => EdgeInsets.only(left: normalValue);
  EdgeInsets get onlyLeftPaddingMedium => EdgeInsets.only(left: mediumValue);
  EdgeInsets get onlyLeftPaddingHigh => EdgeInsets.only(left: highValue);

  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowValue);
  EdgeInsets get onlyRightPaddingNormal => EdgeInsets.only(right: normalValue);
  EdgeInsets get onlyRightPaddingMedium => EdgeInsets.only(right: mediumValue);
  EdgeInsets get onlyRightPaddingHigh => EdgeInsets.only(right: highValue);

  EdgeInsets get onlyBottomPaddingLow => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get onlyBottomPaddingNormal =>
      EdgeInsets.only(bottom: normalValue);
  EdgeInsets get onlyBottomPaddingMedium =>
      EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get onlyBottomPaddingHigh => EdgeInsets.only(bottom: highValue);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get onlyTopPaddingNormal => EdgeInsets.only(top: normalValue);
  EdgeInsets get onlyTopPaddingMedium => EdgeInsets.only(top: mediumValue);
  EdgeInsets get onlyTopPaddingHigh => EdgeInsets.only(top: highValue);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highRadius => Radius.circular(width * 0.1);
}

extension BorderExtension on BuildContext {
  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.1));

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)),
      );

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(normalValue)),
      );

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(mediumValue)),
      );

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)),
      );
}
