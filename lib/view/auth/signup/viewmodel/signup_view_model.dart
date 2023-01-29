import 'package:deskmate/core/constants/enums/shared_preference_key.dart';
import 'package:deskmate/view/auth/login/model/login_request_model.dart';
import 'package:deskmate/view/auth/login/service/login_service.dart';
import 'package:deskmate/view/auth/signup/model/signup_request_model.dart';
import 'package:deskmate/view/auth/signup/service/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';

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
      if (response != null) {}
    }
  }

  @action
  void onPasswordIconClicked() {
    isHidePassword = !isHidePassword;
  }
}
