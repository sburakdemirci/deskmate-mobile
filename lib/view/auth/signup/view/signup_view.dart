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
import '../viewmodel/signup_view_model.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupViewModel>(
      viewModel: SignupViewModel(),
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

  Widget buildScaffoldBody(BuildContext context, SignupViewModel viewModel) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.mediumValue),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: context.horizontalPaddingMedium,
          child: Column(
            children: [
              context.highHeightSizedBoxSpace,
              CustomAnimatedText(
                  context: context,
                  text: LocaleKeys.auth_signup_header_text.locale),
              context.highHeightSizedBoxSpace,
              _buildForm(viewModel, context),
              context.mediumHeightSizedBoxSpace,
              _buildSignupButton(context, viewModel),
              context.mediumHeightSizedBoxSpace,
              _buildLoginHyperText(context, viewModel)
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildForm(SignupViewModel viewModel, BuildContext context) {
    return Observer(builder: (context) {
      return Form(
          autovalidateMode: viewModel.formAutoValidateMode
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: viewModel.formState,
          child: Column(
            children: [
              _buildNameInput(viewModel),
              context.lowHeightSizedBoxSpace,
              _buildEmailInput(viewModel),
              context.lowHeightSizedBoxSpace,
              _buildPasswordInput(viewModel),
            ],
          ));
    });
  }

  Widget _buildEmailInput(SignupViewModel viewModel) {
    return TextInputIconLeft(
        buttonIcon: Icons.email,
        hintText: LocaleKeys.auth_email_input_placeholder.locale,
        controller: viewModel.emailController,
        validator: (value) => value.isValidEmail
            ? null
            : LocaleKeys.auth_validation_error_text_invalid_email.locale);
  }

  Widget _buildNameInput(SignupViewModel viewModel) {
    return TextInputIconLeft(
        buttonIcon: Icons.person,
        hintText: LocaleKeys.auth_name_input_placeholder.locale,
        controller: viewModel.nameController,
        validator: (value) => value.isNotEmpty
            ? null
            : LocaleKeys
                .auth_validation_error_text_name_cannot_be_empty.locale);
  }

  Widget _buildPasswordInput(SignupViewModel viewModel) {
    return PasswordInput(
        controller: viewModel.passwordController,
        hintText: LocaleKeys.auth_password_input_placeholder.locale,
        validator: (value) => value.isNotEmpty
            ? null
            : LocaleKeys.auth_validation_error_text_invalid_password.locale);
  }

  Widget _buildSignupButton(BuildContext context, SignupViewModel viewModel) {
    return DefaultElevatedButton(
      onPressed: () => viewModel.onSignupButtonClicked(),
      title: LocaleKeys.auth_signup_button.locale,
    );
  }

  RichText _buildLoginHyperText(
      BuildContext context, SignupViewModel viewModel) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: LocaleKeys.auth_signup_already_have_an_account.locale,
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
            text: "  ",
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
              text: LocaleKeys.auth_signup_login_hypertext.locale,
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
