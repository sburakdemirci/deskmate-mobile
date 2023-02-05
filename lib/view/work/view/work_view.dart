import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/work_view_model.dart';

class WorkView extends StatelessWidget {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WorkViewModel>(
      viewModel: WorkViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, WorkViewModel viewModel) {
    //todo const
    return Scaffold(
      body: SafeArea(
        child: Text("helooo"),
      ),
    );
  }
}
