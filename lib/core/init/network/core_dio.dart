import 'dart:io';

import 'package:deskmate/core/exception/http_empty_response_exception.dart';
import 'package:deskmate/core/exception/http_error_exception.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../base/model/base_model.dart';
import '../../base/model/empty_http_response_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_type_extension.dart';
import 'i_response_model.dart';

part 'core_dio_extension.dart';

class CoreDio with DioMixin implements Dio {
  CoreDio(this._options) {
    super.options = _options;
    httpClientAdapter = IOHttpClientAdapter();
  }

  final BaseOptions _options;

  Future<ResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    String? pathVariables,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
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
          contentType: Headers.jsonContentType,
          method: type.rawValue,
          headers: headers),
    );
    //TODO burak maybe add .catchError to handle all 2XX

    //    if (response.data != null &&
    //     (response.statusCode == HttpStatus.ok ||
    //         response.statusCode == HttpStatus.noContent)) {
    //   final model = _responseParser<R, T>(parseModel, response.data);
    //   return ResponseModel<R>(data: model, statusCode: response.statusCode);
    // } else {

    //   return ResponseModel<R>(data: null, statusCode: response.statusCode);
    // }

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.noContent) {
      if (parseModel is EmptyHttpResponseModel) {
        return ResponseModel<R>(data: null, statusCode: response.statusCode);
      } else if (response.data != null) {
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model, statusCode: response.statusCode);
      } else {
        throw HttpEmptyResponseException(
            response.statusMessage!, response.statusCode!);
      }
    } else {
      throw HttpErrorException(response.statusMessage!, response.statusCode!);
      //open dialog
    }
  }
}
