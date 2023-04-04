import 'package:deskmate/common/service/error_bottom_sheet_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.gr.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../model/login_request_model.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  LoginService? service;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool formAutoValidateMode = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    service = LoginService(networkManager, localeManager);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @action
  Future<void> onLoginButtonClicked() async {
    if (formState.currentState!.validate()) {
      await service
          ?.loginUser(LoginRequestModel(
              email: emailController.text, password: passwordController.text))
          .then((value) => service?.getUserProfile())
          .then((value) => appRouter.replace(const DashboardView()))
          .catchError((error) {
        ErrorBottomSheetService.showErrorSheet(
            viewModelContext, "Incorrect username or password");
        return null;
      });
    } else {
      _setFormAutoValidateMode();
    }
  }

  void onSignupHyperTextClicked() {
    appRouter.replace(const SignupView());
  }

  void onForgotPasswordHyperTextClicked() {
    appRouter.push(const ForgotPasswordView());
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @action
  void _setFormAutoValidateMode() {
    formAutoValidateMode = true;
  }


}
