import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.gr.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/shared_preference_key.dart';
import '../../../../core/init/network/network_manager.dart';
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
    service = LoginService(NetworkManager.instance);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @action
  Future<void> onLoginButtonClicked() async {
    if (formState.currentState!.validate()) {
      var loginUser = await service?.loginUser(LoginRequestModel(
          email: emailController.text, password: passwordController.text));
      if (loginUser != null) {
        localeManager.setStringValue(
            SharedPreferenceKey.ACCESS_TOKEN, loginUser.accessToken!);
        localeManager.setStringValue(
            SharedPreferenceKey.REFRESH_TOKEN, loginUser.refreshToken!);
        appRouter.replace(const DashboardView());
      }
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

  //todo dispose controllers

  // void showErrorSheet() {
  //   showModalBottomSheet(
  //       context: viewModelContext,
  //       builder: (context) => Container(
  //             color: Colors.transparent,
  //             height: MediaQuery.of(context).size.height * 0.12,
  //             child: Center(
  //               child: ListTile(
  //                 leading: Icon(
  //                   Icons.error_outline,
  //                   color: Colors.red,
  //                 ),
  //                 title: Text("helo"),
  //                 subtitle: Text("heloo2"),
  //               ),
  //             ),
  //           ));
  // }

  //dispose yap ve kontrol et metoda girildini
  //onDispose var ona bak
}
