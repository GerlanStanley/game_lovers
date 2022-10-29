class GetAllGamesInputDto {
  final int platformId;
  final int offset;
  final int limit;

  GetAllGamesInputDto({
    required this.platformId,
    required this.offset,
    required this.limit,
  });
}