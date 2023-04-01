// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordViewModel on ForgotPasswordViewModelBase, Store {
  late final _$formAutoValidateModeAtom = Atom(
      name: 'ForgotPasswordViewModelBase.formAutoValidateMode',
      context: context);

  @override
  bool get formAutoValidateMode {
    _$formAutoValidateModeAtom.reportRead();
    return super.formAutoValidateMode;
  }

  @override
  set formAutoValidateMode(bool value) {
    _$formAutoValidateModeAtom.reportWrite(value, super.formAutoValidateMode,
        () {
      super.formAutoValidateMode = value;
    });
  }

  late final _$onResetButtonClickedAsyncAction = AsyncAction(
      'ForgotPasswordViewModelBase.onResetButtonClicked',
      context: context);

  @override
  Future<void> onResetButtonClicked() {
    return _$onResetButtonClickedAsyncAction
        .run(() => super.onResetButtonClicked());
  }

  late final _$ForgotPasswordViewModelBaseActionController =
      ActionController(name: 'ForgotPasswordViewModelBase', context: context);

  @override
  void _setFormAutoValidateMode() {
    final _$actionInfo =
        _$ForgotPasswordViewModelBaseActionController.startAction(
            name: 'ForgotPasswordViewModelBase._setFormAutoValidateMode');
    try {
      return super._setFormAutoValidateMode();
    } finally {
      _$ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formAutoValidateMode: ${formAutoValidateMode}
    ''';
  }
}
