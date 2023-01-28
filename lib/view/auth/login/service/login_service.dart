import 'package:deskmate/core/init/network/network_manager.dart';

class LoginService {
  final NetworkManager? networkManager;

  LoginService(this.networkManager);

  //   Future<AppVersionModel?> getAppVersion() async {
  //   final response = await networkManager?.coreDio!
  //       .send<AppVersionModel, AppVersionModel>("mobile/version",
  //           type: HttpTypes.GET, parseModel: AppVersionModel());
  //   return response?.data;
  // }
}
