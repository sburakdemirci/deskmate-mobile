import 'package:deskmate/common/widget/bottom_sheet/draggable_bottom_sheet.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_sheet/static_bottom_sheet.dart';

class BottomSheetService {
  static void showErrorSheet(BuildContext context, String message) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        context: context,
        builder: ((context) => StaticBottomSheet(
            height: context.dynamicHeight(0.15),
            child: Padding(
              padding: context.paddingLow,
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: context.mediumValue,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 17,
                    child: Text(
                      message,
                      textAlign: TextAlign.left,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ))));
  }

  static void showStaticBottomSheet(
      BuildContext context, Widget child, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        context: context,
        builder: ((context) => StaticBottomSheet(
            height: context.dynamicHeight(height), child: child)));
  }

  static void showDraggableBottomSheet(
      BuildContext context, Widget child, double initialSize, double maxSize) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: ((context) => DraggableBottomSheet(
            initialSize: initialSize, maxSize: maxSize, child: child)));
  }
}
