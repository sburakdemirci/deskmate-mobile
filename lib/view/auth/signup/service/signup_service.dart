import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/base/model/empty_http_response_model.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/i_response_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/signup_request_model.dart';

class SignupService {
  final NetworkManager? networkManager;

  SignupService(this.networkManager);

  Future<void> signupUser(SignupRequestModel model) async {
    await networkManager?.coreDio!
        .send<EmptyHttpResponseModel, EmptyHttpResponseModel>(
            BackendEndpoint.SIGNUP,
            type: HttpTypes.POST,
            headers: {HttpConstants.NON_TOKEN_HEADER: true},
            data: model,
            parseModel: EmptyHttpResponseModel());
  }
}
