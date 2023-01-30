import '../../../core/init/network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../service/health_service.dart';

part 'health_view_model.g.dart';

class HealthViewModel = HealthViewModelBase with _$HealthViewModel;

abstract class HealthViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  HealthService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = HealthService(NetworkManager.instance);
  }
}
