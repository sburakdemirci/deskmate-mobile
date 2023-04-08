import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../common/asset/assets.gen.dart';
import '../../../common/asset/colors.gen.dart';
import '../../../common/widget/container/rounded_wrapper_container.dart';

class StartExerciseButton extends StatelessWidget {
  const StartExerciseButton(
      {super.key, required this.title, required this.onClick});
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: ColorName.orangeDark,
        shape: RoundedRectangleBorder(
            borderRadius: context.lowBorderRadius,
            side: const BorderSide(width: 0.15)),
        child: ListTile(
          contentPadding: context.paddingLow,
          leading: Padding(
            padding: context.paddingLow,
            child: Image.asset(
              Assets.image.health.exerciseNowImage.path,
            ),
          ),
          title: Text("Today's Workout",
              style:
                  context.textTheme.titleMedium?.copyWith(color: Colors.white)),
          subtitle: Text(
            title,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          trailing: RoundedWrapperContainer(
              child:
                  Lottie.asset(Assets.lottie.forwardArrow, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
