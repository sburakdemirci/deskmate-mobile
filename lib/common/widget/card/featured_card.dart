import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../asset/colors.gen.dart';
import '../text/rounded_text_container.dart';

class FeaturedCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final Color backgroundColor;
  final Color gradientColor;
  final String imageUrl;
  final VoidCallback onClicked;

  const FeaturedCard({
    Key? key,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.onClicked,
    required this.imageUrl,
    this.backgroundColor = ColorName.orangeLight,
    this.gradientColor = ColorName.orangeGradient,
  }) : super(key: key);

// if you want a custom size, wrap it with row and sizedBox

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onClicked(),
        child: Container(
          height: context.dynamicWidth(0.45),
          decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              gradient: LinearGradient(
                colors: [gradientColor, backgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Image.asset(
                      imageUrl,
                      height: context.dynamicWidth(0.35),
                    ),
                  )),
              // Padding(
              //   padding: context.paddingLow,
              //   child: Align(
              //       alignment: Alignment.topRight,
              //       child: Icon(
              //         Icons.favorite,
              //         size: 30,
              //         color: Colors.red,
              //       )),
              // ),
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardTitle,
                      style: context.textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    RoundedTextContainer(cardSubtitle: cardSubtitle),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
