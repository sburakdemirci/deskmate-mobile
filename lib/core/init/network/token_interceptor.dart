import 'package:deskmate/core/constants/app/app_constants.dart';
import 'package:deskmate/core/init/network/token_service.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenInterceptor extends Interceptor {
  final TokenService _tokenService = TokenService();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey(HttpConstants.NON_TOKEN_HEADER)) {
      String? accessToken = _tokenService.getAccessTokenFromLocale();

      if (accessToken == null || JwtDecoder.isExpired(accessToken)) {
        accessToken = await _tokenService.getAccessToken();
      }

      options.headers.addAll({
        HttpConstants.AUTHORIZATION_HEADER:
            "${HttpConstants.BEARER_PREFIX} ${accessToken!}"
      });
    }

    super.onRequest(options, handler);
  }
}
