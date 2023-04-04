import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../common/asset/assets.gen.dart';
import '../../common/asset/colors.gen.dart';
import '../../common/navigation/app_router.dart';
import '../../common/navigation/app_router.gr.dart';
import '../../common/widget/button/default_elevated_button.dart';
import '../../core/extension/context_extension.dart';
import '../../core/extension/string_extension_custom.dart';
import '../../core/init/lang/locale_keys.g.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  final AppRouter _appRouter = AppRouter.instance!;

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: context.mediumValue),
              child: IntroductionScreen(
                showDoneButton: false,
                showSkipButton: true,

                dotsDecorator: getDotDecoration(),
                pages: [
                  _buildPageViewModel(
                    context,
                    'Best work health app',
                    'The man who never reads lives only one.',
                    Assets.lottie.manWorkingComputer,
                  ),
                  _buildPageViewModel(
                    context,
                    'Best work health app',
                    'The man who never reads lives only one.',
                    Assets.lottie.womanExercise,
                  ),
                  _buildPageViewModel(
                    context,
                    'Best work health app',
                    'The man who never reads lives only one.',
                    Assets.lottie.computerSetup,
                  ),
                  _buildLastPageViewModel(
                    context,
                    'Best work health app',
                    'The man who never reads lives only one.',
                    Assets.lottie.productivity,
                  ),
                ],

                skip: Text(
                  LocaleKeys.onboarding_skip.locale,
                  style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorName.orangeLight),
                ),
                onSkip: () => _appRouter.push(const DashboardView()),

                next: const Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: ColorName.orangeLight,
                ),

                globalBackgroundColor: Colors.white,
                // nextFlex: 0,
                // isProgressTap: false,
                // isProgress: false,
                // showNextButton: false,
                // freeze: true,
                // animationDuration: 1000,
              ),
            ),
          ),
        ),
      );

  PageViewModel _buildPageViewModel(
      BuildContext context, String title, String body, String animationPath) {
    return PageViewModel(
      title: title,
      body: body,
      image: Lottie.asset(animationPath, width: context.dynamicWidth(1)),
      decoration: getPageDecoration(context),
    );
  }

  PageViewModel _buildLastPageViewModel(
      BuildContext context, String title, String body, String animationPath) {
    return PageViewModel(
        title: title,
        body: body,
        image: Lottie.asset(animationPath, width: context.dynamicWidth(0.9)),
        decoration: getPageDecoration(context),
        footer: Padding(
          padding: context.horizontalPaddingHigh,
          child: DefaultElevatedButton(
              onPressed: () {
                _appRouter.push(const DashboardView());
              },
              title: "LET'S START!"),
        ));
  }

  DotsDecorator getDotDecoration() => const DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: ColorName.orangeLight,
        size: Size(10, 10),
        activeSize: Size(15, 15),
      );

  PageDecoration getPageDecoration(BuildContext context) => PageDecoration(
        titleTextStyle: context.textTheme.headlineMedium!,
        titlePadding: context.verticalPaddingMedium,
        bodyTextStyle: context.textTheme.titleLarge!,
        pageColor: Colors.white,
        //if you want to control size of the image make flex 0
        // bodyFlex: 0,
        imagePadding: EdgeInsets.zero,
      );
}
