// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Platform extends DataClass implements Insertable<Platform> {
  final String id;
  final String name;
  const Platform({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlatformsCompanion toCompanion(bool nullToAbsent) {
    return PlatformsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Platform.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Platform(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Platform copyWith({String? id, String? name}) => Platform(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Platform(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Platform && other.id == this.id && other.name == this.name);
}

class PlatformsCompanion extends UpdateCompanion<Platform> {
  final Value<String> id;
  final Value<String> name;
  const PlatformsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlatformsCompanion.insert({
    required String id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Platform> custom({
    Expression<String>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlatformsCompanion copyWith({Value<String>? id, Value<String>? name}) {
    return PlatformsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlatformsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PlatformsTable extends Platforms
    with TableInfo<$PlatformsTable, Platform> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlatformsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'platforms';
  @override
  String get actualTableName => 'platforms';
  @override
  VerificationContext validateIntegrity(Insertable<Platform> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Platform map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Platform(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $PlatformsTable createAlias(String alias) {
    return $PlatformsTable(attachedDatabase, alias);
  }
}

class Cover extends DataClass implements Insertable<Cover> {
  final String id;
  final String imageId;
  final String url;
  const Cover({required this.id, required this.imageId, required this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_id'] = Variable<String>(imageId);
    map['url'] = Variable<String>(url);
    return map;
  }

  CoversCompanion toCompanion(bool nullToAbsent) {
    return CoversCompanion(
      id: Value(id),
      imageId: Value(imageId),
      url: Value(url),
    );
  }

  factory Cover.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cover(
      id: serializer.fromJson<String>(json['id']),
      imageId: serializer.fromJson<String>(json['imageId']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageId': serializer.toJson<String>(imageId),
      'url': serializer.toJson<String>(url),
    };
  }

  Cover copyWith({String? id, String? imageId, String? url}) => Cover(
        id: id ?? this.id,
        imageId: imageId ?? this.imageId,
        url: url ?? this.url,
      );
  @override
  String toString() {
    return (StringBuffer('Cover(')
          ..write('id: $id, ')
          ..write('imageId: $imageId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageId, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cover &&
          other.id == this.id &&
          other.imageId == this.imageId &&
          other.url == this.url);
}

class CoversCompanion extends UpdateCompanion<Cover> {
  final Value<String> id;
  final Value<String> imageId;
  final Value<String> url;
  const CoversCompanion({
    this.id = const Value.absent(),
    this.imageId = const Value.absent(),
    this.url = const Value.absent(),
  });
  CoversCompanion.insert({
    required String id,
    required String imageId,
    required String url,
  })  : id = Value(id),
        imageId = Value(imageId),
        url = Value(url);
  static Insertable<Cover> custom({
    Expression<String>? id,
    Expression<String>? imageId,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageId != null) 'image_id': imageId,
      if (url != null) 'url': url,
    });
  }

  CoversCompanion copyWith(
      {Value<String>? id, Value<String>? imageId, Value<String>? url}) {
    return CoversCompanion(
      id: id ?? this.id,
      imageId: imageId ?? this.imageId,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<String>(imageId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoversCompanion(')
          ..write('id: $id, ')
          ..write('imageId: $imageId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $CoversTable extends Covers with TableInfo<$CoversTable, Cover> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoversTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _imageIdMeta = const VerificationMeta('imageId');
  @override
  late final GeneratedColumn<String> imageId = GeneratedColumn<String>(
      'image_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageId, url];
  @override
  String get aliasedName => _alias ?? 'covers';
  @override
  String get actualTableName => 'covers';
  @override
  VerificationContext validateIntegrity(Insertable<Cover> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cover map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cover(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image_id'])!,
      url: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
    );
  }

  @override
  $CoversTable createAlias(String alias) {
    return $CoversTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final String id;
  final String name;
  final String? summary;
  final double rating;
  final String? cover;
  const Game(
      {required this.id,
      required this.name,
      this.summary,
      required this.rating,
      this.cover});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    map['rating'] = Variable<double>(rating);
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      name: Value(name),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      rating: Value(rating),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      summary: serializer.fromJson<String?>(json['summary']),
      rating: serializer.fromJson<double>(json['rating']),
      cover: serializer.fromJson<String?>(json['cover']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'summary': serializer.toJson<String?>(summary),
      'rating': serializer.toJson<double>(rating),
      'cover': serializer.toJson<String?>(cover),
    };
  }

  Game copyWith(
          {String? id,
          String? name,
          Value<String?> summary = const Value.absent(),
          double? rating,
          Value<String?> cover = const Value.absent()}) =>
      Game(
        id: id ?? this.id,
        name: name ?? this.name,
        summary: summary.present ? summary.value : this.summary,
        rating: rating ?? this.rating,
        cover: cover.present ? cover.value : this.cover,
      );
  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('summary: $summary, ')
          ..write('rating: $rating, ')
          ..write('cover: $cover')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, summary, rating, cover);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.name == this.name &&
          other.summary == this.summary &&
          other.rating == this.rating &&
          other.cover == this.cover);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> summary;
  final Value<double> rating;
  final Value<String?> cover;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.summary = const Value.absent(),
    this.rating = const Value.absent(),
    this.cover = const Value.absent(),
  });
  GamesCompanion.insert({
    required String id,
    required String name,
    this.summary = const Value.absent(),
    required double rating,
    this.cover = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        rating = Value(rating);
  static Insertable<Game> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? summary,
    Expression<double>? rating,
    Expression<String>? cover,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (summary != null) 'summary': summary,
      if (rating != null) 'rating': rating,
      if (cover != null) 'cover': cover,
    });
  }

  GamesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? summary,
      Value<double>? rating,
      Value<String?>? cover}) {
    return GamesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      rating: rating ?? this.rating,
      cover: cover ?? this.cover,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('summary: $summary, ')
          ..write('rating: $rating, ')
          ..write('cover: $cover')
          ..write(')'))
        .toString();
  }
}

class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _summaryMeta = const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String> cover = GeneratedColumn<String>(
      'cover', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES covers (id)');
  @override
  List<GeneratedColumn> get $columns => [id, name, summary, rating, cover];
  @override
  String get aliasedName => _alias ?? 'games';
  @override
  String get actualTableName => 'games';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      summary: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      rating: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      cover: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}cover']),
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final String id;
  final String name;
  const Genre({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Genre copyWith({String? id, String? name}) => Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre && other.id == this.id && other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<String> id;
  final Value<String> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    required String id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Genre> custom({
    Expression<String>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith({Value<String>? id, Value<String>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genres';
  @override
  String get actualTableName => 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Genre(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class GameGenreEntry extends DataClass implements Insertable<GameGenreEntry> {
  final String game;
  final String genre;
  const GameGenreEntry({required this.game, required this.genre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game'] = Variable<String>(game);
    map['genre'] = Variable<String>(genre);
    return map;
  }

  GameGenreEntriesCompanion toCompanion(bool nullToAbsent) {
    return GameGenreEntriesCompanion(
      game: Value(game),
      genre: Value(genre),
    );
  }

  factory GameGenreEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameGenreEntry(
      game: serializer.fromJson<String>(json['game']),
      genre: serializer.fromJson<String>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'game': serializer.toJson<String>(game),
      'genre': serializer.toJson<String>(genre),
    };
  }

  GameGenreEntry copyWith({String? game, String? genre}) => GameGenreEntry(
        game: game ?? this.game,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('GameGenreEntry(')
          ..write('game: $game, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(game, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameGenreEntry &&
          other.game == this.game &&
          other.genre == this.genre);
}

class GameGenreEntriesCompanion extends UpdateCompanion<GameGenreEntry> {
  final Value<String> game;
  final Value<String> genre;
  const GameGenreEntriesCompanion({
    this.game = const Value.absent(),
    this.genre = const Value.absent(),
  });
  GameGenreEntriesCompanion.insert({
    required String game,
    required String genre,
  })  : game = Value(game),
        genre = Value(genre);
  static Insertable<GameGenreEntry> custom({
    Expression<String>? game,
    Expression<String>? genre,
  }) {
    return RawValuesInsertable({
      if (game != null) 'game': game,
      if (genre != null) 'genre': genre,
    });
  }

  GameGenreEntriesCompanion copyWith(
      {Value<String>? game, Value<String>? genre}) {
    return GameGenreEntriesCompanion(
      game: game ?? this.game,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (game.present) {
      map['game'] = Variable<String>(game.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameGenreEntriesCompanion(')
          ..write('game: $game, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $GameGenreEntriesTable extends GameGenreEntries
    with TableInfo<$GameGenreEntriesTable, GameGenreEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameGenreEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _gameMeta = const VerificationMeta('game');
  @override
  late final GeneratedColumn<String> game = GeneratedColumn<String>(
      'game', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES games (id)');
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES genres (id)');
  @override
  List<GeneratedColumn> get $columns => [game, genre];
  @override
  String get aliasedName => _alias ?? 'game_genre_entries';
  @override
  String get actualTableName => 'game_genre_entries';
  @override
  VerificationContext validateIntegrity(Insertable<GameGenreEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game')) {
      context.handle(
          _gameMeta, game.isAcceptableOrUnknown(data['game']!, _gameMeta));
    } else if (isInserting) {
      context.missing(_gameMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GameGenreEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameGenreEntry(
      game: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}game'])!,
      genre: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])!,
    );
  }

  @override
  $GameGenreEntriesTable createAlias(String alias) {
    return $GameGenreEntriesTable(attachedDatabase, alias);
  }
}

class GamePlatformEntry extends DataClass
    implements Insertable<GamePlatformEntry> {
  final String game;
  final String platform;
  const GamePlatformEntry({required this.game, required this.platform});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['game'] = Variable<String>(game);
    map['platform'] = Variable<String>(platform);
    return map;
  }

  GamePlatformEntriesCompanion toCompanion(bool nullToAbsent) {
    return GamePlatformEntriesCompanion(
      game: Value(game),
      platform: Value(platform),
    );
  }

  factory GamePlatformEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GamePlatformEntry(
      game: serializer.fromJson<String>(json['game']),
      platform: serializer.fromJson<String>(json['platform']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'game': serializer.toJson<String>(game),
      'platform': serializer.toJson<String>(platform),
    };
  }

  GamePlatformEntry copyWith({String? game, String? platform}) =>
      GamePlatformEntry(
        game: game ?? this.game,
        platform: platform ?? this.platform,
      );
  @override
  String toString() {
    return (StringBuffer('GamePlatformEntry(')
          ..write('game: $game, ')
          ..write('platform: $platform')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(game, platform);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GamePlatformEntry &&
          other.game == this.game &&
          other.platform == this.platform);
}

class GamePlatformEntriesCompanion extends UpdateCompanion<GamePlatformEntry> {
  final Value<String> game;
  final Value<String> platform;
  const GamePlatformEntriesCompanion({
    this.game = const Value.absent(),
    this.platform = const Value.absent(),
  });
  GamePlatformEntriesCompanion.insert({
    required String game,
    required String platform,
  })  : game = Value(game),
        platform = Value(platform);
  static Insertable<GamePlatformEntry> custom({
    Expression<String>? game,
    Expression<String>? platform,
  }) {
    return RawValuesInsertable({
      if (game != null) 'game': game,
      if (platform != null) 'platform': platform,
    });
  }

  GamePlatformEntriesCompanion copyWith(
      {Value<String>? game, Value<String>? platform}) {
    return GamePlatformEntriesCompanion(
      game: game ?? this.game,
      platform: platform ?? this.platform,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (game.present) {
      map['game'] = Variable<String>(game.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamePlatformEntriesCompanion(')
          ..write('game: $game, ')
          ..write('platform: $platform')
          ..write(')'))
        .toString();
  }
}

class $GamePlatformEntriesTable extends GamePlatformEntries
    with TableInfo<$GamePlatformEntriesTable, GamePlatformEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamePlatformEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _gameMeta = const VerificationMeta('game');
  @override
  late final GeneratedColumn<String> game = GeneratedColumn<String>(
      'game', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES games (id)');
  final VerificationMeta _platformMeta = const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES platforms (id)');
  @override
  List<GeneratedColumn> get $columns => [game, platform];
  @override
  String get aliasedName => _alias ?? 'game_platform_entries';
  @override
  String get actualTableName => 'game_platform_entries';
  @override
  VerificationContext validateIntegrity(Insertable<GamePlatformEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('game')) {
      context.handle(
          _gameMeta, game.isAcceptableOrUnknown(data['game']!, _gameMeta));
    } else if (isInserting) {
      context.missing(_gameMeta);
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    } else if (isInserting) {
      context.missing(_platformMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GamePlatformEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GamePlatformEntry(
      game: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}game'])!,
      platform: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}platform'])!,
    );
  }

  @override
  $GamePlatformEntriesTable createAlias(String alias) {
    return $GamePlatformEntriesTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $PlatformsTable platforms = $PlatformsTable(this);
  late final $CoversTable covers = $CoversTable(this);
  late final $GamesTable games = $GamesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $GameGenreEntriesTable gameGenreEntries =
      $GameGenreEntriesTable(this);
  late final $GamePlatformEntriesTable gamePlatformEntries =
      $GamePlatformEntriesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [platforms, covers, games, genres, gameGenreEntries, gamePlatformEntries];
}
