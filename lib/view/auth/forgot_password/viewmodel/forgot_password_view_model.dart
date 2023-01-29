import 'package:auto_route/auto_route.dart';
import 'package:deskmate/common/feature_boilderplate/service/boilerplate_service.dart';
import 'package:deskmate/common/navigation/app_router.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:deskmate/view/auth/forgot_password/model/forgot_password_request_model.dart';
import 'package:deskmate/view/auth/forgot_password/service/forgot_password_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class ForgotPasswordViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController emailController = TextEditingController();

  ForgotPasswordService? service;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = ForgotPasswordService(NetworkManager.instance);
  }

  @action
  Future<void> onResetButtonClicked() async {
    if (formState.currentState!.validate()) {
      var loginUser = await service
          ?.onResetPasswordClicked(
              ForgotPasswordRequestModel(email: emailController.text))
          .then((value) => viewModelContext.router.replace(const LoginRoute()));
    }
  }
}
