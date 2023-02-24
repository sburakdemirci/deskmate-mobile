import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class SquareCardButton extends StatelessWidget {
  final String imageSrc;
  final String cardText;
  final VoidCallback onClicked;
  const SquareCardButton(
      {Key? key,
      required this.imageSrc,
      required this.cardText,
      required this.onClicked})
      : super(key: key);
// if you want a custom size, wrap it with row and sizedBox
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClicked(),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: context.normalBorderRadius,
            side: const BorderSide(width: 0.15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageSrc,
              height: context.dynamicWidth(0.15),
            ),
            Text(cardText)
          ],
        ),
      ),
    );
  }
}
