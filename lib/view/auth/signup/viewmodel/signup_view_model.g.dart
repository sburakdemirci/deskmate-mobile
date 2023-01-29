// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupViewModel on SignupViewModelBase, Store {
  late final _$isHidePasswordAtom =
      Atom(name: 'SignupViewModelBase.isHidePassword', context: context);

  @override
  bool get isHidePassword {
    _$isHidePasswordAtom.reportRead();
    return super.isHidePassword;
  }

  @override
  set isHidePassword(bool value) {
    _$isHidePasswordAtom.reportWrite(value, super.isHidePassword, () {
      super.isHidePassword = value;
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
  void onPasswordIconClicked() {
    final _$actionInfo = _$SignupViewModelBaseActionController.startAction(
        name: 'SignupViewModelBase.onPasswordIconClicked');
    try {
      return super.onPasswordIconClicked();
    } finally {
      _$SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidePassword: ${isHidePassword}
    ''';
  }
}
