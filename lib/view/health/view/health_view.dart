import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../common/asset/assets.gen.dart';
import '../../../common/widget/appbar/main_app_bar.dart';
import '../../../common/widget/bottom_sheet/draggable_bottom_sheet.dart';
import '../../../common/widget/card/card_with_button_image_switch.dart';
import '../../../common/widget/card/featured_card.dart';
import '../../../common/widget/card/icon_square_card_button.dart';
import '../../../common/widget/card/image_card_small.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension_custom.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/health_view_model.dart';

@RoutePage()
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

  //TODO split the sections as subviews and wrap them with observer

  Widget buildScaffoldBody(BuildContext context, HealthViewModel viewModel) {
    //todo const
    return Scaffold(
      appBar: buildAppBar(context, "Good morning Burak"),
      body: SafeArea(
          child: Padding(
        padding: context.paddingNormal,
        child: ListView(
          scrollDirection: Axis.vertical,
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
            SizedBox(
              height: context.lowValue,
            ),
            FeaturedCard(
              cardTitle: "Arm Streching",
              cardSubtitle: "Some subtitle",
              onClicked: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: ((context) => DraggableSheet(
                          initialSize: context.bottomSheetMinHeight,
                          maxSize: context.bottomSheetMaxSafeHeight,
                          child: const Text("aheyya"),
                        )));
              },
              imageUrl: Assets.image.health.womanStreching.path,
            ),
            context.mediumHeightSizedBoxSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.health_exercise_bundles.locale,
                    style: context.textTheme.headlineSmall),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            SizedBox(
              height: context.lowValue,
            ),
            SizedBox(
              height: context.dynamicWidth(0.35),
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) {
                  return ImageCardSmall(
                      cardTitle: "Arm Streching",
                      cardSubtitle: "Level 1",
                      backgroundColor: Colors.orange,
                      imageUrl: Assets.image.health.menNeckStreching.path,
                      onClicked: (() {}));
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            Text(
              LocaleKeys.health_select_a_body_part.locale,
              style: context.textTheme.headlineSmall,
            ),
            SizedBox(
              height: context.lowValue,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                SquareCardButton(
                  imageSrc: Assets.icon.health.neckIcon.path,
                  cardText: LocaleKeys.health_body_part_neck.locale,
                  onClicked: () {},
                ),
                SquareCardButton(
                  imageSrc: Assets.icon.health.wristIcon.path,
                  cardText: LocaleKeys.health_body_part_wrist.locale,
                  onClicked: () {},
                ),
                SquareCardButton(
                  imageSrc: Assets.icon.health.armIcon.path,
                  cardText: LocaleKeys.health_body_part_arm.locale,
                  onClicked: () {},
                ),
                SquareCardButton(
                  imageSrc: Assets.icon.health.humanBackIcon.path,
                  cardText: LocaleKeys.health_body_part_back.locale,
                  onClicked: () {},
                ),
                SquareCardButton(
                  imageSrc: Assets.icon.health.humanShoulderIcon.path,
                  cardText: LocaleKeys.health_body_part_shoulder.locale,
                  onClicked: () {},
                ),
                SquareCardButton(
                  imageSrc: Assets.icon.health.humanLegsIcon.path,
                  cardText: LocaleKeys.health_body_part_leg.locale,
                  onClicked: () {},
                ),
              ],
            ),
            context.mediumHeightSizedBoxSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.health_healthy_reminders.locale,
                    style: context.textTheme.headlineSmall),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            context.lowHeightSizedBoxSpace,
            CardWithButtonImageSwitch(
              imageSrc: Assets.icon.health.eyeIcon.path,
              cardTitle: "Eye Rest Reminder",
              cardSubtitle: "Rest your eyessss",
              isSwitch: true,
              onSwitch: (p0) {},
              onCardClicked: () {},
            ),
          ],
        ),
      )),
    );
  }
}
