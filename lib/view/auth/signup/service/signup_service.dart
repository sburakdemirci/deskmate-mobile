import 'package:deskmate/common/network/backend_endpoint.dart';
import 'package:deskmate/core/init/network/network_manager.dart';

import 'package:deskmate/view/auth/signup/model/signup_request_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';

class SignupService {
  final NetworkManager? networkManager;

  SignupService(this.networkManager);

  Future<Object?> signupUser(SignupRequestModel model) async {
    final response = await networkManager?.coreDio!.send<Object, Object>(
        BackendEndpoint.SIGNUP,
        type: HttpTypes.POST,
        data: model,
        parseModel: null);
    return response?.data;
  }
}
