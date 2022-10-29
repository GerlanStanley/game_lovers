import '../../../domain/entities/entities.dart';

abstract class IRemotePlatformDataSource {
  Future<List<PlatformEntity>> getAll();
}