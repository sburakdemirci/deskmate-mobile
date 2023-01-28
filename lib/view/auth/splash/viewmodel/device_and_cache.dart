import '../../../../core/init/cache/locale_manager.dart';

mixin DeviceAndCache {
  Future<void> deviceandCacheInit() async {
    await Future.wait([LocaleManager.prefrencesInit()]);
  }
}
