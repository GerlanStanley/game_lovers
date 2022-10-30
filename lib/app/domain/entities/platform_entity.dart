class PlatformEntity {
  final int id;
  final String name;

  PlatformEntity({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}
