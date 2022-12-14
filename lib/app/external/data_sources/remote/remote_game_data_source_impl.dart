import '../../../../core/failures/failures.dart';
import '../../../../core/helpers/http/http.dart';

import '../../../domain/dtos/dtos.dart';
import '../../../domain/entities/entities.dart';
import '../../../infra/data_sources/data_sources.dart';

import '../../mappers/mappers.dart';

class RemoteGameDataSourceImpl implements IRemoteGameDataSource {
  final IHttpHelper _httpHelper;

  RemoteGameDataSourceImpl(this._httpHelper);

  @override
  Future<List<GameEntity>> getAll({
    required GetAllGamesInputDto input,
  }) async {
    try {
      List response = await _httpHelper.post(
        "/games",
        data: "fields name,platforms.name,genres.name,summary,cover.url,"
            "cover.image_id,rating; "
            "where platforms = (${input.platformId}) & total_rating_count > 100; "
            "sort rating desc; "
            "limit ${input.limit}; "
            "offset ${input.offset};",
      );
      return GameMapper.fromList(response);
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
