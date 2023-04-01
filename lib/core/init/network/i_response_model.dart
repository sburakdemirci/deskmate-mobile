class ResponseModel<T> {
  ResponseModel({this.data, this.statusCode});

  final T? data;

  final int? statusCode;
}
