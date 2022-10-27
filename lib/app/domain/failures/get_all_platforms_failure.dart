import '../../../core/failures/failures.dart';

class GetAllPlatformsDefaultFailure extends Failure {
  GetAllPlatformsDefaultFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
