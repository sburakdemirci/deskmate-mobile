import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../asset/colors.gen.dart';

class RoundedTextContainer extends StatelessWidget {
  const RoundedTextContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: context.lowBorderRadius,
          side: const BorderSide(width: 0.15)),
      child: Padding(
        padding: context.paddingLow,
        child: Text(
          title,
          style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold, color: ColorName.orangeNormal),
        ),
      ),
    );
  }
}
