import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../asset/colors.gen.dart';

class RoundedTextContainer extends StatelessWidget {
  const RoundedTextContainer({
    Key? key,
    required this.cardSubtitle,
  }) : super(key: key);

  final String cardSubtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          color: Colors.white,
        ),
        padding: context.paddingLow,
        child: Text(
          cardSubtitle,
          style: context.textTheme.titleSmall
              ?.copyWith(color: ColorName.orangeLight, fontWeight: FontWeight.bold),
        ));
  }
}
