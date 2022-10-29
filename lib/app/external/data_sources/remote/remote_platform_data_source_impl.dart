import '../../../core/failures/failures.dart';
import '../../../core/helpers/http/http.dart';

import '../../domain/entities/entities.dart';
import '../../infra/data_sources/data_sources.dart';

import '../mappers/mappers.dart';

class PlatformDataSourceImpl implements IPlatformDataSource {
  final IHttpHelper _httpHelper;

  PlatformDataSourceImpl(this._httpHelper);

  @override
  Future<List<PlatformEntity>> getAll() async {
    try {
      List response = await _httpHelper.post(
        "/platforms",
        data: r'''
          fields id,name;
          where name = "Nintendo"* | name ="PlayStation"* | name = "PC (Microsoft Windows)"* | name = "Xbox"*;
          sort name asc;
          limit 100;
        ''',
      );
      return PlatformMapper.fromList(response);
    } on Failure {
      rethrow;
    } catch (e, stackTrace) {
      throw ParseJsonFailure(
        message: "Erro ao mapear o json",
        stackTrace: stackTrace,
      );
    }
  }
}
