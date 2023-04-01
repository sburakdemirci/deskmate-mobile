import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../common/widget/animated/custom_animated_text.dart';
import '../../../../common/widget/button/default_elevated_button.dart';
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
              _buildLoginText(context, viewModel)
            ],
          ),
        )),
      ),
    );
  }

  Form _buildForm(SignupViewModel viewModel, BuildContext context) {
    return Form(
        key: viewModel.formState,
        child: Column(
          children: [
            _buildEmailInput(viewModel),
            context.lowHeightSizedBoxSpace,
            _buildPasswordInput(viewModel),
            context.lowHeightSizedBoxSpace,
            _buildNameInput(viewModel),
          ],
        ));
  }

  TextFormField _buildEmailInput(SignupViewModel viewModel) {
    return TextFormField(
        controller: viewModel.emailController,
        validator: (value) => value!.validateEmail,
        decoration: InputDecoration(
          hintText: LocaleKeys.auth_email_input_placeholder.locale,
          prefixIcon: const Icon(Icons.mail),
        ),
        onChanged: (value) {});
  }

  TextFormField _buildNameInput(SignupViewModel viewModel) {
    return TextFormField(
        controller: viewModel.nameController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        decoration: InputDecoration(
          hintText: LocaleKeys.auth_name_input_placeholder.locale,
          prefixIcon: const Icon(Icons.person),
        ),
        onChanged: (value) {});
  }

  Widget _buildPasswordInput(SignupViewModel viewModel) {
    return Observer(
      builder: (context) {
        return TextFormField(
            obscureText: viewModel.isHidePassword,
            controller: viewModel.passwordController,
            validator: (value) =>
                value!.isNotEmpty ? null : 'This field required',
            decoration: InputDecoration(
                hintText: LocaleKeys.auth_password_input_placeholder.locale,
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

  Widget _buildSignupButton(BuildContext context, SignupViewModel viewModel) {
    return DefaultElevatedButton(
      onPressed: () => viewModel.onSignupButtonClicked(),
      title: LocaleKeys.auth_signup_button.locale,
    );
  }

  RichText _buildLoginText(BuildContext context, SignupViewModel viewModel) {
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
