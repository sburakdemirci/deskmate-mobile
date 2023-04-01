// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupViewModel on SignupViewModelBase, Store {
  late final _$formAutoValidateModeAtom =
      Atom(name: 'SignupViewModelBase.formAutoValidateMode', context: context);

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

  late final _$onSignupButtonClickedAsyncAction = AsyncAction(
      'SignupViewModelBase.onSignupButtonClicked',
      context: context);

  @override
  Future<void> onSignupButtonClicked() {
    return _$onSignupButtonClickedAsyncAction
        .run(() => super.onSignupButtonClicked());
  }

  late final _$SignupViewModelBaseActionController =
      ActionController(name: 'SignupViewModelBase', context: context);

  @override
  void onSignupHyperTextClicked() {
    final _$actionInfo = _$SignupViewModelBaseActionController.startAction(
        name: 'SignupViewModelBase.onSignupHyperTextClicked');
    try {
      return super.onSignupHyperTextClicked();
    } finally {
      _$SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setFormAutoValidateMode() {
    final _$actionInfo = _$SignupViewModelBaseActionController.startAction(
        name: 'SignupViewModelBase._setFormAutoValidateMode');
    try {
      return super._setFormAutoValidateMode();
    } finally {
      _$SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formAutoValidateMode: ${formAutoValidateMode}
    ''';
  }
}
