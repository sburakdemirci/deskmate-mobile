import 'package:deskmate/common/widget/button/default_elevated_button.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../common/asset/assets.gen.dart';
import '../../../../common/widget/card/icon_square_card_button.dart';

class ExerciseSelectionBottomSheet extends StatelessWidget {
  const ExerciseSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          context.lowHeightSizedBoxSpace,
          Text(
            "Select Exercise Type",
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          context.mediumHeightSizedBoxSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareCardButton(
                imageSrc: Assets.icon.health.neckIcon.path,
                cardText: "Seated",
                onClicked: () {},
              ),
              context.mediumWidthtSizedBoxSpace,
              SquareCardButton(
                imageSrc: Assets.icon.health.wristIcon.path,
                cardText: "Standing",
                onClicked: () {},
              ),
            ],
          ),
          context.mediumHeightSizedBoxSpace,
          Padding(
            padding: context.horizontalPaddingHigh,
            child: DefaultElevatedButton(onPressed: () {}, title: "START"),
          )
        ],
      ),
    );
  }
}
