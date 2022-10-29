import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

abstract class GamesState extends Equatable {
  final List<GameEntity> games;

  const GamesState({
    required this.games,
  });
}

class InitialGamesState extends GamesState {
  const InitialGamesState({
    required List<GameEntity> games,
  }) : super(games: games);

  @override
  List<Object> get props => [];
}

class LoadingGamesState extends GamesState {
  const LoadingGamesState({
    required List<GameEntity> games,
  }) : super(games: games);

  @override
  List<Object> get props => [];
}

class SuccessGamesState extends GamesState {
  final bool loadLast;

  const SuccessGamesState({
    required List<GameEntity> games,
    required this.loadLast,
  }) : super(games: games);

  @override
  List<Object> get props => [];
}

class FailureGamesState extends GamesState {
  final String error;

  const FailureGamesState({
    required List<GameEntity> games,
    required this.error,
  }) : super(games: games);

  @override
  List<Object> get props => [error];
}
