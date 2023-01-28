import 'package:deskmate/common/feature_boilderplate/service/boilerplate_service.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'boilerplate_view_model.g.dart';

class BoilerplateViewModel = BoilerplateViewModelBase
    with _$BoilerplateViewModel;

abstract class BoilerplateViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  BoilerplateService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = BoilerplateService(NetworkManager.instance);
  }
}
