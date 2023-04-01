import '../../../core/init/network/network_manager.dart';

class ProfileService {
  final NetworkManager? networkManager;

  ProfileService(this.networkManager);


  //   Future<AppVersionModel?> getAppVersion() async {
  //   final response = await networkManager?.coreDio!
  //       .send<AppVersionModel, AppVersionModel>("mobile/version",
  //           type: HttpTypes.GET, parseModel: AppVersionModel());
  //   return response?.data;
  // }
}
