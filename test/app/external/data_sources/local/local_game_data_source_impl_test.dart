import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/external/data_sources/data_sources.dart';
import 'package:game_lovers/app/external/drift/database.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';

void main() {
  late LocalDatabase localDatabase;
  late ILocalGameDataSource dataSource;

  setUp(() {
    localDatabase = LocalDatabase(queryExecutor: NativeDatabase.memory());
    dataSource = LocalGameDataSourceImpl(localDatabase);
  });

  tearDown(() async {
    await localDatabase.close();
  });

  test("Deve retornar os mesmos ids dos jogos salvos", () async {
    var games = [
      GameEntity(
        id: 1,
        name: "Jogo 1",
        rating: 90,
        summary: "Summary",
        cover: CoverEntity(
          id: 1,
          imageId: "imageId 1",
          url: "url 1",
        ),
        genres: [
          GenreEntity(id: 10, name: "Genre 1"),
          GenreEntity(id: 20, name: "Genre 2")
        ],
        platforms: [
          PlatformEntity(id: 1, name: "Platform 1"),
          PlatformEntity(id: 40, name: "Platform 2")
        ],
      ),
      GameEntity(
        id: 2,
        name: "Jogo 2",
        rating: 90,
        summary: "Summary",
        cover: CoverEntity(
          id: 2,
          imageId: "imageId 2",
          url: "url 2",
        ),
        genres: [
          GenreEntity(id: 50, name: "Genre 3"),
          GenreEntity(id: 60, name: "Genre 4")
        ],
        platforms: [
          PlatformEntity(id: 1, name: "Platform 1"),
          PlatformEntity(id: 80, name: "Platform 3")
        ],
      ),
    ];

    await dataSource.saveAll(games: games);
    final getGames = await dataSource.getAll(
      input: const GetAllGamesInputDto(
        platformId: 1,
        offset: 0,
        limit: 100,
      ),
    );

    expect(getGames[0].id, games[0].id);
    expect(getGames[0].platforms[0].id, games[0].platforms[0].id);
    expect(getGames[0].platforms[1].id, games[0].platforms[1].id);

    expect(getGames[1].id, games[1].id);
    expect(getGames[1].platforms[0].id, games[1].platforms[0].id);
    expect(getGames[1].platforms[1].id, games[1].platforms[1].id);
  });
}
