import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/app_version_model.dart';

class SplashService {
  final NetworkManager? networkManager;

  SplashService(this.networkManager);

  Future<AppVersionModel?> getAppVersion() async {
    final response =
        await networkManager?.coreDio!.send<AppVersionModel, AppVersionModel>(
      BackendEndpoint.APP_VERSION,
      type: HttpTypes.GET,
      headers: {HttpConstants.NON_TOKEN_HEADER: true},
      parseModel: AppVersionModel(),
    );
    return response?.data;
  }
  /**
   * Check if accessToken exists. if exists check refresh token exists. If refresh exists, refresh the token
   * If accessToken and refresh token does not exists, redirect user to login page
   * 
   */

  //TODO control if token exists in shared prefs
}
