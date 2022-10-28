import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/use_cases.dart';

import 'platforms.dart';

class PlatformsBloc extends Bloc<PlatformsEvent, PlatformsState> {
  final IGetAllPlatformsUseCase _getAllPlatforms;

  PlatformsBloc(this._getAllPlatforms) : super(InitialPlatformsState()) {
    on<GetAllPlatformsEvent>(_onGetAll);
  }

  Future<void> _onGetAll(
    GetAllPlatformsEvent event,
    Emitter<PlatformsState> emit,
  ) async {
    emit(LoadingPlatformsState());

    var result = await _getAllPlatforms();

    result.fold((left) {
      emit(FailurePlatformsState(error: left.message));
    }, (right) async {
      emit(SuccessPlatformsState(platforms: right));
    });
  }
}
