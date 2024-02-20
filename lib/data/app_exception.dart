class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Fatch Data Error");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "Unauthorize Access");
}

class UnauthorizedInputException extends AppException {
  UnauthorizedInputException([String? message])
      : super(message, "Unauthorize Input");
}
