// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetConfigModelCollection on Isar {
  IsarCollection<ConfigModel> get configModels => getCollection();
}

const ConfigModelSchema = CollectionSchema(
  name: 'ConfigModel',
  schema:
      '{"name":"ConfigModel","idName":"id","properties":[{"name":"key","type":"String"},{"name":"value","type":"Long"}],"indexes":[{"name":"key","unique":false,"properties":[{"name":"key","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'key': 0, 'value': 1},
  listProperties: {},
  indexIds: {'key': 0},
  indexValueTypes: {
    'key': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _configModelGetId,
  setId: _configModelSetId,
  getLinks: _configModelGetLinks,
  attachLinks: _configModelAttachLinks,
  serializeNative: _configModelSerializeNative,
  deserializeNative: _configModelDeserializeNative,
  deserializePropNative: _configModelDeserializePropNative,
  serializeWeb: _configModelSerializeWeb,
  deserializeWeb: _configModelDeserializeWeb,
  deserializePropWeb: _configModelDeserializePropWeb,
  version: 3,
);

int? _configModelGetId(ConfigModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _configModelSetId(ConfigModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _configModelGetLinks(ConfigModel object) {
  return [];
}

void _configModelSerializeNative(
    IsarCollection<ConfigModel> collection,
    IsarRawObject rawObj,
    ConfigModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.key;
  final _key = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_key.length) as int;
  final value1 = object.value;
  final _value = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _key);
  writer.writeLong(offsets[1], _value);
}

ConfigModel _configModelDeserializeNative(
    IsarCollection<ConfigModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ConfigModel(
    key: reader.readString(offsets[0]),
    value: reader.readLong(offsets[1]),
  );
  object.id = id;
  return object;
}

P _configModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _configModelSerializeWeb(
    IsarCollection<ConfigModel> collection, ConfigModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'value', object.value);
  return jsObj;
}

ConfigModel _configModelDeserializeWeb(
    IsarCollection<ConfigModel> collection, dynamic jsObj) {
  final object = ConfigModel(
    key: IsarNative.jsObjectGet(jsObj, 'key') ?? '',
    value: IsarNative.jsObjectGet(jsObj, 'value') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _configModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'value':
      return (IsarNative.jsObjectGet(jsObj, 'value') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _configModelAttachLinks(IsarCollection col, int id, ConfigModel object) {}

extension ConfigModelQueryWhereSort
    on QueryBuilder<ConfigModel, ConfigModel, QWhere> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhere> anyKey() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'key'));
  }
}

extension ConfigModelQueryWhere
    on QueryBuilder<ConfigModel, ConfigModel, QWhereClause> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> keyEqualTo(
      String key) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'key',
      value: [key],
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterWhereClause> keyNotEqualTo(
      String key) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      ));
    }
  }
}

extension ConfigModelQueryFilter
    on QueryBuilder<ConfigModel, ConfigModel, QFilterCondition> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> valueEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'value',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition>
      valueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'value',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> valueLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'value',
      value: value,
    ));
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterFilterCondition> valueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'value',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ConfigModelQueryLinks
    on QueryBuilder<ConfigModel, ConfigModel, QFilterCondition> {}

extension ConfigModelQueryWhereSortBy
    on QueryBuilder<ConfigModel, ConfigModel, QSortBy> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> sortByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension ConfigModelQueryWhereSortThenBy
    on QueryBuilder<ConfigModel, ConfigModel, QSortThenBy> {
  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByValue() {
    return addSortByInternal('value', Sort.asc);
  }

  QueryBuilder<ConfigModel, ConfigModel, QAfterSortBy> thenByValueDesc() {
    return addSortByInternal('value', Sort.desc);
  }
}

extension ConfigModelQueryWhereDistinct
    on QueryBuilder<ConfigModel, ConfigModel, QDistinct> {
  QueryBuilder<ConfigModel, ConfigModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ConfigModel, ConfigModel, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConfigModel, ConfigModel, QDistinct> distinctByValue() {
    return addDistinctByInternal('value');
  }
}

extension ConfigModelQueryProperty
    on QueryBuilder<ConfigModel, ConfigModel, QQueryProperty> {
  QueryBuilder<ConfigModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ConfigModel, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<ConfigModel, int, QQueryOperations> valueProperty() {
    return addPropertyNameInternal('value');
  }
}
