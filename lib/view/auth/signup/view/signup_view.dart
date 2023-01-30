import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deskmate/common/widget/animated/custom_animated_text.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/string_extension.dart';
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
              SizedBox(
                height: context.highValue,
              ),
              CustomAnimatedText(
                  context: context,
                  text: LocaleKeys.auth_signup_header_text.tr()),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildForm(viewModel, context),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildSignupButton(context, viewModel),
              SizedBox(
                height: context.lowValue,
              ),
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
            SizedBox(
              height: context.lowValue,
            ),
            _buildPasswordInput(viewModel),
            SizedBox(
              height: context.lowValue,
            ),
            _buildNameInput(viewModel)
          ],
        ));
  }

  TextFormField _buildEmailInput(SignupViewModel viewModel) {
    return TextFormField(
        controller: viewModel.emailController,
        validator: (value) => value!.validateEmail,
        decoration: InputDecoration(
          hintText: LocaleKeys.auth_email_input_placeholder.tr(),
          prefixIcon: const Icon(Icons.mail),
        ),
        onChanged: (value) {});
  }

  TextFormField _buildNameInput(SignupViewModel viewModel) {
    return TextFormField(
        controller: viewModel.nameController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        decoration: InputDecoration(
          hintText: LocaleKeys.auth_name_input_placeholder.tr(),
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
                hintText: LocaleKeys.auth_password_input_placeholder.tr(),
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

  ElevatedButton _buildSignupButton(
      BuildContext context, SignupViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.onSignupButtonClicked();
      },
      child: Text(
        LocaleKeys.auth_signup_button.tr(),
        style: context.textTheme.button,
      ),
    );
  }
}
