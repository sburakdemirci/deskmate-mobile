import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../text/rounded_text_container.dart';

class ImageCardFull extends StatelessWidget {
  final String cardTitle;
  final String descriptionTitle;
  final String descriptionSubtitle;
  final String imageUrl;

  const ImageCardFull({
    Key? key,
    required this.cardTitle,
    required this.imageUrl,
    required this.descriptionSubtitle,
    required this.descriptionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.dynamicWidth(0.45),
          decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover)),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedTextContainer(title: cardTitle),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: context.onlyLeftPaddingLow,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              descriptionTitle,
              style: context.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: context.onlyLeftPaddingLow,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              descriptionSubtitle,
              style: context.textTheme.titleMedium,
            ),
          ),
        )
      ],
    );
  }
}
