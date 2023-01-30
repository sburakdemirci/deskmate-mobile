import '../../../core/init/network/network_manager.dart';

class HealthService {
  final NetworkManager? networkManager;

  HealthService(this.networkManager);

  //   Future<AppVersionModel?> getAppVersion() async {
  //   final response = await networkManager?.coreDio!
  //       .send<AppVersionModel, AppVersionModel>("mobile/version",
  //           type: HttpTypes.GET, parseModel: AppVersionModel());
  //   return response?.data;
  // }
}
