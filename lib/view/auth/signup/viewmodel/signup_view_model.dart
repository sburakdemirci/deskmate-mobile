import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/signup_request_model.dart';
import '../service/signup_service.dart';

part 'signup_view_model.g.dart';

class SignupViewModel = SignupViewModelBase with _$SignupViewModel;

abstract class SignupViewModelBase with Store, BaseViewModel {
  SignupService? service;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool isHidePassword = true;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    service = SignupService(NetworkManager.instance);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @action
  Future<void> onSignupButtonClicked() async {
    if (formState.currentState!.validate()) {
      var response = await service?.signupUser(SignupRequestModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text));
      if (response?.statusCode == HttpStatus.ok) {
        viewModelContext.router.push(const AnimationRouteRoute());
      }
    }
  }

  void onSignupHyperTextClicked() {
    viewModelContext.router.push(const LoginRoute());
  }

  @action
  void onPasswordIconClicked() {
    isHidePassword = !isHidePassword;
  }
}
