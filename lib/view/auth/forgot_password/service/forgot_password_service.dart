import '../../../../core/init/network/network_manager.dart';
import '../model/forgot_password_request_model.dart';

import '../../../../common/network/backend_endpoint.dart';
import '../../../../core/constants/enums/http_request_enum.dart';

class ForgotPasswordService {
  final NetworkManager? networkManager;

  ForgotPasswordService(this.networkManager);

  Future<Object?> onResetPasswordClicked(
      ForgotPasswordRequestModel model) async {
    final response = await networkManager?.coreDio!.send<Object, Object>(
        BackendEndpoint.FORGOT_PASSWORD,
        type: HttpTypes.POST,
        data: model,
        parseModel: null);
    return response?.data;
  }
}
