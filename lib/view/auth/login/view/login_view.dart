import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../common/widget/animated/custom_animated_text.dart';
import '../../../../common/widget/button/default_elevated_button.dart';
import '../../../../common/widget/input/password_input.dart';
import '../../../../common/widget/input/text_input_icon_left.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension_custom.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

@RoutePage()
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
      onDispose: (model) {
        model.dispose();
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
              context.highHeightSizedBoxSpace,
              CustomAnimatedText(
                  context: context,
                  text: LocaleKeys.auth_login_header_text.locale),
              context.highHeightSizedBoxSpace,
              _buildForm(viewModel, context),
              context.lowHeightSizedBoxSpace,
              _buildForgotPasswordText(context, viewModel),
              context.mediumHeightSizedBoxSpace,
              _buildLoginButton(context, viewModel),
              context.mediumHeightSizedBoxSpace,
              _buildSignupHyperText(context, viewModel)
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildForm(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (context) {
      return Form(
          autovalidateMode: viewModel.formAutoValidateMode
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: viewModel.formState,
          child: Column(
            children: [
              _buildEmailInput(viewModel),
              context.lowHeightSizedBoxSpace,
              _buildPasswordInput(viewModel),
            ],
          ));
    });
  }

  Widget _buildEmailInput(LoginViewModel viewModel) {
    return TextInputIconLeft(
        buttonIcon: Icons.email,
        hintText: LocaleKeys.auth_email_input_placeholder.locale,
        controller: viewModel.emailController,
        validator: (value) => value.isValidEmail
            ? null
            : LocaleKeys.auth_validation_error_text_invalid_email.locale);
  }

  Widget _buildPasswordInput(LoginViewModel viewModel) {
    return PasswordInput(
        controller: viewModel.passwordController,
        hintText: LocaleKeys.auth_password_input_placeholder.locale,
        validator: (value) => value.isNotEmpty
            ? null
            : LocaleKeys.auth_validation_error_text_invalid_password.locale);
  }

  Align _buildForgotPasswordText(
      BuildContext context, LoginViewModel viewModel) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          viewModel.onForgotPasswordHyperTextClicked();
        },
        child: Text(
          LocaleKeys.auth_login_forgot_password.locale,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return DefaultElevatedButton(
      onPressed: () => viewModel.onLoginButtonClicked(),
      title: LocaleKeys.auth_login_login_button.locale,
    );
  }

  RichText _buildSignupHyperText(
      BuildContext context, LoginViewModel viewModel) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: LocaleKeys.auth_login_dont_have_an_account_yet.locale,
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
            text: "  ",
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
              text: LocaleKeys.auth_login_sign_up_hypertext.locale,
              style:
                  context.textTheme.titleMedium?.copyWith(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  viewModel.onSignupHyperTextClicked();
                }),
        ],
      ),
    );
  }
}
