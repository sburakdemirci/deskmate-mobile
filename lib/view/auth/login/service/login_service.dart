import 'package:deskmate/core/constants/app/app_constants.dart';
import 'package:deskmate/core/init/cache/locale_manager.dart';
import 'package:deskmate/view/auth/login/model/user_profile_response_model.dart';

import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/constants/enums/shared_preference_key.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';

class LoginService {
  final NetworkManager networkManager;
  final LocaleManager localeManager;

  LoginService(this.networkManager, this.localeManager);
//TODO burak if response is null, throw an exception and return user to the login page. But except the responses should be null.
//example signup request normally return 200 with null response

  Future<void> loginUser(LoginRequestModel loginModel) async {
    await networkManager.coreDio!
        .send<LoginResponseModel, LoginResponseModel>(BackendEndpoint.LOGIN,
            type: HttpTypes.POST,
            data: loginModel,
            headers: {HttpConstants.NON_TOKEN_HEADER: true},
            parseModel: LoginResponseModel())
        .then((value) async {
      await _saveAuthDataToLocale(value.data!);
    });
  }

  Future<void> getUserProfile() async {
    await networkManager.coreDio!
        .send<UserProfileResponseModel, UserProfileResponseModel>(
            BackendEndpoint.USER_PROFILE,
            type: HttpTypes.GET,
            pathVariables:
                localeManager.getStringValue(SharedPreferenceKey.USER_ID),
            parseModel: UserProfileResponseModel())
        .then((value) async {
      await _saveProfileDataToLocale(value.data!);
    });
  }

  Future<void> _saveAuthDataToLocale(
      LoginResponseModel loginResponseModel) async {
    await localeManager.setStringValue(
        SharedPreferenceKey.ACCESS_TOKEN, loginResponseModel.accessToken!);
    await localeManager.setStringValue(
        SharedPreferenceKey.REFRESH_TOKEN, loginResponseModel.refreshToken!);
    await localeManager.setStringValue(
        SharedPreferenceKey.USER_ID, loginResponseModel.userId!);
    await localeManager.setStringValue(
        SharedPreferenceKey.EMAIL, loginResponseModel.email!);
  }

  Future<void> _saveProfileDataToLocale(
      UserProfileResponseModel userProfileResponseModel) async {
    await localeManager.setStringValue(
        SharedPreferenceKey.USER_NAME, userProfileResponseModel.name!);

    if (userProfileResponseModel.avatarUrl != null) {
      await localeManager.setStringValue(
          SharedPreferenceKey.AVATAR_URL, userProfileResponseModel.avatarUrl!);
    }
  }
}
