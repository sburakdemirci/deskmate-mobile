import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/base/model/empty_response_model.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/i_response_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/signup_request_model.dart';

class SignupService {
  final NetworkManager? networkManager;

  SignupService(this.networkManager);

  Future<ResponseModel<EmptyResponseModel>?> signupUser(SignupRequestModel model) async {
    final response = await networkManager?.coreDio!
        .send<EmptyResponseModel, EmptyResponseModel>(BackendEndpoint.SIGNUP,
            type: HttpTypes.POST,
            data: model,
            parseModel: EmptyResponseModel());
    return response;
  }

 
}
