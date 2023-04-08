import 'package:deskmate/common/asset/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/extension/context_extension.dart';
import '../../asset/assets.gen.dart';

class RoundedWrapperContainer extends StatelessWidget {
  const RoundedWrapperContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          color: Colors.white,
        ),
        width: context.dynamicWidth(0.20),
        height: context.dynamicWidth(0.1),
        child: child);
  }
}
