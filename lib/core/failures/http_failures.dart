import 'failures.dart';

class HttpFailure extends Failure {
  HttpFailure({required String message, StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class BadRequestHttpFailure extends HttpFailure {
  BadRequestHttpFailure({required String message, StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class UnauthorizedHttpFailure extends HttpFailure {
  UnauthorizedHttpFailure({required String message, StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class NotFoundHttpFailure extends HttpFailure {
  NotFoundHttpFailure({required String message, StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}

class ServerHttpFailure extends HttpFailure {
  ServerHttpFailure({required String message, StackTrace? stackTrace})
      : super(
          message: message,
          stackTrace: stackTrace,
        );
}
