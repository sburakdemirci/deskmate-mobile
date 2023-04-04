class HttpEmptyResponseException implements Exception {
  String cause;
  int statusCode;
  HttpEmptyResponseException(
    this.cause,
    this.statusCode,
  );
}
