import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../base/model/empty_response_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_type_extension.dart';
import 'i_response_model.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio {
  CoreDio(this._options) {
    super.options = _options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  final BaseOptions _options;

  Future<ResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T>? parseModel,
    dynamic data,
    String? pathVariables,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    if (pathVariables != null) {
      path = "$path/$pathVariables";
    }
    final response = await request<dynamic>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: type.rawValue,
      ),
    );
    //todo burak maybe add .catchError to handle all 2XX

    if (parseModel != null &&
        response.data != null &&
        (response.statusCode == HttpStatus.ok ||
            response.statusCode == HttpStatus.noContent)) {
      final model = _responseParser<R, T>(parseModel, response.data);
      return ResponseModel<R>(data: model, statusCode: response.statusCode);
    } else {
      return ResponseModel<R>(data: null, statusCode: response.statusCode);
    }
  }
}
