// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetConversationModelCollection on Isar {
  IsarCollection<ConversationModel> get conversationModels => getCollection();
}

const ConversationModelSchema = CollectionSchema(
  name: 'ConversationModel',
  schema:
      '{"name":"ConversationModel","idName":"id","properties":[{"name":"conversationID","type":"String"},{"name":"conversationType","type":"Long"},{"name":"draftText","type":"String"},{"name":"isPinned","type":"Bool"},{"name":"message","type":"String"},{"name":"messageTime","type":"Long"},{"name":"receiveID","type":"String"},{"name":"unreadCount","type":"Long"}],"indexes":[{"name":"conversationID","unique":false,"properties":[{"name":"conversationID","type":"Hash","caseSensitive":true}]},{"name":"unreadCount","unique":false,"properties":[{"name":"unreadCount","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'conversationID': 0,
    'conversationType': 1,
    'draftText': 2,
    'isPinned': 3,
    'message': 4,
    'messageTime': 5,
    'receiveID': 6,
    'unreadCount': 7
  },
  listProperties: {},
  indexIds: {'conversationID': 0, 'unreadCount': 1},
  indexValueTypes: {
    'conversationID': [
      IndexValueType.stringHash,
    ],
    'unreadCount': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _conversationModelGetId,
  setId: _conversationModelSetId,
  getLinks: _conversationModelGetLinks,
  attachLinks: _conversationModelAttachLinks,
  serializeNative: _conversationModelSerializeNative,
  deserializeNative: _conversationModelDeserializeNative,
  deserializePropNative: _conversationModelDeserializePropNative,
  serializeWeb: _conversationModelSerializeWeb,
  deserializeWeb: _conversationModelDeserializeWeb,
  deserializePropWeb: _conversationModelDeserializePropWeb,
  version: 3,
);

int? _conversationModelGetId(ConversationModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _conversationModelSetId(ConversationModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _conversationModelGetLinks(ConversationModel object) {
  return [];
}

const _conversationModelDraftTextConverter = DraftTextConverter();
const _conversationModelMessageConverter = MessageConverter();

void _conversationModelSerializeNative(
    IsarCollection<ConversationModel> collection,
    IsarRawObject rawObj,
    ConversationModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.conversationID;
  final _conversationID = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_conversationID.length) as int;
  final value1 = object.conversationType;
  final _conversationType = value1;
  final value2 = _conversationModelDraftTextConverter.toIsar(object.draftText);
  final _draftText = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_draftText.length) as int;
  final value3 = object.isPinned;
  final _isPinned = value3;
  final value4 = _conversationModelMessageConverter.toIsar(object.message);
  final _message = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_message.length) as int;
  final value5 = object.messageTime;
  final _messageTime = value5;
  final value6 = object.receiveID;
  final _receiveID = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_receiveID.length) as int;
  final value7 = object.unreadCount;
  final _unreadCount = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _conversationID);
  writer.writeLong(offsets[1], _conversationType);
  writer.writeBytes(offsets[2], _draftText);
  writer.writeBool(offsets[3], _isPinned);
  writer.writeBytes(offsets[4], _message);
  writer.writeLong(offsets[5], _messageTime);
  writer.writeBytes(offsets[6], _receiveID);
  writer.writeLong(offsets[7], _unreadCount);
}

ConversationModel _conversationModelDeserializeNative(
    IsarCollection<ConversationModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ConversationModel(
    conversationID: reader.readString(offsets[0]),
    conversationType: reader.readLong(offsets[1]),
    draftText: _conversationModelDraftTextConverter
        .fromIsar(reader.readString(offsets[2])),
    isPinned: reader.readBool(offsets[3]),
    message: _conversationModelMessageConverter
        .fromIsar(reader.readString(offsets[4])),
    messageTime: reader.readLong(offsets[5]),
    receiveID: reader.readString(offsets[6]),
    unreadCount: reader.readLong(offsets[7]),
  );
  object.id = id;
  return object;
}

P _conversationModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_conversationModelDraftTextConverter
          .fromIsar(reader.readString(offset))) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_conversationModelMessageConverter
          .fromIsar(reader.readString(offset))) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _conversationModelSerializeWeb(
    IsarCollection<ConversationModel> collection, ConversationModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'conversationID', object.conversationID);
  IsarNative.jsObjectSet(jsObj, 'conversationType', object.conversationType);
  IsarNative.jsObjectSet(jsObj, 'draftText',
      _conversationModelDraftTextConverter.toIsar(object.draftText));
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isPinned', object.isPinned);
  IsarNative.jsObjectSet(jsObj, 'message',
      _conversationModelMessageConverter.toIsar(object.message));
  IsarNative.jsObjectSet(jsObj, 'messageTime', object.messageTime);
  IsarNative.jsObjectSet(jsObj, 'receiveID', object.receiveID);
  IsarNative.jsObjectSet(jsObj, 'unreadCount', object.unreadCount);
  return jsObj;
}

ConversationModel _conversationModelDeserializeWeb(
    IsarCollection<ConversationModel> collection, dynamic jsObj) {
  final object = ConversationModel(
    conversationID: IsarNative.jsObjectGet(jsObj, 'conversationID') ?? '',
    conversationType: IsarNative.jsObjectGet(jsObj, 'conversationType') ??
        double.negativeInfinity,
    draftText: _conversationModelDraftTextConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftText') ?? ''),
    isPinned: IsarNative.jsObjectGet(jsObj, 'isPinned') ?? false,
    message: _conversationModelMessageConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'message') ?? ''),
    messageTime:
        IsarNative.jsObjectGet(jsObj, 'messageTime') ?? double.negativeInfinity,
    receiveID: IsarNative.jsObjectGet(jsObj, 'receiveID') ?? '',
    unreadCount:
        IsarNative.jsObjectGet(jsObj, 'unreadCount') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _conversationModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'conversationID':
      return (IsarNative.jsObjectGet(jsObj, 'conversationID') ?? '') as P;
    case 'conversationType':
      return (IsarNative.jsObjectGet(jsObj, 'conversationType') ??
          double.negativeInfinity) as P;
    case 'draftText':
      return (_conversationModelDraftTextConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftText') ?? '')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'isPinned':
      return (IsarNative.jsObjectGet(jsObj, 'isPinned') ?? false) as P;
    case 'message':
      return (_conversationModelMessageConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'message') ?? '')) as P;
    case 'messageTime':
      return (IsarNative.jsObjectGet(jsObj, 'messageTime') ??
          double.negativeInfinity) as P;
    case 'receiveID':
      return (IsarNative.jsObjectGet(jsObj, 'receiveID') ?? '') as P;
    case 'unreadCount':
      return (IsarNative.jsObjectGet(jsObj, 'unreadCount') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _conversationModelAttachLinks(
    IsarCollection col, int id, ConversationModel object) {}

extension ConversationModelQueryWhereSort
    on QueryBuilder<ConversationModel, ConversationModel, QWhere> {
  QueryBuilder<ConversationModel, ConversationModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhere>
      anyConversationID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'conversationID'));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhere>
      anyUnreadCount() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'unreadCount'));
  }
}

extension ConversationModelQueryWhere
    on QueryBuilder<ConversationModel, ConversationModel, QWhereClause> {
  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      conversationIDEqualTo(String conversationID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'conversationID',
      value: [conversationID],
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      conversationIDNotEqualTo(String conversationID) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'conversationID',
        upper: [conversationID],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'conversationID',
        lower: [conversationID],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'conversationID',
        lower: [conversationID],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'conversationID',
        upper: [conversationID],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      unreadCountEqualTo(int unreadCount) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'unreadCount',
      value: [unreadCount],
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      unreadCountNotEqualTo(int unreadCount) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'unreadCount',
        upper: [unreadCount],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'unreadCount',
        lower: [unreadCount],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'unreadCount',
        lower: [unreadCount],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'unreadCount',
        upper: [unreadCount],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      unreadCountGreaterThan(
    int unreadCount, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'unreadCount',
      lower: [unreadCount],
      includeLower: include,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      unreadCountLessThan(
    int unreadCount, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'unreadCount',
      upper: [unreadCount],
      includeUpper: include,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterWhereClause>
      unreadCountBetween(
    int lowerUnreadCount,
    int upperUnreadCount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'unreadCount',
      lower: [lowerUnreadCount],
      includeLower: includeLower,
      upper: [upperUnreadCount],
      includeUpper: includeUpper,
    ));
  }
}

extension ConversationModelQueryFilter
    on QueryBuilder<ConversationModel, ConversationModel, QFilterCondition> {
  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'conversationID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'conversationID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationTypeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'conversationType',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'conversationType',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'conversationType',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      conversationTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'conversationType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextEqualTo(
    DraftTextModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextGreaterThan(
    DraftTextModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextLessThan(
    DraftTextModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextBetween(
    DraftTextModel? lower,
    DraftTextModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'draftText',
      lower: _conversationModelDraftTextConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _conversationModelDraftTextConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextStartsWith(
    DraftTextModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextEndsWith(
    DraftTextModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextContains(DraftTextModel value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'draftText',
      value: _conversationModelDraftTextConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      draftTextMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'draftText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      isPinnedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isPinned',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageEqualTo(
    MessageModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageGreaterThan(
    MessageModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageLessThan(
    MessageModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageBetween(
    MessageModel? lower,
    MessageModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'message',
      lower: _conversationModelMessageConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _conversationModelMessageConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageStartsWith(
    MessageModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageEndsWith(
    MessageModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageContains(MessageModel value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'message',
      value: _conversationModelMessageConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'message',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageTimeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'messageTime',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'messageTime',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'messageTime',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      messageTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'messageTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'receiveID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      receiveIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'receiveID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      unreadCountEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      unreadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      unreadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterFilterCondition>
      unreadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'unreadCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ConversationModelQueryLinks
    on QueryBuilder<ConversationModel, ConversationModel, QFilterCondition> {}

extension ConversationModelQueryWhereSortBy
    on QueryBuilder<ConversationModel, ConversationModel, QSortBy> {
  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByConversationID() {
    return addSortByInternal('conversationID', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByConversationIDDesc() {
    return addSortByInternal('conversationID', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByConversationType() {
    return addSortByInternal('conversationType', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByConversationTypeDesc() {
    return addSortByInternal('conversationType', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByDraftText() {
    return addSortByInternal('draftText', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByDraftTextDesc() {
    return addSortByInternal('draftText', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByIsPinned() {
    return addSortByInternal('isPinned', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByIsPinnedDesc() {
    return addSortByInternal('isPinned', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByMessage() {
    return addSortByInternal('message', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByMessageDesc() {
    return addSortByInternal('message', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByMessageTime() {
    return addSortByInternal('messageTime', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByMessageTimeDesc() {
    return addSortByInternal('messageTime', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByReceiveID() {
    return addSortByInternal('receiveID', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByReceiveIDDesc() {
    return addSortByInternal('receiveID', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      sortByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConversationModelQueryWhereSortThenBy
    on QueryBuilder<ConversationModel, ConversationModel, QSortThenBy> {
  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByConversationID() {
    return addSortByInternal('conversationID', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByConversationIDDesc() {
    return addSortByInternal('conversationID', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByConversationType() {
    return addSortByInternal('conversationType', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByConversationTypeDesc() {
    return addSortByInternal('conversationType', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByDraftText() {
    return addSortByInternal('draftText', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByDraftTextDesc() {
    return addSortByInternal('draftText', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByIsPinned() {
    return addSortByInternal('isPinned', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByIsPinnedDesc() {
    return addSortByInternal('isPinned', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByMessage() {
    return addSortByInternal('message', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByMessageDesc() {
    return addSortByInternal('message', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByMessageTime() {
    return addSortByInternal('messageTime', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByMessageTimeDesc() {
    return addSortByInternal('messageTime', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByReceiveID() {
    return addSortByInternal('receiveID', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByReceiveIDDesc() {
    return addSortByInternal('receiveID', Sort.desc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConversationModel, ConversationModel, QAfterSortBy>
      thenByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConversationModelQueryWhereDistinct
    on QueryBuilder<ConversationModel, ConversationModel, QDistinct> {
  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByConversationID({bool caseSensitive = true}) {
    return addDistinctByInternal('conversationID',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByConversationType() {
    return addDistinctByInternal('conversationType');
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByDraftText({bool caseSensitive = true}) {
    return addDistinctByInternal('draftText', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByIsPinned() {
    return addDistinctByInternal('isPinned');
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByMessage({bool caseSensitive = true}) {
    return addDistinctByInternal('message', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByMessageTime() {
    return addDistinctByInternal('messageTime');
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByReceiveID({bool caseSensitive = true}) {
    return addDistinctByInternal('receiveID', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConversationModel, ConversationModel, QDistinct>
      distinctByUnreadCount() {
    return addDistinctByInternal('unreadCount');
  }
}

extension ConversationModelQueryProperty
    on QueryBuilder<ConversationModel, ConversationModel, QQueryProperty> {
  QueryBuilder<ConversationModel, String, QQueryOperations>
      conversationIDProperty() {
    return addPropertyNameInternal('conversationID');
  }

  QueryBuilder<ConversationModel, int, QQueryOperations>
      conversationTypeProperty() {
    return addPropertyNameInternal('conversationType');
  }

  QueryBuilder<ConversationModel, DraftTextModel?, QQueryOperations>
      draftTextProperty() {
    return addPropertyNameInternal('draftText');
  }

  QueryBuilder<ConversationModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ConversationModel, bool, QQueryOperations> isPinnedProperty() {
    return addPropertyNameInternal('isPinned');
  }

  QueryBuilder<ConversationModel, MessageModel?, QQueryOperations>
      messageProperty() {
    return addPropertyNameInternal('message');
  }

  QueryBuilder<ConversationModel, int, QQueryOperations> messageTimeProperty() {
    return addPropertyNameInternal('messageTime');
  }

  QueryBuilder<ConversationModel, String, QQueryOperations>
      receiveIDProperty() {
    return addPropertyNameInternal('receiveID');
  }

  QueryBuilder<ConversationModel, int, QQueryOperations> unreadCountProperty() {
    return addPropertyNameInternal('unreadCount');
  }
}
