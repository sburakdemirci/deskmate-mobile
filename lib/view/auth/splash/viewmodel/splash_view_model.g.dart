// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on SplashViewModelBase, Store {
  late final _$isFirstInitAtom =
      Atom(name: 'SplashViewModelBase.isFirstInit', context: context);

  @override
  bool get isFirstInit {
    _$isFirstInitAtom.reportRead();
    return super.isFirstInit;
  }

  @override
  set isFirstInit(bool value) {
    _$isFirstInitAtom.reportWrite(value, super.isFirstInit, () {
      super.isFirstInit = value;
    });
  }

  late final _$SplashViewModelBaseActionController =
      ActionController(name: 'SplashViewModelBase', context: context);

  @override
  void _changeFirstInit() {
    final _$actionInfo = _$SplashViewModelBaseActionController.startAction(
        name: 'SplashViewModelBase._changeFirstInit');
    try {
      return super._changeFirstInit();
    } finally {
      _$SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstInit: ${isFirstInit}
    ''';
  }
}
