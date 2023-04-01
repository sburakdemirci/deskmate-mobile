import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';
import '../init/lang/locale_keys.g.dart';

extension StringExtensionCustom on String {
  String get locale => this.tr();

//todo return email is not valid from translations
  String? get validateEmail =>
      contains(RegExp(ApplicationConstants.EMAIL_REGIEX))
          ? null
          : LocaleKeys.auth_validation_error_text_invalid_email.locale;

  bool get isValidEmail =>
      RegExp(ApplicationConstants.EMAIL_REGIEX).hasMatch(this);
}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}
