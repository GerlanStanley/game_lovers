import '../../domain/entities/entities.dart';

abstract class IPlatformDataSource {
  Future<List<PlatformEntity>> getAll();
}