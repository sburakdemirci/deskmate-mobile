import 'package:deskmate/core/init/network/core_dio.dart';
import 'package:flutter/material.dart';

import '../../init/cache/locale_manager.dart';

import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

//todo burak coreDio'yu yeniden yaz network manage olsun interface ve coredio ile implemente edilsin fln
  CoreDio? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  // NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
  void smpt() {}
}
