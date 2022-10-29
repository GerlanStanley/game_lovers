import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/external/data_sources/data_sources.dart';
import 'package:game_lovers/core/failures/failures.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/core/helpers/http/http.dart';

import 'game_data_source_test.mocks.dart';

@GenerateMocks([IHttpHelper])
void main() {
  late MockIHttpHelper httpHelper;
  late IGameDataSource dataSource;
  late GetAllGamesInputDto input;

  setUp(() {
    httpHelper = MockIHttpHelper();
    dataSource = GameDataSourceImpl(httpHelper);
    input = GetAllGamesInputDto(platformId: 1, limit: 20, offset: 0);
  });

  test("Deve retornar uma List<GameEntity>", () async {
    when(httpHelper.post(any, data: anyNamed("data")))
        .thenAnswer((_) async => successJson);

    var result = await dataSource.getAll(input: input);

    expect(result, isA<List<GameEntity>>());
  });

  test("Conferindo se está passando os params no data", () async {
    when(httpHelper.post(any, data: data)).thenAnswer((_) async => successJson);

    var result = await dataSource.getAll(input: input);

    expect(result, isA<List<GameEntity>>());
  });

  test("Deve lançar uma HttpFailure quando status diferente de 200", () async {
    when(httpHelper.post(any, data: anyNamed("data"))).thenThrow(
      BadRequestHttpFailure(message: ""),
    );

    var result = dataSource.getAll(input: input);

    expect(result, throwsA(isA<HttpFailure>()));
  });

  test("Deve retornar um ParseJsonFailure quando não vier um json", () async {
    when(httpHelper.post(any, data: anyNamed("data"))).thenThrow(Exception());

    var result = dataSource.getAll(input: input);

    expect(result, throwsA(isA<ParseJsonFailure>()));
  });

  test(
    "Deve retornar um ParseJsonFailure quando não conseguir parsear a resposta",
    () async {
      when(httpHelper.post(any, data: anyNamed("data")))
          .thenAnswer((_) async => invalidJson);

      var result = dataSource.getAll(input: input);

      expect(result, throwsA(isA<ParseJsonFailure>()));
    },
  );
}

const String data = "fields name,platforms.name,genres.name,summary,cover.url,"
    "cover.image_id,total_rating; "
    "where platforms = 1; "
    "sort total_rating desc; "
    "limit 20; "
    "offset 0;";

final successJson = jsonDecode(r'''
[
     {
        "id": 222747,
        "cover": {
            "id": 264931,
            "image_id": "co5of7",
            "url": "//images.igdb.com/igdb/image/upload/t_thumb/co5of7.jpg"
        },
        "genres": [
            {
                "id": 8,
                "name": "Platform"
            }
        ],
        "name": "Super Mario Star Road: The Green Comet",
        "platforms": [
            {
                "id": 4,
                "name": "Nintendo 64"
            }
        ],
        "summary": "Super Mario Star Road: The Green Comet is a hack released in January 2021, and is based on Super Mario Star Road, another hack of Super Mario 64. It follows Super Mario Galaxy 2's concept of Green Stars, which are placed in tricky locations in already existing levels.\n\nThe hack contains 150 Stars, of which 15 can only be accessed after the other 135 have been collected. They replace Star Road's golden stars, are placed in different locations, and are often harder to reach. Enemies and bosses have been removed from levels, and there many more NPCs than the base game. These NPCs give tips to the player or contribute to the game's lore.\n\nAll of the game's levels can be accessed right from the start, as doors no longer require Stars or keys.\n\nWhen 135 Stars have been collected, green coins will appear in every main course, allowing access to the final 15 stars and the true ending of the game.\n\nThe game has no life counter, since the player has infinite lives. 1-UP mushrooms are replaced by Comet Medals, which are not required and do nothing but offer an optional challenge to the players who wish to test their skills in platforming, knowledge of the game or observation."
    }
]
''');

final invalidJson = jsonDecode(r'''
[
    {
        "id": 37
    }
]
''');

final errorJson = jsonDecode(r'''
{
    "message": "Authorization Failure. Have you tried:",
    "Tip 1": "Ensure you are sending Authorization and Client-ID as headers.",
    "Tip 2": "Ensure Authorization value starts with 'Bearer ', including the space",
    "Tip 3": "Ensure Authorization value ends with the App Access Token you generated, NOT your Client Secret.",
    "Docs": "https://api-docs.igdb.com/#authentication",
    "Discord": "https://discord.gg/FrvfwQg"
}
''');
