import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';

class LoginService {
  final NetworkManager? networkManager;

  LoginService(this.networkManager);

  Future<LoginResponseModel?> loginUser(LoginRequestModel loginModel) async {
    final response = await networkManager?.coreDio!
        .send<LoginResponseModel, LoginResponseModel>(BackendEndpoint.LOGIN,
            type: HttpTypes.POST,
            data: loginModel,
            parseModel: LoginResponseModel());
    return response?.data;
  }
}
