
import 'package:deskmate/common/service/bottom_sheet_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.gr.dart';
import '../../../../core/base/model/base_view_model.dart';
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
  bool formAutoValidateMode = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    service = SignupService(networkManager);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @action
  Future<void> onSignupButtonClicked() async {
    if (formState.currentState!.validate()) {
      await service
          ?.signupUser(SignupRequestModel(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text))
          .then((value) => appRouter.push(const AnimationRouteView()))
          .catchError((error) {
        BottomSheetService.showErrorSheet(
            viewModelContext, "Problem while signup");
        return null;
      });
    } else {
      _setFormAutoValidateMode();
    }
  }

  @action
  void onSignupHyperTextClicked() {
    appRouter.push(const LoginView());
  }

  @action
  void _setFormAutoValidateMode() {
    formAutoValidateMode = true;
  }

  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
}
