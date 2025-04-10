import 'package:deskmate/core/base/model/empty_http_response_model.dart';

import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/forgot_password_request_model.dart';

class ForgotPasswordService {
  final NetworkManager? networkManager;

  ForgotPasswordService(this.networkManager);

  Future<Object?> resetPassword(
      ForgotPasswordRequestModel model) async {
    final response = await networkManager?.coreDio!.send<Object, Object>(
        BackendEndpoint.FORGOT_PASSWORD,
        type: HttpTypes.POST,
        data: model,
        parseModel: EmptyHttpResponseModel());
    return response?.data;
  }
}
