import '../../../domain/entities/entities.dart';

abstract class ILocalPlatformDataSource {
  Future<List<PlatformEntity>> getAll();

  Future<bool> saveAll({
    required List<PlatformEntity> platforms,
  });
}
