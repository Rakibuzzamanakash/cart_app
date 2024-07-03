class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid url');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, '');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not found');
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message]) : super(message, 'Method not allowed');
}


class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class NetworkException extends AppException {
  NetworkException([String? message]) : super(message, '');
}
