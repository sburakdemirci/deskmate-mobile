import '../../asset/colors.gen.dart';
import '../../../core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class GenericColorCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;
  final Color backgroundColor;
  final Color gradientColor;
  final String imageUrl;
  final VoidCallback onClicked;

  const GenericColorCard({
    Key? key,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.onClicked,
    required this.imageUrl,
    this.backgroundColor = ColorName.orange,
    this.gradientColor = ColorName.orangeGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onClicked(),
        child: Container(
          height: context.dynamicHeight(0.2),
          decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              gradient: LinearGradient(
                colors: [gradientColor, backgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Image.asset(
                      imageUrl,
                      height: context.dynamicWidth(0.35),
                    ),
                  )),
              // Padding(
              //   padding: context.paddingLow,
              //   child: Align(
              //       alignment: Alignment.topRight,
              //       child: Icon(
              //         Icons.favorite,
              //         size: 30,
              //         color: Colors.red,
              //       )),
              // ),
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardTitle,
                      style: context.textTheme.headline5,
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: context.lowBorderRadius,
                            color: Colors.white),
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          cardSubtitle,
                          style: context.textTheme.titleLarge
                              ?.copyWith(color: ColorName.orange),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
