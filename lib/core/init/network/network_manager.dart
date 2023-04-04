import 'package:deskmate/core/init/network/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'core_dio.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'http://localhost:8080/api/v1/',
      // headers: {
      //   'Authorization':
      //       "Bearer ${LocaleManager.instance.getStringValue(SharedPreferenceKey.ACCESS_TOKEN)}"
      // },
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    TokenInterceptor? tokenInterceptor = TokenInterceptor();

    coreDio?.interceptors.add(tokenInterceptor);

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  CoreDio? coreDio;
}
