class HttpErrorException implements Exception {
  String cause;
  int statusCode;
  HttpErrorException(this.cause, this.statusCode);
}
