import '../../../core/failures/failures.dart';

class GetAllGamesPlatformFailure extends Failure {
  GetAllGamesPlatformFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class GetAllGamesLimitFailure extends Failure {
  GetAllGamesLimitFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class GetAllGamesOffsetFailure extends Failure {
  GetAllGamesOffsetFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
