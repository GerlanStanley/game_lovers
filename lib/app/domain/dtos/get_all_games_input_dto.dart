import 'package:equatable/equatable.dart';

class GetAllGamesInputDto extends Equatable {
  final int platformId;
  final int offset;
  final int limit;

  const GetAllGamesInputDto({
    required this.platformId,
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [platformId, offset, limit];
}
