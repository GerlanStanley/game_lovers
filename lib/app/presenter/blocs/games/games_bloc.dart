import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/dtos/dtos.dart';
import '../../../domain/use_cases/use_cases.dart';

import 'games.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final IGetAllGamesUseCase _getAllGames;

  GamesBloc(this._getAllGames) : super(const InitialGamesState(games: [])) {
    on<GetAllGamesEvent>(_onGetAll);
  }

  Future<void> _onGetAll(
    GetAllGamesEvent event,
    Emitter<GamesState> emit,
  ) async {
    if (state is! LoadingGamesState &&
        (state is! SuccessGamesState ||
            !((state as SuccessGamesState).loadLast))) {
      //
      emit(LoadingGamesState(games: state.games));

      var result = await _getAllGames(
        input: GetAllGamesInputDto(
          platformId: event.platformId,
          offset: state.games.length,
          limit: 30,
        ),
      );

      result.fold((left) {
        emit(FailureGamesState(
          games: state.games,
          error: left.message,
        ));
      }, (right) async {
        emit(SuccessGamesState(
          games: state.games + right,
          loadLast: right.isEmpty,
        ));
      });
    }
  }
}
