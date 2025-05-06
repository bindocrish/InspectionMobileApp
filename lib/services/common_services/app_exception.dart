class AppException implements Exception {
  final String? url;
  final String? statusCode;
  final dynamic response;
  final String? message;
  final String? errorCode;

  AppException(
      [this.url, this.response, this.statusCode, this.message, this.errorCode]);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(
      [super.url,
        super.response,
        super.statusCode,
        super.message,
        super.customErrorCode]);
}

class BadRequestException extends AppException {
  BadRequestException(
      [String? url, dynamic response, String? statusCode, String? message])
      : super(url, response, statusCode, message, message);
}

class NotFoundException extends AppException {
  NotFoundException(
      [String? url, dynamic response, String? statusCode, String? message])
      : super(url, response, statusCode, message, message);
}

class NetworkErrorException extends AppException {
  NetworkErrorException(
      [super.url, super.response, super.statusCode, super.message]);
}

class FetchDataException extends AppException {
  FetchDataException(
      [super.url,
        super.response,
        super.statusCode,
        super.message,
        super.customErrorCode]);
}

class ActionFailedException extends AppException {
  ActionFailedException(
      [super.url,
        super.response,
        super.statusCode,
        super.message,
        super.customErrorCode]);
}

class ApiNotRespondingOnTimeException extends AppException {
  ApiNotRespondingOnTimeException([
    super.url,
    String? super.message,
  ]);
}

class TooManyRequestsException extends AppException {
  TooManyRequestsException(
      [super.url, super.response, super.statusCode, super.message]);
}

class SSLPinningErrorException extends AppException {
  SSLPinningErrorException(
      [super.url, super.response, super.statusCode, super.message]);
}
