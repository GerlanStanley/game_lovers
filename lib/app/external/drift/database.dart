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
  IntColumn get id => integer().unique()();

  TextColumn get name => text()();

  TextColumn get summary => text().nullable()();

  IntColumn get cover => integer().nullable().references(Covers, #id)();
}

@DataClassName("Cover")
class Covers extends Table {
  IntColumn get id => integer().unique()();

  TextColumn get imageId => text()();

  TextColumn get url => text()();
}

@DataClassName("Genre")
class Genres extends Table {
  IntColumn get id => integer().unique()();

  TextColumn get name => text()();
}

@DataClassName('GameGenreEntry')
class GameGenreEntries extends Table {
  IntColumn get game => integer().references(Games, #id)();

  IntColumn get genre => integer().references(Genres, #id)();
}

@DriftDatabase(tables: [Platforms, Games, Covers, Genres, GameGenreEntries])
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
