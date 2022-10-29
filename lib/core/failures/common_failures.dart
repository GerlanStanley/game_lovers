import 'failures.dart';

class ParseFailure extends Failure {
  ParseFailure({
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
