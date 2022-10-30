import '../../../../core/failures/failures.dart';
import '../../../../core/helpers/http/http.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/data_sources/data_sources.dart';

import '../../mappers/mappers.dart';

class RemotePlatformDataSourceImpl implements IRemotePlatformDataSource {
  final IHttpHelper _httpHelper;

  RemotePlatformDataSourceImpl(this._httpHelper);

  @override
  Future<List<PlatformEntity>> getAll() async {
    try {
      List response = await _httpHelper.post(
        "/platforms",
        data: r'''
          fields id,name;
          where name = "Nintendo 3DS" 
            | name ="Nintendo 64" 
            | name ="Nintendo Entertainment"* 
            | name ="Nintendo GameCube"
            | name ="PlayStation"
            | name ="PlayStation 2"
            | name ="PlayStation 3"
            | name ="PlayStation 4"
            | name ="PlayStation 5"
            | name = "PC (Microsoft Windows)"* 
            | name = "Xbox"*;
          sort name asc;
          limit 100;
        ''',
      );
      return PlatformMapper.fromListJson(response);
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw ParseFailure(
        message: "Erro ao mapear o json",
        stackTrace: stackTrace,
      );
    }
  }
}
