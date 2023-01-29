import 'package:deskmate/common/network/backend_endpoint.dart';
import 'package:deskmate/core/init/network/network_manager.dart';
import 'package:deskmate/view/auth/login/model/login_model.dart';
import 'package:deskmate/view/auth/login/model/login_response_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';

class LoginService {
  final NetworkManager? networkManager;

  LoginService(this.networkManager);

  Future<LoginResponseModel?> loginUser(LoginModel loginModel) async {
    final response = await networkManager?.coreDio!
        .send<LoginResponseModel, LoginResponseModel>(BackendEndpoint.login,
            type: HttpTypes.POST,
            data: loginModel,
            parseModel: LoginResponseModel());
    return response?.data;
  }
}
