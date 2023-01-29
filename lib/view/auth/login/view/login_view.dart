import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/init/lang/locale_keys.g.dart';
import 'package:deskmate/view/auth/login/viewmodel/login_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/string_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              SizedBox(
                height: context.highValue,
              ),
              _buildAnimatedText(context),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildForm(viewModel, context),
              SizedBox(
                height: context.lowValue,
              ),
              _buildForgotPasswordText(context),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildLoginButton(context, viewModel),
              SizedBox(
                height: context.lowValue,
              ),
              _buildSignupText(context)
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildAnimatedText(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(LocaleKeys.login_header_text.tr(),
              textStyle: context.textTheme.headlineMedium,
              speed: context.durationLow),
        ],
      ),
    );
  }

  Form _buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
        key: viewModel.formState,
        child: Column(
          children: [
            _buildUsernameInput(viewModel),
            SizedBox(
              height: context.lowValue,
            ),
            _buildPasswordInput(viewModel),
          ],
        ));
  }

  TextFormField _buildUsernameInput(LoginViewModel viewModel) {
    return TextFormField(
        controller: viewModel.emailController,
        validator: (value) => value!.validateEmail,
        decoration: InputDecoration(
          hintText: LocaleKeys.login_username_input_placeholder.tr(),
          prefixIcon: const Icon(Icons.mail),
        ),
        onChanged: (value) {});
  }

  Widget _buildPasswordInput(LoginViewModel viewModel) {
    return Observer(
      builder: (context) {
        return TextFormField(
            obscureText: viewModel.isHidePassword,
            controller: viewModel.passwordController,
            validator: (value) =>
                value!.isNotEmpty ? null : 'This field required',
            decoration: InputDecoration(
                hintText: LocaleKeys.login_username_input_placeholder.tr(),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: GestureDetector(
                    onTap: () {
                      viewModel.onPasswordIconClicked();
                    },
                    child: viewModel.isHidePassword
                        ? const Icon(
                            Icons.remove_red_eye_outlined,
                          )
                        : const Icon(Icons.visibility_off_outlined))),
            onChanged: (value) {});
      },
    );
  }

  Align _buildForgotPasswordText(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        LocaleKeys.login_forgot_password.tr(),
        style: context.textTheme.subtitle1,
      ),
    );
  }

  ElevatedButton _buildLoginButton(
      BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.onLoginButtonClicked();
      },
      child: Text(
        LocaleKeys.login_login.tr(),
        style: context.textTheme.button,
      ),
    );
  }

  RichText _buildSignupText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: LocaleKeys.login_dont_have_an_account_yet.tr(),
            style: context.textTheme.subtitle1,
          ),
          TextSpan(
            text: "  ",
            style: context.textTheme.subtitle1,
          ),
          TextSpan(
              text: LocaleKeys.login_sign_up.tr(),
              style: context.textTheme.subtitle1?.copyWith(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
