import 'package:deskmate/core/extension/context_extension.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../service/splash_service.dart';
import 'device_and_cache.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
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

    // Dummy for moduler page
    Future.delayed(const Duration(seconds: 1)).then((value) {
      // navigation.navigateToPage(path: NavigationConstants.BUY_VIEW);
    });
  }

  Future<void> controlAppState() async {
    // MARK: CONCURENCY sample
    // final data = await compute(_UserVersionCreate.createNumber, 1);
    // print(data);

    final response = await service?.getAppVersion();

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
