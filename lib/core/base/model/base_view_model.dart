import 'package:flutter/material.dart';

import '../../../common/navigation/app_router.dart';
import '../../init/cache/locale_manager.dart';
import '../../init/network/core_dio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

//todo burak coreDio'yu yeniden yaz network manage olsun interface ve coredio ile implemente edilsin fln
  CoreDio? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  AppRouter appRouter = AppRouter.instance!;
  // NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
  void smpt() {}
}
