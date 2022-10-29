import 'package:game_lovers/app/external/drift/database.dart';

import '../../../../core/failures/failures.dart';

import '../../../../core/utils/utils.dart';
import '../../../domain/entities/entities.dart';
import '../../../infra/data_sources/data_sources.dart';

import '../../mappers/mappers.dart';

class LocalPlatformDataSourceImpl implements ILocalPlatformDataSource {
  final LocalDatabase _database;

  LocalPlatformDataSourceImpl(this._database);

  @override
  Future<List<PlatformEntity>> getAll() async {
    try {
      var response = await _database.select(_database.platforms).get();
      return PlatformMapper.fromListTable(response);
    } catch (e, stackTrace) {
      throw ParseFailure(
        message: "Erro ao mapear objeto",
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> saveAll({required List<PlatformEntity> games}) async {
    try {
      var response = await _database.transaction(() async {
        for (var game in games) {
          await _database
              .into(_database.platforms)
              .insertOnConflictUpdate(PlatformsCompanion.insert(
                id: game.id.toString(),
                name: game.name,
              ));
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
