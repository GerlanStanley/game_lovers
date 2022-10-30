import 'package:drift/drift.dart';
import 'package:game_lovers/app/external/drift/database.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/utils/utils.dart';

import '../../../domain/dtos/dtos.dart';
import '../../../domain/entities/entities.dart';
import '../../../infra/data_sources/data_sources.dart';

import '../../mappers/mappers.dart';

class LocalGameDataSourceImpl implements ILocalGameDataSource {
  final LocalDatabase _database;

  LocalGameDataSourceImpl(this._database);

  @override
  Future<List<GameEntity>> getAll({
    required GetAllGamesInputDto input,
  }) async {
    List<GameEntity> games = [];

    try {
      var gamesResult = await _getGames(input);

      for (var gameResult in gamesResult) {
        var genresResult = await _getGenres(gameResult);
        var platformsResult = await _getPlatforms(gameResult);

        games.add(GameMapper.fromTypedResult(
          game: gameResult,
          genres: genresResult,
          platforms: platformsResult,
        ));
      }

      return games;
    } catch (e, stackTrace) {
      printDebug(e);
      printDebug(stackTrace);
      throw ParseFailure(
        message: "Erro ao mapear objeto",
        stackTrace: stackTrace,
      );
    }
  }

  Future<List<TypedResult>> _getGames(GetAllGamesInputDto input) async {
    final query = _database.select(_database.games).join([
      innerJoin(
        _database.gamePlatformEntries,
        _database.gamePlatformEntries.game.equalsExp(_database.games.id),
      ),
      leftOuterJoin(
        _database.covers,
        _database.covers.id.equalsExp(_database.games.cover),
      ),
    ]);
    query.where(
      _database.gamePlatformEntries.platform
          .equals(input.platformId.toString()),
    );
    query.orderBy([
      OrderingTerm.desc(_database.games.rating),
    ]);
    query.limit(input.limit, offset: input.offset);
    return await query.get();
  }

  Future<List<TypedResult>> _getGenres(TypedResult gameResult) async {
    final query = _database.select(_database.genres).join([
      innerJoin(
        _database.gameGenreEntries,
        _database.gameGenreEntries.game.equalsExp(_database.games.id),
      ),
      innerJoin(
        _database.games,
        _database.games.id.equalsExp(_database.gameGenreEntries.game),
      ),
    ]);

    query.where(
      _database.gameGenreEntries.game
          .equals(gameResult.rawData.data["games.id"]),
    );

    query.groupBy([_database.genres.id]);

    query.orderBy([
      OrderingTerm.asc(_database.genres.id),
    ]);

    return await query.get();
  }

  Future<List<TypedResult>> _getPlatforms(TypedResult gameResult) async {
    final query = _database.select(_database.platforms).join([
      innerJoin(
        _database.gamePlatformEntries,
        _database.gamePlatformEntries.game.equalsExp(_database.games.id),
      ),
      innerJoin(
        _database.games,
        _database.games.id.equalsExp(_database.gamePlatformEntries.game),
      ),
    ]);

    query.where(
      _database.gamePlatformEntries.game
          .equals(gameResult.rawData.data["games.id"]),
    );

    query.groupBy([_database.platforms.id]);

    query.orderBy([
      OrderingTerm.asc(_database.platforms.id),
    ]);

    return await query.get();
  }

  @override
  Future<bool> saveAll({required List<GameEntity> games}) async {
    try {
      var response = await _database.transaction(() async {
        for (var game in games) {
          /// Cover
          if (game.cover != null) {
            await _database
                .into(_database.covers)
                .insertOnConflictUpdate(CoversCompanion.insert(
                  id: game.cover!.id.toString(),
                  imageId: game.cover!.imageId,
                  url: game.cover!.url,
                ));
          }

          /// Game
          await _database
              .into(_database.games)
              .insertOnConflictUpdate(GamesCompanion.insert(
                id: game.id.toString(),
                name: game.name,
                summary: Value(game.summary),
                rating: game.rating,
                cover: Value(game.cover?.id.toString()),
              ));

          /// Genres
          await (_database.delete(_database.gameGenreEntries)
                ..where((entry) => entry.game.equals(game.id.toString())))
              .go();

          for (var genre in game.genres) {
            await _database
                .into(_database.genres)
                .insertOnConflictUpdate(GenresCompanion.insert(
                  id: genre.id.toString(),
                  name: genre.name,
                ));

            await _database
                .into(_database.gameGenreEntries)
                .insert(GameGenreEntriesCompanion.insert(
                  game: game.id.toString(),
                  genre: genre.id.toString(),
                ));
          }

          /// Platforms
          await (_database.delete(_database.gamePlatformEntries)
                ..where((entry) => entry.game.equals(game.id.toString())))
              .go();

          for (var platform in game.platforms) {
            await _database
                .into(_database.platforms)
                .insertOnConflictUpdate(PlatformsCompanion.insert(
                  id: platform.id.toString(),
                  name: platform.name,
                ));

            await _database
                .into(_database.gamePlatformEntries)
                .insert(GamePlatformEntriesCompanion.insert(
                  game: game.id.toString(),
                  platform: platform.id.toString(),
                ));
          }
        }
      });
      return response == 1;
    } catch (e, stackTrace) {
      printDebug(stackTrace);
      throw UnknownFailure(
        message: "Erro ao inserir dados local",
        stackTrace: stackTrace,
      );
    }
  }
}
