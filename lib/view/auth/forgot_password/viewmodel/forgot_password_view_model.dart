import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.gr.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/forgot_password_request_model.dart';
import '../service/forgot_password_service.dart';

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
  bool formAutoValidateMode = false;

  @override
  void init() {
    service = ForgotPasswordService(NetworkManager.instance);
  }

  @action
  Future<void> onResetButtonClicked() async {
    if (formState.currentState!.validate()) {
      await service
          ?.resetPassword(
              ForgotPasswordRequestModel(email: emailController.text))
          .then((value) => viewModelContext.router.replace(const LoginView()));
    } else {
      _setFormAutoValidateMode();
    }
  }

  @action
  void _setFormAutoValidateMode() {
    formAutoValidateMode = true;
  }

  void dispose() {
    emailController.dispose();
  }
}
