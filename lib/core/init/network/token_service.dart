import 'package:deskmate/core/constants/app/app_constants.dart';
import 'package:deskmate/core/constants/enums/shared_preference_key.dart';
import 'package:deskmate/core/exception/token_exception.dart';
import 'package:deskmate/core/init/cache/locale_manager.dart';
import 'package:deskmate/core/init/network/network_manager.dart';

import '../../../common/network/backend_endpoint.dart';
import '../../../view/auth/login/model/login_response_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../security/model/refresh_token_request_model.dart';

class TokenService {
//TODO maybe put the access token to a class and store it. So You will not go to localemanager each time.
//see https://stackoverflow.com/a/73632432

//TODO check Dependency injection for Networkmanager, TokenInterceptor and this class
//TODO if backend return 401, maybe you can add refresh token logic. But with retryCount
  Future<String?> getAccessToken() async {
    String? refreshToken = _getRefreshTokenFromLocale();

    if (refreshToken != null) {
      String? accessToken = await _getNewAccessToken(refreshToken);

      if (accessToken != null) {
        _saveNewAccessTokenLocale(accessToken);
        return accessToken;
      } else {
        throw TokenException("Unable to refresh the token");
      }
    } else {
      throw TokenException("Refresh token is not present in the locale");
    }
  }

  Future<String?> _getNewAccessToken(String refreshToken) async {
    var response = await NetworkManager.instance?.coreDio
        ?.send<LoginResponseModel, LoginResponseModel>(
            BackendEndpoint.REFRESH_TOKEN,
            type: HttpTypes.POST,
            data: RefreshTokenRequestModel(refreshToken: refreshToken),
            headers: {HttpConstants.NON_TOKEN_HEADER: true},
            parseModel: LoginResponseModel());

    return response?.data?.accessToken;
  }

  String? getAccessTokenFromLocale() {
    return LocaleManager.instance
        .getStringValue(SharedPreferenceKey.ACCESS_TOKEN);
  }

  String? _getRefreshTokenFromLocale() {
    return LocaleManager.instance
        .getStringValue(SharedPreferenceKey.REFRESH_TOKEN);
  }

  void _saveNewAccessTokenLocale(String accessToken) async {
    await LocaleManager.instance
        .setStringValue(SharedPreferenceKey.REFRESH_TOKEN, accessToken);
  }
}
