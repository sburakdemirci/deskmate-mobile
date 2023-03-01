import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/network_manager.dart';
import '../service/reminder_service.dart';

part 'reminder_view_model.g.dart';

class ReminderViewModel = ReminderViewModelBase with _$ReminderViewModel;

abstract class ReminderViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  ReminderService? service;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    service = ReminderService(NetworkManager.instance);
  }
}
