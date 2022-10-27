import 'failures.dart';

class ParseJsonFailure extends Failure {
  ParseJsonFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class UnknownFailure extends Failure {
  UnknownFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
