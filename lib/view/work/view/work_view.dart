import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../common/asset/assets.gen.dart';
import '../../../common/widget/card/image_card_full.dart';
import '../../../core/extension/context_extension.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ImageCardFull(
                cardTitle: "Beginner",
                imageUrl: Assets.image.health.menNeckStreching.path,
                descriptionSubtitle: "5 min | pain relief",
                descriptionTitle: "Neck Streching",
              ),
              context.mediumHeightSizedBoxSpace,
              ImageCardFull(
                cardTitle: "Beginner",
                imageUrl: Assets.image.health.menNeckStreching.path,
                descriptionSubtitle: "5 min | pain relief",
                descriptionTitle: "Neck Streching",
              )
            ],
          ),
        ),
      ),
    );
  }
}
