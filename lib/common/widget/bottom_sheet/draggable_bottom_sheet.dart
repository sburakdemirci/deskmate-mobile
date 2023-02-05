import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.router.pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            color: context.colorScheme.background,
          ),
          child: ListView(
            controller: scrollController,
            children: [
              _buildLine(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLine(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Center(
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
      ),
    );
  }
}
