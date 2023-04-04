import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class StaticBottomSheet extends StatelessWidget {
  final double height;
  final Widget child;
  const StaticBottomSheet({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.router.pop(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.normalBorderRadius,
          color: context.colorScheme.background,
        ),
        height: height,
        child: Column(
          children: [
            _buildLine(context),
            context.lowHeightSizedBoxSpace,
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildLine(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: context.dynamicWidth(0.25),
        height: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: context.highBorderRadius,
            color: context.colorScheme.onPrimary,
          ),
          width: context.dynamicWidth(0.2),
        ),
      ),
    );
  }
}
