import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/use_cases.dart';

import 'games.dart';

class PlatformsBloc extends Bloc<PlatformsEvent, PlatformsState> {
  final IGetAllPlatformsUseCase getAllPlatforms;

  PlatformsBloc({
    required this.getAllPlatforms,
  }) : super(InitialPlatformsState()) {
    on<GetAllPlatformsEvent>(_onGetAll);
  }

  Future<void> _onGetAll(
    GetAllPlatformsEvent event,
    Emitter<PlatformsState> emit,
  ) async {
    if (state is! LoadingPlatformsState &&
        state is! LoadingMorePlatformsState &&
        (state is SuccessPlatformsState &&
            !(state as SuccessPlatformsState).loadLast)) {
      //

    }
  }
}
