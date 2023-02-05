import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/network_manager.dart';
import '../service/work_service.dart';

part 'work_view_model.g.dart';

class WorkViewModel = WorkViewModelBase with _$WorkViewModel;

abstract class WorkViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  WorkService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = WorkService(NetworkManager.instance);
  }
}
