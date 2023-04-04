import 'package:deskmate/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_sheet/static_bottom_sheet.dart';

class ErrorBottomSheetService {
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
}
