import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/core/failures/failures.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/app/external/data_sources/data_sources.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/core/helpers/http/http.dart';

class MockHttpService extends Mock implements IHttpHelper {}

void main() {
  late IHttpHelper httpHelper;
  late IPlatformDataSource dataSource;

  setUp(() {
    httpHelper = MockHttpService();
    dataSource = PlatformDataSourceImpl(httpHelper);
  });

  test("Deve retornar uma List<PlatformEntity>", () async {
    when(() => httpHelper.get(any())).thenAnswer((_) async => successJson);

    var result = await dataSource.getAll();

    expect(result, isA<List<PlatformEntity>>());
  });

  test("Deve lançar uma HttpFailure quando status diferente de 200", () async {
    when(() => httpHelper.get(any())).thenThrow(
      BadRequestHttpFailure(message: ""),
    );

    var result = dataSource.getAll();

    expect(result, throwsA(isA<HttpFailure>()));
  });

  test("Deve retornar um ParseJsonFailure quando não vier um json", () async {
    when(() => httpHelper.get(any())).thenThrow(Exception());

    var result = dataSource.getAll();

    expect(result, throwsA(isA<ParseJsonFailure>()));
  });

  test(
    "Deve retornar um ParseJsonFailure quando não conseguir parsear a resposta",
    () async {
      when(() => httpHelper.get(any())).thenAnswer((_) async => invalidJson);

      var result = dataSource.getAll();

      expect(result, throwsA(isA<ParseJsonFailure>()));
    },
  );
}

final successJson = jsonDecode(r'''
[
    {
        "id": 37,
        "name": "Nintendo 3DS"
    },
    {
        "id": 4,
        "name": "Nintendo 64"
    },
    {
        "id": 416,
        "name": "Nintendo 64DD"
    },
    {
        "id": 20,
        "name": "Nintendo DS"
    },
    {
        "id": 159,
        "name": "Nintendo DSi"
    },
    {
        "id": 18,
        "name": "Nintendo Entertainment System"
    },
    {
        "id": 21,
        "name": "Nintendo GameCube"
    },
    {
        "id": 131,
        "name": "Nintendo PlayStation"
    },
    {
        "id": 130,
        "name": "Nintendo Switch"
    },
    {
        "id": 6,
        "name": "PC (Microsoft Windows)"
    },
    {
        "id": 7,
        "name": "PlayStation"
    },
    {
        "id": 8,
        "name": "PlayStation 2"
    },
    {
        "id": 9,
        "name": "PlayStation 3"
    },
    {
        "id": 48,
        "name": "PlayStation 4"
    },
    {
        "id": 167,
        "name": "PlayStation 5"
    },
    {
        "id": 38,
        "name": "PlayStation Portable"
    },
    {
        "id": 46,
        "name": "PlayStation Vita"
    },
    {
        "id": 165,
        "name": "PlayStation VR"
    },
    {
        "id": 390,
        "name": "PlayStation VR2"
    },
    {
        "id": 11,
        "name": "Xbox"
    },
    {
        "id": 12,
        "name": "Xbox 360"
    },
    {
        "id": 49,
        "name": "Xbox One"
    },
    {
        "id": 169,
        "name": "Xbox Series X|S"
    }
]
''');

final invalidJson = jsonDecode(r'''
[
    {
        "id": 37
    },
    {
        "id": 4,
        "name": "Nintendo 64"
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
