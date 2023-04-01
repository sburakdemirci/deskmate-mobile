import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../common/widget/animated/custom_animated_text.dart';
import '../../../../common/widget/button/default_elevated_button.dart';
import '../../../../common/widget/input/text_input_icon_left.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension_custom.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
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
      onDispose: (model) {
        model.dispose();
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
              context.highHeightSizedBoxSpace,
              CustomAnimatedText(
                  context: context,
                  text: LocaleKeys.auth_forgot_password_header_text.locale),
              context.highHeightSizedBoxSpace,
              _buildForm(viewModel, context),
              context.mediumHeightSizedBoxSpace,
              _buildResetPasswordButton(context, viewModel),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildForm(ForgotPasswordViewModel viewModel, BuildContext context) {
    return Observer(builder: (context) {
      return Form(
          autovalidateMode: viewModel.formAutoValidateMode
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: viewModel.formState,
          child: Column(
            children: [
              _buildEmailInput(viewModel),
            ],
          ));
    });
  }

  Widget _buildEmailInput(ForgotPasswordViewModel viewModel) {
    return TextInputIconLeft(
        buttonIcon: Icons.email,
        hintText: LocaleKeys.auth_email_input_placeholder.locale,
        controller: viewModel.emailController,
        validator: (value) => value.isValidEmail
            ? null
            : LocaleKeys.auth_validation_error_text_invalid_email.locale);
  }

  Widget _buildResetPasswordButton(
      BuildContext context, ForgotPasswordViewModel viewModel) {
    return DefaultElevatedButton(
      onPressed: () => viewModel.onResetButtonClicked(),
      title: LocaleKeys.auth_forgot_password_button_text.locale,
    );
  }
}
