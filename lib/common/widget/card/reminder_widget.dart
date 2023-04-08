import 'package:deskmate/common/widget/text/rounded_text_container.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../asset/assets.gen.dart';
import '../../asset/colors.gen.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({
    super.key,
    required this.lottieSrc,
    required this.title,
    required this.description,
    required this.intervalText,
    required this.isSwitch,
    required this.onSwitch,
    required this.onCardClicked,
  });

  final String lottieSrc;
  final String title;
  final String description;
  final String intervalText;
  final bool isSwitch;
  final Function(bool) onSwitch;
  final VoidCallback onCardClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSwitch ? ColorName.orangeLight : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: context.normalBorderRadius,
          side: const BorderSide(width: 0.15)),
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Lottie.asset(Assets.lottie.eyeIcon,
                    fit: BoxFit.contain, repeat: false)),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: context.textTheme.titleSmall,
                    ),
                    RoundedTextContainer(title: intervalText)
                  ],
                )),
            Expanded(
                flex: 2,
                child: Transform.scale(
                  scale: 1.2,
                  child: Switch(
                      activeColor: Colors.white,
                      activeTrackColor: ColorName.orangeNormal,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black,
                      value: isSwitch,
                      onChanged: (bool newBool) => onSwitch(newBool)),
                ))
          ],
        ),
      ),
    );
  }
}
