import 'package:deskmate/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';

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
        child: Text("helooo"),
      ),
    );
  }
}
