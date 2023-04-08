import 'package:deskmate/common/asset/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class ImageCardSmall extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final Color backgroundColor;
  final String imageUrl;
  final VoidCallback onClicked;

  const ImageCardSmall(
      {Key? key,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.backgroundColor,
      required this.imageUrl,
      required this.onClicked})
      : super(key: key);
// if you want a custom size, wrap it with row and sizedBox

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      child: GestureDetector(
        onTap: () => onClicked(),
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.yellow],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Assets.image.health.coffeeImage.path,
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "Coffee is all about timing!",
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
