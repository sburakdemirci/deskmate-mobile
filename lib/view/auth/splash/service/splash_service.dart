import 'package:deskmate/core/constants/enums/http_request_enum.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:deskmate/view/auth/splash/model/app_version_model.dart';

class SplashService {
  final NetworkManager? networkManager;

  SplashService(this.networkManager);

  Future<AppVersionModel?> getAppVersion() async {
    final response = await networkManager?.coreDio!
        .send<AppVersionModel, AppVersionModel>("mobile/version",
            type: HttpTypes.GET, parseModel: AppVersionModel());
    return response?.data;
  }
  /**
   * Check if accessToken exists. if exists check refresh token exists. If refresh exists, refresh the token
   * If accessToken and refresh token does not exists, redirect user to login page
   * 
   */

  //TODO control if token exists in shared prefs
}
