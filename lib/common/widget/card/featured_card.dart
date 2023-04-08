import 'dart:ui';

import 'package:deskmate/common/asset/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/extension/context_extension.dart';
import '../../asset/colors.gen.dart';
import '../text/rounded_text_container.dart';

class FeaturedCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Widget media;
  final VoidCallback onClicked;
  final String buttonTitle;

  const FeaturedCard({
    Key? key,
    required this.title,
    required this.media,
    required this.onClicked,
    this.backgroundColor = ColorName.orangeNormal,
    required this.buttonTitle,
  }) : super(key: key);

// if you want a custom size, wrap it with row and sizedBox

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onClicked(),
        child: Container(
          height: context.dynamicWidth(0.45),
          decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius, color: backgroundColor),
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      RoundedTextContainer(title: buttonTitle)
                    ],
                  )),
              const Spacer(
                flex: 1,
              ),
              Flexible(flex: 10, child: media),
            ],
          ),
        ));
  }
}
