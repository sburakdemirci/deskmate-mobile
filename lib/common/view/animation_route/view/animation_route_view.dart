import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension_custom.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../asset/assets.gen.dart';
import '../viewmodel/animation_route_view_model.dart';

@RoutePage()
class AnimationRouteView extends StatelessWidget {
  const AnimationRouteView({Key? key}) : super(key: key);

//burak todo get the message and lottie file location from router. So you can reuse this page
  @override
  Widget build(BuildContext context) {
    return BaseView<AnimationRouteViewModel>(
      viewModel: AnimationRouteViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(
      BuildContext context, AnimationRouteViewModel viewModel) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Padding(
        padding: context.paddingMedium,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.dynamicWidth(0.4),
                width: context.dynamicWidth(0.4),
                child: Lottie.asset(Assets.lottie.successAnimation,
                    repeat: false,
                    frameRate: FrameRate(30),
                    fit: BoxFit.contain),
              ),
              context.highHeightSizedBoxSpace,
              Text(LocaleKeys.auth_signup_account_successfully_created.locale,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}
