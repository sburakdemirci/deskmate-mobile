import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';


class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText(
      {Key? key, required this.context, required this.text})
      : super(key: key);

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText(text,
              textStyle: context.textTheme.headlineMedium,
              speed: context.durationLow),
        ],
      ),
    );
  }
}
