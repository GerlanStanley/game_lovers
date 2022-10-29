import 'package:equatable/equatable.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class GetAllGamesEvent extends GamesEvent {
  final int platformId;

  const GetAllGamesEvent({
    required this.platformId,
  });

  @override
  List<Object> get props => [platformId];
}
