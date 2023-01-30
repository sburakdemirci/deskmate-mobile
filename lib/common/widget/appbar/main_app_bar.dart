import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
      title: Align(
    alignment: Alignment.topLeft,
    child: Text(title),
  )

      //  Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(context.watch<AppState>().appTitle),
      //   ],
      // ),
      );
}
