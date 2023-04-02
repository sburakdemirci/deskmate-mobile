import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/reminder_view_model.dart';

@RoutePage()
class ReminderView extends StatelessWidget {
  const ReminderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderViewModel>(
      viewModel: ReminderViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, ReminderViewModel viewModel) {
    //todo const
    return const Scaffold(
      body: SafeArea(
        child: Text("helooo"),
      ),
    );
  }
}
