import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../common/navigation/app_router.gr.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../service/profile_service.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = ProfileViewModelBase with _$ProfileViewModel;

abstract class ProfileViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  ProfileService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = ProfileService(NetworkManager.instance);
  }

  void logout() {
    localeManager
        .clearAll()
        .then((value) => appRouter.replace(const LoginView()));
    appRouter.replace(const LoginView());
  }
}
