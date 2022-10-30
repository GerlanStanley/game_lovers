import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/failures/failures.dart';

import '../../infra/drivers/drivers.dart';

class InternetDriverImpl implements IInternetDriver {
  final InternetConnectionChecker _internetConnectionChecker;

  InternetDriverImpl(this._internetConnectionChecker);

  @override
  Future<bool> isConnected() async {
    try {
      return await _internetConnectionChecker.hasConnection;
    } catch (e, stackTrace) {
      throw UnknownFailure(
        message: "Erro ao mapear objeto",
        stackTrace: stackTrace,
      );
    }
  }
}
