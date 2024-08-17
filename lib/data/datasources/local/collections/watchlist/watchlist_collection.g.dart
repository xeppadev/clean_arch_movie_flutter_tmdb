// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWatchlistCollectionCollection on Isar {
  IsarCollection<WatchlistCollection> get watchlistCollections =>
      this.collection();
}

const WatchlistCollectionSchema = CollectionSchema(
  name: r'WatchlistCollection',
  id: -8802194377117481694,
  properties: {
    r'isMovie': PropertySchema(
      id: 0,
      name: r'isMovie',
      type: IsarType.bool,
    ),
    r'posterUrl': PropertySchema(
      id: 1,
      name: r'posterUrl',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    ),
    r'voteAverage': PropertySchema(
      id: 3,
      name: r'voteAverage',
      type: IsarType.double,
    )
  },
  estimateSize: _watchlistCollectionEstimateSize,
  serialize: _watchlistCollectionSerialize,
  deserialize: _watchlistCollectionDeserialize,
  deserializeProp: _watchlistCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _watchlistCollectionGetId,
  getLinks: _watchlistCollectionGetLinks,
  attach: _watchlistCollectionAttach,
  version: '3.1.0+1',
);

int _watchlistCollectionEstimateSize(
  WatchlistCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.posterUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _watchlistCollectionSerialize(
  WatchlistCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isMovie);
  writer.writeString(offsets[1], object.posterUrl);
  writer.writeString(offsets[2], object.title);
  writer.writeDouble(offsets[3], object.voteAverage);
}

WatchlistCollection _watchlistCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WatchlistCollection(
    id: id,
    isMovie: reader.readBoolOrNull(offsets[0]),
    posterUrl: reader.readStringOrNull(offsets[1]),
    title: reader.readStringOrNull(offsets[2]),
    voteAverage: reader.readDoubleOrNull(offsets[3]),
  );
  return object;
}

P _watchlistCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _watchlistCollectionGetId(WatchlistCollection object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _watchlistCollectionGetLinks(
    WatchlistCollection object) {
  return [];
}

void _watchlistCollectionAttach(
    IsarCollection<dynamic> col, Id id, WatchlistCollection object) {}

extension WatchlistCollectionQueryWhereSort
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QWhere> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WatchlistCollectionQueryWhere
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QWhereClause> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WatchlistCollectionQueryFilter on QueryBuilder<WatchlistCollection,
    WatchlistCollection, QFilterCondition> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      isMovieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMovie',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      isMovieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMovie',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      isMovieEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMovie',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'posterUrl',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'posterUrl',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posterUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posterUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      posterUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voteAverage',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voteAverage',
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterFilterCondition>
      voteAverageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voteAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WatchlistCollectionQueryObject on QueryBuilder<WatchlistCollection,
    WatchlistCollection, QFilterCondition> {}

extension WatchlistCollectionQueryLinks on QueryBuilder<WatchlistCollection,
    WatchlistCollection, QFilterCondition> {}

extension WatchlistCollectionQuerySortBy
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QSortBy> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByIsMovie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMovie', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByIsMovieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMovie', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByPosterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByPosterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      sortByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }
}

extension WatchlistCollectionQuerySortThenBy
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QSortThenBy> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByIsMovie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMovie', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByIsMovieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMovie', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByPosterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByPosterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QAfterSortBy>
      thenByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }
}

extension WatchlistCollectionQueryWhereDistinct
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QDistinct> {
  QueryBuilder<WatchlistCollection, WatchlistCollection, QDistinct>
      distinctByIsMovie() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMovie');
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QDistinct>
      distinctByPosterUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WatchlistCollection, WatchlistCollection, QDistinct>
      distinctByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voteAverage');
    });
  }
}

extension WatchlistCollectionQueryProperty
    on QueryBuilder<WatchlistCollection, WatchlistCollection, QQueryProperty> {
  QueryBuilder<WatchlistCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WatchlistCollection, bool?, QQueryOperations> isMovieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMovie');
    });
  }

  QueryBuilder<WatchlistCollection, String?, QQueryOperations>
      posterUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterUrl');
    });
  }

  QueryBuilder<WatchlistCollection, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<WatchlistCollection, double?, QQueryOperations>
      voteAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voteAverage');
    });
  }
}
