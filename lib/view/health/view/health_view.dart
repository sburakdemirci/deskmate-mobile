import 'package:auto_route/auto_route.dart';
import 'package:deskmate/common/asset/colors.gen.dart';
import 'package:deskmate/common/service/bottom_sheet_service.dart';
import 'package:deskmate/common/widget/bottom_sheet/draggable_bottom_sheet.dart';
import 'package:deskmate/common/widget/card/reminder_widget.dart';
import 'package:deskmate/common/widget/container/rounded_wrapper_container.dart';
import 'package:deskmate/common/widget/text/rounded_text_container.dart';
import 'package:deskmate/view/health/view/subview/exercise_selection_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../common/asset/assets.gen.dart';
import '../../../common/widget/appbar/main_app_bar.dart';
import '../../../common/widget/card/card_with_button_image_switch.dart';
import '../../../common/widget/card/featured_card.dart';
import '../../../common/widget/card/icon_square_card_button.dart';
import '../../../common/widget/card/image_card_small.dart';
import '../../../core/constants/enums/shared_preference_key.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension_custom.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/health_view_model.dart';
import '../widget/start_exercise_button.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: context.paddingNormal,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                Text("Hello", style: context.textTheme.headlineMedium),
                context.lowWidthSizedBoxSpace,
                Text("Burak",
                    style: context.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(",", style: context.textTheme.headlineMedium),
              ],
            ),
            context.mediumHeightSizedBoxSpace,
            Text(
              "Ready for a workout?",
              style: context.textTheme.titleLarge,
            ),
            context.lowHeightSizedBoxSpace,
            StartExerciseButton(
              title: "Neck Strengthening",
              onClick: () {
                BottomSheetService.showStaticBottomSheet(
                    context,
                    ExerciseSelectionBottomSheet(),
                    context.bottomSheetMediumHeight);
              },
            ),
            context.mediumHeightSizedBoxSpace,
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
                title: "Setup your desk with ergonomics!",
                buttonTitle: "Try it now!",
                media: Lottie.asset(Assets.lottie.computerSetup, repeat: false),
                onClicked: () {}),
            context.mediumHeightSizedBoxSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reminders", style: context.textTheme.headlineSmall),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            context.lowHeightSizedBoxSpace,
            ReminderWidget(
              lottieSrc: Assets.lottie.eyeIcon,
              title: "Rest Your Eyes",
              description: "20-20-20 rule will be best fit for you!",
              intervalText: "Every 20 min",
              isSwitch: true,
              onSwitch: (p0) {},
              onCardClicked: () {},
            ),
            context.lowHeightSizedBoxSpace,
            ReminderWidget(
              lottieSrc: Assets.lottie.eyeIcon,
              title: "Rest Your Eyes",
              description: "20-20-20 rule will be best fit for you!",
              intervalText: "Every 20 min",
              isSwitch: false,
              onSwitch: (p0) {},
              onCardClicked: () {},
            ),
            context.mediumHeightSizedBoxSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Healthy Tips", style: context.textTheme.headlineSmall),
                Text(
                  LocaleKeys.health_show_all.locale,
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
            context.lowHeightSizedBoxSpace,
            SizedBox(
              height: context.dynamicWidth(0.5),
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
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
          ],
        ),
      )),
    );
  }
}
