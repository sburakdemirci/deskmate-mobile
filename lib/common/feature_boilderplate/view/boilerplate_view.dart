import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/boilerplate_view_model.dart';

class BoilerplateView extends StatelessWidget {
  const BoilerplateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BoilerplateViewModel>(
      viewModel: BoilerplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(
      BuildContext context, BoilerplateViewModel viewModel) {
    //todo const
    return const Scaffold(
      body: SafeArea(
        child: Text("helooo"),
      ),
    );
  }
}
