import 'package:auto_route/auto_route.dart';
import 'package:deskmate/common/navigation/app_router.dart';
import 'package:deskmate/core/constants/enums/shared_preference_key.dart';
import 'package:deskmate/view/auth/login/model/login_request_model.dart';
import 'package:deskmate/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  LoginService? service;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool isHidePassword = true;

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
      }
    }
  }

  void onSignupHyperTextClicked() {
    viewModelContext.router.push(const SignupRoute());
  }

  void onForgotPasswordHyperTextClicked() {
    viewModelContext.router.push(const ForgotPasswordRoute());
  }

  @action
  void onPasswordIconClicked() {
    isHidePassword = !isHidePassword;
  }

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
