import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/external/data_sources/data_sources.dart';
import 'package:game_lovers/app/external/drift/database.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';

void main() {
  late LocalDatabase localDatabase;
  late ILocalPlatformDataSource dataSource;

  setUp(() {
    localDatabase = LocalDatabase(queryExecutor: NativeDatabase.memory());
    dataSource = LocalPlatformDataSourceImpl(localDatabase);
  });

  tearDown(() async {
    await localDatabase.close();
  });

  test("Deve retornar os mesmos ids das plataformas salvas", () async {
    var platforms = [
      PlatformEntity(
        id: 1,
        name: "Nintendo 3DS",
      ),
      PlatformEntity(
        id: 2,
        name: "Nintendo 64",
      ),
    ];

    await dataSource.saveAll(platforms: platforms);
    final getPlatforms = await dataSource.getAll();

    expect(getPlatforms[0].id, platforms[0].id);
    expect(getPlatforms[1].id, platforms[1].id);
  });
}
