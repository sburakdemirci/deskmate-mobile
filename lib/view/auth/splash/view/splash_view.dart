import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/asset/assets.gen.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension_custom.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: Lottie.asset(Assets.lottie.splashAnimation,
                repeat: false, frameRate: FrameRate(30)),
          ),
          const CircularProgressIndicator.adaptive(),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 20,
            child: Text(
              LocaleKeys.splash_welcome.locale,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                "${LocaleKeys.splash_version.locale} 1.0.0",
                style: context.textTheme.labelLarge,
              ),
            ),
          )
        ],
      )),
    );
  }

  // Center buildCenterTextWelcome(
  //   BuildContext context,
  //   SplashViewModel viewModel,
  // ) {
  //   return Center(
  //     child: Observer(
  //       builder: (_) {
  //         return AnimatedOpacity(
  //           duration: context.durationLow,
  //           opacity: viewModel.isFirstInit ? 0 : 1,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 LocaleKeys.splash_welcome.locale,
  //                 style: context.textTheme.headline4?.copyWith(
  //                   fontWeight: FontWeight.w700,
  //                   color: context.colorScheme.primaryContainer,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //               const CircularProgressIndicator.adaptive()
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget buildAnimatedAlignIcon(
  //   SplashViewModel viewModel,
  //   BuildContext context,
  // ) {
  //   return Observer(
  //     builder: (_) {
  //       return AnimatedAlign(
  //         alignment:
  //             viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
  //         duration: context.durationLow,
  //         child: Image.asset(ImageConstants.instance.projeIcon),
  //       );
  //     },
  //   );
  // }
}
