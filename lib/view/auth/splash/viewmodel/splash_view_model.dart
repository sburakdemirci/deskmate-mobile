import 'package:deskmate/common/navigation/app_router.dart';
import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../service/splash_service.dart';
import 'device_and_cache.dart';
import 'package:auto_route/auto_route.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  SplashService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _networkInit();
      controlAppState();
    });
  }

  Future<void> controlAppState() async {
    // MARK: CONCURENCY sample
    // final data = await compute(_UserVersionCreate.createNumber, 1);
    // print(data);

    final response = await service
        ?.getAppVersion()
        .then(
            (value) => Future.delayed(const Duration(seconds: 2)).then((value) {
                  viewModelContext.router.replace(const LoginRoute());
                }))
        .catchError((error) => print(error));

    // if (isNeedForceUpdate) {
    //   showAboutDialog(
    //       context: viewModelContext, children: [const Text('Neeed to Update')]);
    // } else {
    //   await navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
    // }
  }

  void _networkInit() {
    if (NetworkManager.instance != null) {
      service = SplashService(NetworkManager.instance);
    }
  }

  // Future<bool> _checkAppVersion() async {
  //   final response = await service?.checkDeviceVersion(
  //     version: ''.version,
  //     platform: '${PlatformProject.IOS.versionNumber}',
  //   );

  //   if (response is ForceUpdateModel) {
  //     return response.isForceUpdate ?? false;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> startAnimationOnView() async {
    await Future.delayed(viewModelContext.durationLow);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}

// class _UserVersionCreate {
//   static String createNumber(int number) {
//     final model = ForceUpdateModel(currentVersion: '1.0.3');
//     final data = jsonEncode(model);
//     final lastData = jsonDecode(data);
//     if (lastData is Map<String, dynamic>) {
//       return ForceUpdateModel().fromJson(lastData).currentVersion ?? '';
//     }
//     // throw
//     return '';
//   }
// }
