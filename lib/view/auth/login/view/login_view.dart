import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deskmate/common/navigation/app_router.dart';
import 'package:deskmate/common/widgets/text_fields/text_input_icon_left.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/init/lang/locale_keys.g.dart';
import 'package:deskmate/core/init/theme/default_text_theme.dart';
import 'package:deskmate/view/auth/login/viewmodel/login_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import 'package:auto_route/auto_route.dart';

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
      body: SafeArea(
          child: Padding(
        padding: context.horizontalPaddingMedium,
        child: Column(
          children: [
            Spacer(
              flex: 6,
            ),
            Expanded(
              flex: 7,
              child: _buildAnimatedText(context),
            ),
            Expanded(
              flex: 5,
              child: _buildUsernameInput(),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 5,
              child: _buildPasswordInput(),
            ),
            Expanded(
              flex: 3,
              child: _buildForgotPasswordText(context),
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 6,
              fit: FlexFit.loose,
              child: _buildLoginButton(context),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: _buildSignupText(context),
            ),
            Spacer(
              flex: 10,
            )
          ],
        ),
      )),
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

  TextInputIconLeft _buildUsernameInput() {
    return TextInputIconLeft(
      hint: LocaleKeys.login_username_input_placeholder.tr(),
      buttonIcon: Icons.mail,
      onTextChanged: (p0) {},
    );
  }

  TextInputIconLeft _buildPasswordInput() {
    return TextInputIconLeft(
      hint: LocaleKeys.login_username_input_placeholder.tr(),
      buttonIcon: Icons.key,
      onTextChanged: (p0) {},
    );
  }

  Align _buildForgotPasswordText(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        LocaleKeys.login_forgot_password.tr(),
        style: context.textTheme.titleMedium,
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
            text: "  ",
            style: context.textTheme.titleMedium,
          ),
          TextSpan(
              text: LocaleKeys.login_sign_up.tr(),
              style:
                  context.textTheme.titleMedium?.copyWith(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
