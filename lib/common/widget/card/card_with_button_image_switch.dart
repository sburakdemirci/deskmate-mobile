import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class CardWithButtonImageSwitch extends StatelessWidget {
  final String imageSrc;
  final String cardTitle;
  final String cardSubtitle;
  final bool isSwitch;
  final Function(bool) onSwitch;
  final VoidCallback onCardClicked;

  const CardWithButtonImageSwitch(
      {Key? key,
      required this.imageSrc,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.isSwitch,
      required this.onSwitch,
      required this.onCardClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClicked,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        child: ListTile(
            contentPadding: context.paddingLow,
            leading: Image.asset(imageSrc),
            title: Text(cardTitle, style: context.textTheme.titleLarge),
            subtitle: Text(
              cardSubtitle,
              style: context.textTheme.labelLarge,
            ),
            trailing: Transform.scale(
              scale: 1.2,
              child: Switch(
                  value: true, onChanged: (bool newBool) => onSwitch(newBool)),
            )),
      ),
    );
  }
}
