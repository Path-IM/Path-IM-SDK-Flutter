// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMessageModelCollection on Isar {
  IsarCollection<MessageModel> get messageModels => getCollection();
}

const MessageModelSchema = CollectionSchema(
  name: 'MessageModel',
  schema:
      '{"name":"MessageModel","idName":"id","properties":[{"name":"atUserIDList","type":"StringList"},{"name":"clientMsgID","type":"String"},{"name":"clientTime","type":"Long"},{"name":"content","type":"String"},{"name":"contentType","type":"Long"},{"name":"conversationID","type":"String"},{"name":"conversationType","type":"Long"},{"name":"markRead","type":"Bool"},{"name":"markRevoke","type":"Bool"},{"name":"msgOptions","type":"String"},{"name":"offlinePush","type":"String"},{"name":"readCount","type":"Long"},{"name":"receiveID","type":"String"},{"name":"revokeContent","type":"String"},{"name":"sendID","type":"String"},{"name":"sendStatus","type":"Long"},{"name":"seq","type":"Long"},{"name":"serverMsgID","type":"String"},{"name":"serverTime","type":"Long"}],"indexes":[{"name":"clientMsgID","unique":false,"properties":[{"name":"clientMsgID","type":"Hash","caseSensitive":true}]},{"name":"content","unique":false,"properties":[{"name":"content","type":"Hash","caseSensitive":true}]},{"name":"contentType","unique":false,"properties":[{"name":"contentType","type":"Value","caseSensitive":false}]},{"name":"conversationID","unique":false,"properties":[{"name":"conversationID","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'atUserIDList': 0,
    'clientMsgID': 1,
    'clientTime': 2,
    'content': 3,
    'contentType': 4,
    'conversationID': 5,
    'conversationType': 6,
    'markRead': 7,
    'markRevoke': 8,
    'msgOptions': 9,
    'offlinePush': 10,
    'readCount': 11,
    'receiveID': 12,
    'revokeContent': 13,
    'sendID': 14,
    'sendStatus': 15,
    'seq': 16,
    'serverMsgID': 17,
    'serverTime': 18
  },
  listProperties: {'atUserIDList'},
  indexIds: {
    'clientMsgID': 0,
    'content': 1,
    'contentType': 2,
    'conversationID': 3
  },
  indexValueTypes: {
    'clientMsgID': [
      IndexValueType.stringHash,
    ],
    'content': [
      IndexValueType.stringHash,
    ],
    'contentType': [
      IndexValueType.long,
    ],
    'conversationID': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _messageModelGetId,
  setId: _messageModelSetId,
  getLinks: _messageModelGetLinks,
  attachLinks: _messageModelAttachLinks,
  serializeNative: _messageModelSerializeNative,
  deserializeNative: _messageModelDeserializeNative,
  deserializePropNative: _messageModelDeserializePropNative,
  serializeWeb: _messageModelSerializeWeb,
  deserializeWeb: _messageModelDeserializeWeb,
  deserializePropWeb: _messageModelDeserializePropWeb,
  version: 3,
);

int? _messageModelGetId(MessageModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _messageModelSetId(MessageModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _messageModelGetLinks(MessageModel object) {
  return [];
}

const _messageModelMsgOptionsConverter = MsgOptionsConverter();
const _messageModelOfflinePushConverter = OfflinePushConverter();

void _messageModelSerializeNative(
    IsarCollection<MessageModel> collection,
    IsarRawObject rawObj,
    MessageModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.atUserIDList;
  dynamicSize += (value0?.length ?? 0) * 8;
  List<IsarUint8List?>? bytesList0;
  if (value0 != null) {
    bytesList0 = [];
    for (var str in value0) {
      final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
      bytesList0.add(bytes);
      dynamicSize += bytes.length as int;
    }
  }
  final _atUserIDList = bytesList0;
  final value1 = object.clientMsgID;
  final _clientMsgID = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_clientMsgID.length) as int;
  final value2 = object.clientTime;
  final _clientTime = value2;
  final value3 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_content.length) as int;
  final value4 = object.contentType;
  final _contentType = value4;
  final value5 = object.conversationID;
  final _conversationID = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_conversationID.length) as int;
  final value6 = object.conversationType;
  final _conversationType = value6;
  final value7 = object.markRead;
  final _markRead = value7;
  final value8 = object.markRevoke;
  final _markRevoke = value8;
  final value9 = _messageModelMsgOptionsConverter.toIsar(object.msgOptions);
  final _msgOptions = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_msgOptions.length) as int;
  final value10 = _messageModelOfflinePushConverter.toIsar(object.offlinePush);
  final _offlinePush = IsarBinaryWriter.utf8Encoder.convert(value10);
  dynamicSize += (_offlinePush.length) as int;
  final value11 = object.readCount;
  final _readCount = value11;
  final value12 = object.receiveID;
  final _receiveID = IsarBinaryWriter.utf8Encoder.convert(value12);
  dynamicSize += (_receiveID.length) as int;
  final value13 = object.revokeContent;
  final _revokeContent = IsarBinaryWriter.utf8Encoder.convert(value13);
  dynamicSize += (_revokeContent.length) as int;
  final value14 = object.sendID;
  final _sendID = IsarBinaryWriter.utf8Encoder.convert(value14);
  dynamicSize += (_sendID.length) as int;
  final value15 = object.sendStatus;
  final _sendStatus = value15;
  final value16 = object.seq;
  final _seq = value16;
  final value17 = object.serverMsgID;
  IsarUint8List? _serverMsgID;
  if (value17 != null) {
    _serverMsgID = IsarBinaryWriter.utf8Encoder.convert(value17);
  }
  dynamicSize += (_serverMsgID?.length ?? 0) as int;
  final value18 = object.serverTime;
  final _serverTime = value18;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeStringList(offsets[0], _atUserIDList);
  writer.writeBytes(offsets[1], _clientMsgID);
  writer.writeLong(offsets[2], _clientTime);
  writer.writeBytes(offsets[3], _content);
  writer.writeLong(offsets[4], _contentType);
  writer.writeBytes(offsets[5], _conversationID);
  writer.writeLong(offsets[6], _conversationType);
  writer.writeBool(offsets[7], _markRead);
  writer.writeBool(offsets[8], _markRevoke);
  writer.writeBytes(offsets[9], _msgOptions);
  writer.writeBytes(offsets[10], _offlinePush);
  writer.writeLong(offsets[11], _readCount);
  writer.writeBytes(offsets[12], _receiveID);
  writer.writeBytes(offsets[13], _revokeContent);
  writer.writeBytes(offsets[14], _sendID);
  writer.writeLong(offsets[15], _sendStatus);
  writer.writeLong(offsets[16], _seq);
  writer.writeBytes(offsets[17], _serverMsgID);
  writer.writeLong(offsets[18], _serverTime);
}

MessageModel _messageModelDeserializeNative(
    IsarCollection<MessageModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = MessageModel(
    atUserIDList: reader.readStringList(offsets[0]),
    clientMsgID: reader.readString(offsets[1]),
    clientTime: reader.readLong(offsets[2]),
    content: reader.readString(offsets[3]),
    contentType: reader.readLong(offsets[4]),
    conversationID: reader.readString(offsets[5]),
    conversationType: reader.readLong(offsets[6]),
    markRead: reader.readBool(offsets[7]),
    markRevoke: reader.readBool(offsets[8]),
    msgOptions: _messageModelMsgOptionsConverter
        .fromIsar(reader.readString(offsets[9])),
    offlinePush: _messageModelOfflinePushConverter
        .fromIsar(reader.readString(offsets[10])),
    readCount: reader.readLong(offsets[11]),
    receiveID: reader.readString(offsets[12]),
    revokeContent: reader.readString(offsets[13]),
    sendID: reader.readString(offsets[14]),
    sendStatus: reader.readLong(offsets[15]),
    seq: reader.readLongOrNull(offsets[16]),
    serverMsgID: reader.readStringOrNull(offsets[17]),
    serverTime: reader.readLong(offsets[18]),
  );
  object.id = id;
  return object;
}

P _messageModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (_messageModelMsgOptionsConverter
          .fromIsar(reader.readString(offset))) as P;
    case 10:
      return (_messageModelOfflinePushConverter
          .fromIsar(reader.readString(offset))) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _messageModelSerializeWeb(
    IsarCollection<MessageModel> collection, MessageModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'atUserIDList', object.atUserIDList);
  IsarNative.jsObjectSet(jsObj, 'clientMsgID', object.clientMsgID);
  IsarNative.jsObjectSet(jsObj, 'clientTime', object.clientTime);
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(jsObj, 'contentType', object.contentType);
  IsarNative.jsObjectSet(jsObj, 'conversationID', object.conversationID);
  IsarNative.jsObjectSet(jsObj, 'conversationType', object.conversationType);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'markRead', object.markRead);
  IsarNative.jsObjectSet(jsObj, 'markRevoke', object.markRevoke);
  IsarNative.jsObjectSet(jsObj, 'msgOptions',
      _messageModelMsgOptionsConverter.toIsar(object.msgOptions));
  IsarNative.jsObjectSet(jsObj, 'offlinePush',
      _messageModelOfflinePushConverter.toIsar(object.offlinePush));
  IsarNative.jsObjectSet(jsObj, 'readCount', object.readCount);
  IsarNative.jsObjectSet(jsObj, 'receiveID', object.receiveID);
  IsarNative.jsObjectSet(jsObj, 'revokeContent', object.revokeContent);
  IsarNative.jsObjectSet(jsObj, 'sendID', object.sendID);
  IsarNative.jsObjectSet(jsObj, 'sendStatus', object.sendStatus);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  IsarNative.jsObjectSet(jsObj, 'serverMsgID', object.serverMsgID);
  IsarNative.jsObjectSet(jsObj, 'serverTime', object.serverTime);
  return jsObj;
}

MessageModel _messageModelDeserializeWeb(
    IsarCollection<MessageModel> collection, dynamic jsObj) {
  final object = MessageModel(
    atUserIDList: (IsarNative.jsObjectGet(jsObj, 'atUserIDList') as List?)
        ?.map((e) => e ?? '')
        .toList()
        .cast<String>(),
    clientMsgID: IsarNative.jsObjectGet(jsObj, 'clientMsgID') ?? '',
    clientTime:
        IsarNative.jsObjectGet(jsObj, 'clientTime') ?? double.negativeInfinity,
    content: IsarNative.jsObjectGet(jsObj, 'content') ?? '',
    contentType:
        IsarNative.jsObjectGet(jsObj, 'contentType') ?? double.negativeInfinity,
    conversationID: IsarNative.jsObjectGet(jsObj, 'conversationID') ?? '',
    conversationType: IsarNative.jsObjectGet(jsObj, 'conversationType') ??
        double.negativeInfinity,
    markRead: IsarNative.jsObjectGet(jsObj, 'markRead') ?? false,
    markRevoke: IsarNative.jsObjectGet(jsObj, 'markRevoke') ?? false,
    msgOptions: _messageModelMsgOptionsConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgOptions') ?? ''),
    offlinePush: _messageModelOfflinePushConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? ''),
    readCount:
        IsarNative.jsObjectGet(jsObj, 'readCount') ?? double.negativeInfinity,
    receiveID: IsarNative.jsObjectGet(jsObj, 'receiveID') ?? '',
    revokeContent: IsarNative.jsObjectGet(jsObj, 'revokeContent') ?? '',
    sendID: IsarNative.jsObjectGet(jsObj, 'sendID') ?? '',
    sendStatus:
        IsarNative.jsObjectGet(jsObj, 'sendStatus') ?? double.negativeInfinity,
    seq: IsarNative.jsObjectGet(jsObj, 'seq'),
    serverMsgID: IsarNative.jsObjectGet(jsObj, 'serverMsgID'),
    serverTime:
        IsarNative.jsObjectGet(jsObj, 'serverTime') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _messageModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'atUserIDList':
      return ((IsarNative.jsObjectGet(jsObj, 'atUserIDList') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>()) as P;
    case 'clientMsgID':
      return (IsarNative.jsObjectGet(jsObj, 'clientMsgID') ?? '') as P;
    case 'clientTime':
      return (IsarNative.jsObjectGet(jsObj, 'clientTime') ??
          double.negativeInfinity) as P;
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'contentType':
      return (IsarNative.jsObjectGet(jsObj, 'contentType') ??
          double.negativeInfinity) as P;
    case 'conversationID':
      return (IsarNative.jsObjectGet(jsObj, 'conversationID') ?? '') as P;
    case 'conversationType':
      return (IsarNative.jsObjectGet(jsObj, 'conversationType') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'markRead':
      return (IsarNative.jsObjectGet(jsObj, 'markRead') ?? false) as P;
    case 'markRevoke':
      return (IsarNative.jsObjectGet(jsObj, 'markRevoke') ?? false) as P;
    case 'msgOptions':
      return (_messageModelMsgOptionsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgOptions') ?? '')) as P;
    case 'offlinePush':
      return (_messageModelOfflinePushConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? '')) as P;
    case 'readCount':
      return (IsarNative.jsObjectGet(jsObj, 'readCount') ??
          double.negativeInfinity) as P;
    case 'receiveID':
      return (IsarNative.jsObjectGet(jsObj, 'receiveID') ?? '') as P;
    case 'revokeContent':
      return (IsarNative.jsObjectGet(jsObj, 'revokeContent') ?? '') as P;
    case 'sendID':
      return (IsarNative.jsObjectGet(jsObj, 'sendID') ?? '') as P;
    case 'sendStatus':
      return (IsarNative.jsObjectGet(jsObj, 'sendStatus') ??
          double.negativeInfinity) as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq')) as P;
    case 'serverMsgID':
      return (IsarNative.jsObjectGet(jsObj, 'serverMsgID')) as P;
    case 'serverTime':
      return (IsarNative.jsObjectGet(jsObj, 'serverTime') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _messageModelAttachLinks(
    IsarCollection col, int id, MessageModel object) {}

extension MessageModelQueryWhereSort
    on QueryBuilder<MessageModel, MessageModel, QWhere> {
  QueryBuilder<MessageModel, MessageModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhere> anyClientMsgID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'clientMsgID'));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhere> anyContent() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'content'));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhere> anyContentType() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'contentType'));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhere> anyConversationID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'conversationID'));
  }
}

extension MessageModelQueryWhere
    on QueryBuilder<MessageModel, MessageModel, QWhereClause> {
  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      clientMsgIDEqualTo(String clientMsgID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'clientMsgID',
      value: [clientMsgID],
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      clientMsgIDNotEqualTo(String clientMsgID) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgID',
        upper: [clientMsgID],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgID',
        lower: [clientMsgID],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgID',
        lower: [clientMsgID],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgID',
        upper: [clientMsgID],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> contentEqualTo(
      String content) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'content',
      value: [content],
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause> contentNotEqualTo(
      String content) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      contentTypeEqualTo(int contentType) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'contentType',
      value: [contentType],
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      contentTypeNotEqualTo(int contentType) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      contentTypeGreaterThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'contentType',
      lower: [contentType],
      includeLower: include,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      contentTypeLessThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'contentType',
      upper: [contentType],
      includeUpper: include,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      contentTypeBetween(
    int lowerContentType,
    int upperContentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'contentType',
      lower: [lowerContentType],
      includeLower: includeLower,
      upper: [upperContentType],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
      conversationIDEqualTo(String conversationID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'conversationID',
      value: [conversationID],
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterWhereClause>
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
}

extension MessageModelQueryFilter
    on QueryBuilder<MessageModel, MessageModel, QFilterCondition> {
  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'atUserIDList',
      value: null,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'atUserIDList',
      value: null,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'atUserIDList',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'atUserIDList',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      atUserIDListAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'atUserIDList',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientMsgID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientMsgIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'clientMsgID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientTimeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      clientTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'content',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentTypeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      contentTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'contentType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      conversationIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'conversationID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      conversationIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'conversationID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      conversationTypeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'conversationType',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      markReadEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'markRead',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      markRevokeEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'markRevoke',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsEqualTo(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsGreaterThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsLessThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsBetween(
    MsgOptionsModel lower,
    MsgOptionsModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'msgOptions',
      lower: _messageModelMsgOptionsConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _messageModelMsgOptionsConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsStartsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsEndsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsContains(MsgOptionsModel value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'msgOptions',
      value: _messageModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      msgOptionsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'msgOptions',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushEqualTo(
    OfflinePushModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushGreaterThan(
    OfflinePushModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushLessThan(
    OfflinePushModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushBetween(
    OfflinePushModel? lower,
    OfflinePushModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'offlinePush',
      lower: _messageModelOfflinePushConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _messageModelOfflinePushConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushStartsWith(
    OfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushEndsWith(
    OfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushContains(OfflinePushModel value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'offlinePush',
      value: _messageModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      offlinePushMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'offlinePush',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      readCountEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'readCount',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      readCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'readCount',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      readCountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'readCount',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      readCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'readCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
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

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      receiveIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'receiveID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      receiveIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'receiveID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'revokeContent',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'revokeContent',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      revokeContentMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'revokeContent',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> sendIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> sendIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sendID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> sendIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sendID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendStatusEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      sendStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> seqIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'seq',
      value: null,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> seqEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      seqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> seqLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition> seqBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'seq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'serverMsgID',
      value: null,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverMsgID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverMsgIDMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'serverMsgID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverTimeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MessageModel, MessageModel, QAfterFilterCondition>
      serverTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension MessageModelQueryLinks
    on QueryBuilder<MessageModel, MessageModel, QFilterCondition> {}

extension MessageModelQueryWhereSortBy
    on QueryBuilder<MessageModel, MessageModel, QSortBy> {
  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByClientMsgID() {
    return addSortByInternal('clientMsgID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByClientMsgIDDesc() {
    return addSortByInternal('clientMsgID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByConversationID() {
    return addSortByInternal('conversationID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByConversationIDDesc() {
    return addSortByInternal('conversationID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByConversationType() {
    return addSortByInternal('conversationType', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByConversationTypeDesc() {
    return addSortByInternal('conversationType', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByMarkRead() {
    return addSortByInternal('markRead', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByMarkReadDesc() {
    return addSortByInternal('markRead', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByMarkRevoke() {
    return addSortByInternal('markRevoke', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByMarkRevokeDesc() {
    return addSortByInternal('markRevoke', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByMsgOptions() {
    return addSortByInternal('msgOptions', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByMsgOptionsDesc() {
    return addSortByInternal('msgOptions', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByReadCount() {
    return addSortByInternal('readCount', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByReadCountDesc() {
    return addSortByInternal('readCount', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByReceiveID() {
    return addSortByInternal('receiveID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByReceiveIDDesc() {
    return addSortByInternal('receiveID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByRevokeContent() {
    return addSortByInternal('revokeContent', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByRevokeContentDesc() {
    return addSortByInternal('revokeContent', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortBySendID() {
    return addSortByInternal('sendID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortBySendIDDesc() {
    return addSortByInternal('sendID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByServerMsgID() {
    return addSortByInternal('serverMsgID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByServerMsgIDDesc() {
    return addSortByInternal('serverMsgID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> sortByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      sortByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MessageModelQueryWhereSortThenBy
    on QueryBuilder<MessageModel, MessageModel, QSortThenBy> {
  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByClientMsgID() {
    return addSortByInternal('clientMsgID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByClientMsgIDDesc() {
    return addSortByInternal('clientMsgID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByConversationID() {
    return addSortByInternal('conversationID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByConversationIDDesc() {
    return addSortByInternal('conversationID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByConversationType() {
    return addSortByInternal('conversationType', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByConversationTypeDesc() {
    return addSortByInternal('conversationType', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByMarkRead() {
    return addSortByInternal('markRead', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByMarkReadDesc() {
    return addSortByInternal('markRead', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByMarkRevoke() {
    return addSortByInternal('markRevoke', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByMarkRevokeDesc() {
    return addSortByInternal('markRevoke', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByMsgOptions() {
    return addSortByInternal('msgOptions', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByMsgOptionsDesc() {
    return addSortByInternal('msgOptions', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByReadCount() {
    return addSortByInternal('readCount', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByReadCountDesc() {
    return addSortByInternal('readCount', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByReceiveID() {
    return addSortByInternal('receiveID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByReceiveIDDesc() {
    return addSortByInternal('receiveID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByRevokeContent() {
    return addSortByInternal('revokeContent', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByRevokeContentDesc() {
    return addSortByInternal('revokeContent', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenBySendID() {
    return addSortByInternal('sendID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenBySendIDDesc() {
    return addSortByInternal('sendID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByServerMsgID() {
    return addSortByInternal('serverMsgID', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByServerMsgIDDesc() {
    return addSortByInternal('serverMsgID', Sort.desc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy> thenByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MessageModel, MessageModel, QAfterSortBy>
      thenByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MessageModelQueryWhereDistinct
    on QueryBuilder<MessageModel, MessageModel, QDistinct> {
  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByClientMsgID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('clientMsgID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByClientTime() {
    return addDistinctByInternal('clientTime');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByContentType() {
    return addDistinctByInternal('contentType');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByConversationID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('conversationID',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct>
      distinctByConversationType() {
    return addDistinctByInternal('conversationType');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByMarkRead() {
    return addDistinctByInternal('markRead');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByMarkRevoke() {
    return addDistinctByInternal('markRevoke');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByMsgOptions(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('msgOptions', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByOfflinePush(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('offlinePush', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByReadCount() {
    return addDistinctByInternal('readCount');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByReceiveID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('receiveID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByRevokeContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('revokeContent', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctBySendID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sendID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctBySendStatus() {
    return addDistinctByInternal('sendStatus');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByServerMsgID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('serverMsgID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MessageModel, MessageModel, QDistinct> distinctByServerTime() {
    return addDistinctByInternal('serverTime');
  }
}

extension MessageModelQueryProperty
    on QueryBuilder<MessageModel, MessageModel, QQueryProperty> {
  QueryBuilder<MessageModel, List<String>?, QQueryOperations>
      atUserIDListProperty() {
    return addPropertyNameInternal('atUserIDList');
  }

  QueryBuilder<MessageModel, String, QQueryOperations> clientMsgIDProperty() {
    return addPropertyNameInternal('clientMsgID');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> clientTimeProperty() {
    return addPropertyNameInternal('clientTime');
  }

  QueryBuilder<MessageModel, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> contentTypeProperty() {
    return addPropertyNameInternal('contentType');
  }

  QueryBuilder<MessageModel, String, QQueryOperations>
      conversationIDProperty() {
    return addPropertyNameInternal('conversationID');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> conversationTypeProperty() {
    return addPropertyNameInternal('conversationType');
  }

  QueryBuilder<MessageModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<MessageModel, bool, QQueryOperations> markReadProperty() {
    return addPropertyNameInternal('markRead');
  }

  QueryBuilder<MessageModel, bool, QQueryOperations> markRevokeProperty() {
    return addPropertyNameInternal('markRevoke');
  }

  QueryBuilder<MessageModel, MsgOptionsModel, QQueryOperations>
      msgOptionsProperty() {
    return addPropertyNameInternal('msgOptions');
  }

  QueryBuilder<MessageModel, OfflinePushModel?, QQueryOperations>
      offlinePushProperty() {
    return addPropertyNameInternal('offlinePush');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> readCountProperty() {
    return addPropertyNameInternal('readCount');
  }

  QueryBuilder<MessageModel, String, QQueryOperations> receiveIDProperty() {
    return addPropertyNameInternal('receiveID');
  }

  QueryBuilder<MessageModel, String, QQueryOperations> revokeContentProperty() {
    return addPropertyNameInternal('revokeContent');
  }

  QueryBuilder<MessageModel, String, QQueryOperations> sendIDProperty() {
    return addPropertyNameInternal('sendID');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> sendStatusProperty() {
    return addPropertyNameInternal('sendStatus');
  }

  QueryBuilder<MessageModel, int?, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }

  QueryBuilder<MessageModel, String?, QQueryOperations> serverMsgIDProperty() {
    return addPropertyNameInternal('serverMsgID');
  }

  QueryBuilder<MessageModel, int, QQueryOperations> serverTimeProperty() {
    return addPropertyNameInternal('serverTime');
  }
}
