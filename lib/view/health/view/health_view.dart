import '../../../common/asset/assets.gen.dart';
import '../../../common/widget/appbar/main_app_bar.dart';
import '../../../common/widget/card/generic_color_card.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../common/widget/card/image_card_small.dart';
import '../viewmodel/health_view_model.dart';

class HealthView extends StatelessWidget {
  const HealthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HealthViewModel>(
      viewModel: HealthViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, HealthViewModel viewModel) {
    //todo const
    return Scaffold(
      appBar: buildAppBar(context, "Good morning Burak"),
      body: SafeArea(
          child: Padding(
        padding: context.paddingNormal,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.health_for_you.locale,
                    style: context.textTheme.headlineMedium),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            GenericColorCard(
              cardTitle: "Arm Streching",
              cardSubtitle: "Some subtitle",
              onClicked: () {},
              imageUrl: Assets.image.health.womanStreching.path,
            ),
            SizedBox(
              height: context.lowValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.health_recently_added.locale,
                    style: context.textTheme.headlineSmall),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            SizedBox(
              height: 140,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) {
                  return ImageCardSmall(
                      cardTitle: "Arm Streching",
                      cardSubtitle: "Beginner | 5 ",
                      backgroundColor: Colors.orange,
                      imageUrl: Assets.image.health.menNeckStreching.path,
                      onClicked: (() {}));
                },
                scrollDirection: Axis.horizontal,
                // children: [
                //   ImageCardSmall(
                //       cardTitle: "Arm Streching",
                //       cardSubtitle: "Beginner | 5 ",
                //       backgroundColor: Colors.orange,
                //       imageUrl: "assets/images/woman-neck-streching.png",
                //       onClicked: (() {})),
                //   ImageCardSmall(
                //       cardTitle: "Arm Streching",
                //       cardSubtitle: "Beginner | 5 Minutes",
                //       backgroundColor: Colors.orange,
                //       imageUrl: "assets/images/woman-neck-streching.png",
                //       onClicked: (() {})),
                //   ImageCardSmall(
                //       cardTitle: "Arm Streching",
                //       cardSubtitle: "Beginner | 5 Minutes",
                //       backgroundColor: Colors.orange,
                //       imageUrl: "assets/images/woman-neck-streching.png",
                //       onClicked: (() {}))
                // ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
