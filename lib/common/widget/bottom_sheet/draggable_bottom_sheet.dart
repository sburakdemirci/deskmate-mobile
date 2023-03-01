import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class DraggableSheet extends StatelessWidget {
  final double initialSize;
  final double maxSize;
  final Widget child;
  const DraggableSheet({
    Key? key,
    required this.initialSize,
    required this.maxSize,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.router.pop(),
      child: DraggableScrollableSheet(
        minChildSize: 0.15,
        initialChildSize: initialSize,
        maxChildSize: maxSize,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            color: context.colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildLine(context),
              context.mediumHeightSizedBoxSpace,
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    child,
                  ],
                ),
              ),
            ],
          ),
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
          width: MediaQuery.of(context).size.width * 0.20,
        ),
      ),
    );
  }
}
