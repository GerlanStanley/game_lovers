import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

class Platforms extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Games extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get summary => text().nullable()();

  RealColumn get rating => real()();

  TextColumn get cover => text().nullable().references(Covers, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Cover")
class Covers extends Table {
  TextColumn get id => text()();

  TextColumn get imageId => text()();

  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Genre")
class Genres extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('GameGenreEntry')
class GameGenreEntries extends Table {
  TextColumn get game => text().references(Games, #id)();

  TextColumn get genre => text().references(Genres, #id)();
}

@DataClassName('GamePlatformEntry')
class GamePlatformEntries extends Table {
  TextColumn get game => text().references(Games, #id)();

  TextColumn get platform => text().references(Platforms, #id)();
}

@DriftDatabase(tables: [
  Platforms,
  Games,
  Covers,
  Genres,
  GameGenreEntries,
  GamePlatformEntries,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
