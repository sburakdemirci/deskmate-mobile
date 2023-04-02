import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../navigation/app_router.gr.dart';

part 'animation_route_view_model.g.dart';

class AnimationRouteViewModel = AnimationRouteViewModelBase
    with _$AnimationRouteViewModel;

abstract class AnimationRouteViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    startAnimationOnView();
  }

  Future<void> startAnimationOnView() async {
    Future.delayed(viewModelContext.durationVerySlow)
        .then((value) => appRouter.replace(const LoginView()));
  }
}
