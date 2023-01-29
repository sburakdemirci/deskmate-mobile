import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deskmate/common/widget/animated/custom_animated_text.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/extension/string_extension.dart';
import 'package:deskmate/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/forgot_password_view_model.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(
      BuildContext context, ForgotPasswordViewModel viewModel) {
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
                  text: LocaleKeys.auth_forgot_password_header_text.tr()),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildForm(viewModel, context),
              SizedBox(
                height: context.mediumValue,
              ),
              _buildResetPasswordButton(context, viewModel),
              SizedBox(
                height: context.lowValue,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Form _buildForm(ForgotPasswordViewModel viewModel, BuildContext context) {
    return Form(
        key: viewModel.formState,
        child: Column(
          children: [
            _buildEmailInput(viewModel),
          ],
        ));
  }

  TextFormField _buildEmailInput(ForgotPasswordViewModel viewModel) {
    return TextFormField(
        controller: viewModel.emailController,
        validator: (value) => value!.validateEmail,
        decoration: InputDecoration(
          hintText: LocaleKeys.auth_email_input_placeholder.tr(),
          prefixIcon: const Icon(Icons.mail),
        ),
        onChanged: (value) {});
  }

  ElevatedButton _buildResetPasswordButton(
      BuildContext context, ForgotPasswordViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.onResetButtonClicked();
      },
      child: Text(
        LocaleKeys.auth_forgot_password_button_text.tr(),
        style: context.textTheme.button,
      ),
    );
  }
}
