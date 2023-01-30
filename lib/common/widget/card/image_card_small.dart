import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../asset/colors.gen.dart';

class ImageCardSmall extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final Color backgroundColor;
  final String imageUrl;
  final VoidCallback onClicked;

  const ImageCardSmall(
      {Key? key,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.backgroundColor,
      required this.imageUrl,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onClicked(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover)),
          child: SizedBox(
            width: context.dynamicWidth(0.35),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: context.lowBorderRadius,
                              color: Colors.white),
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            cardSubtitle,
                            style: context.textTheme.titleMedium
                                ?.copyWith(color: ColorName.orange),
                          )),
                      // FractionallySizedBox(
                      //   widthFactor: 0.7,
                      //   child: Text(
                      //     cardSubtitle,
                      //     style: TextStyle(fontSize: 16),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )

        // Container(
        //   height: 200,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       gradient: LinearGradient(
        //         colors: [Colors.yellow, backgroundColor],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.bottomRight,
        //       )),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Text(cardTitle,
        //                 style: TextStyle(
        //                     fontSize: 30, fontWeight: FontWeight.w500)),
        //             Text(cardSubtitle)
        //           ],
        //         ),
        //       ),
        //       Image.asset(
        //         imageUrl,
        //         height: MediaQuery.of(context).size.height * 0.18,
        //       ),
        //       Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        //             child: Icon(
        //               Icons.favorite,
        //               color: Colors.red,
        //             ),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),

        );
  }
}
