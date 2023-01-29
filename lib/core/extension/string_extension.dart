import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

//todo return email is not valid from translations
  String? get validateEmail =>
      contains(RegExp(ApplicationConstants.EMAIL_REGIEX))
          ? null
          : 'Email does not valid';

  bool get isValidEmail =>
      RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);
}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}
