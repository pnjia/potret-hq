// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FindingsTable extends Findings with TableInfo<$FindingsTable, Finding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FindingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String> cityId = GeneratedColumn<String>(
    'city_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landmarkIdMeta = const VerificationMeta(
    'landmarkId',
  );
  @override
  late final GeneratedColumn<String> landmarkId = GeneratedColumn<String>(
    'landmark_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryId, String> category =
      GeneratedColumn<String>(
        'category',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryId>($FindingsTable.$convertercategory);
  static const VerificationMeta _cameraIdMeta = const VerificationMeta(
    'cameraId',
  );
  @override
  late final GeneratedColumn<String> cameraId = GeneratedColumn<String>(
    'camera_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cutoutUrlMeta = const VerificationMeta(
    'cutoutUrl',
  );
  @override
  late final GeneratedColumn<String> cutoutUrl = GeneratedColumn<String>(
    'cutout_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbUrlMeta = const VerificationMeta(
    'thumbUrl',
  );
  @override
  late final GeneratedColumn<String> thumbUrl = GeneratedColumn<String>(
    'thumb_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localOriginalPathMeta = const VerificationMeta(
    'localOriginalPath',
  );
  @override
  late final GeneratedColumn<String> localOriginalPath =
      GeneratedColumn<String>(
        'local_original_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EdgeStyle, String> edgeStyle =
      GeneratedColumn<String>(
        'edge_style',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(EdgeStyle.dieCut.name),
      ).withConverter<EdgeStyle>($FindingsTable.$converteredgeStyle);
  @override
  late final GeneratedColumnWithTypeConverter<EdgeWidth, String> edgeWidth =
      GeneratedColumn<String>(
        'edge_width',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(EdgeWidth.m.name),
      ).withConverter<EdgeWidth>($FindingsTable.$converteredgeWidth);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    cityId,
    landmarkId,
    category,
    cameraId,
    cutoutUrl,
    thumbUrl,
    localOriginalPath,
    note,
    createdAt,
    edgeStyle,
    edgeWidth,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'findings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Finding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('landmark_id')) {
      context.handle(
        _landmarkIdMeta,
        landmarkId.isAcceptableOrUnknown(data['landmark_id']!, _landmarkIdMeta),
      );
    }
    if (data.containsKey('camera_id')) {
      context.handle(
        _cameraIdMeta,
        cameraId.isAcceptableOrUnknown(data['camera_id']!, _cameraIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cameraIdMeta);
    }
    if (data.containsKey('cutout_url')) {
      context.handle(
        _cutoutUrlMeta,
        cutoutUrl.isAcceptableOrUnknown(data['cutout_url']!, _cutoutUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_cutoutUrlMeta);
    }
    if (data.containsKey('thumb_url')) {
      context.handle(
        _thumbUrlMeta,
        thumbUrl.isAcceptableOrUnknown(data['thumb_url']!, _thumbUrlMeta),
      );
    }
    if (data.containsKey('local_original_path')) {
      context.handle(
        _localOriginalPathMeta,
        localOriginalPath.isAcceptableOrUnknown(
          data['local_original_path']!,
          _localOriginalPathMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Finding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Finding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_id'],
      )!,
      landmarkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}landmark_id'],
      ),
      category: $FindingsTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      cameraId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}camera_id'],
      )!,
      cutoutUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cutout_url'],
      )!,
      thumbUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumb_url'],
      ),
      localOriginalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_original_path'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      edgeStyle: $FindingsTable.$converteredgeStyle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}edge_style'],
        )!,
      ),
      edgeWidth: $FindingsTable.$converteredgeWidth.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}edge_width'],
        )!,
      ),
    );
  }

  @override
  $FindingsTable createAlias(String alias) {
    return $FindingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CategoryId, String, String> $convertercategory =
      const EnumNameConverter<CategoryId>(CategoryId.values);
  static JsonTypeConverter2<EdgeStyle, String, String> $converteredgeStyle =
      const EnumNameConverter<EdgeStyle>(EdgeStyle.values);
  static JsonTypeConverter2<EdgeWidth, String, String> $converteredgeWidth =
      const EnumNameConverter<EdgeWidth>(EdgeWidth.values);
}

class Finding extends DataClass implements Insertable<Finding> {
  final String id;

  /// Null selama belum ada akun (Supabase ditahan).
  final String? userId;
  final String cityId;
  final String? landmarkId;
  final CategoryId category;
  final String cameraId;
  final String cutoutUrl;
  final String? thumbUrl;

  /// Path foto asli di perangkat. Hanya di drift, tidak pernah tersinkron
  /// (K-019).
  final String? localOriginalPath;
  final String? note;
  final DateTime createdAt;
  final EdgeStyle edgeStyle;
  final EdgeWidth edgeWidth;
  const Finding({
    required this.id,
    this.userId,
    required this.cityId,
    this.landmarkId,
    required this.category,
    required this.cameraId,
    required this.cutoutUrl,
    this.thumbUrl,
    this.localOriginalPath,
    this.note,
    required this.createdAt,
    required this.edgeStyle,
    required this.edgeWidth,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['city_id'] = Variable<String>(cityId);
    if (!nullToAbsent || landmarkId != null) {
      map['landmark_id'] = Variable<String>(landmarkId);
    }
    {
      map['category'] = Variable<String>(
        $FindingsTable.$convertercategory.toSql(category),
      );
    }
    map['camera_id'] = Variable<String>(cameraId);
    map['cutout_url'] = Variable<String>(cutoutUrl);
    if (!nullToAbsent || thumbUrl != null) {
      map['thumb_url'] = Variable<String>(thumbUrl);
    }
    if (!nullToAbsent || localOriginalPath != null) {
      map['local_original_path'] = Variable<String>(localOriginalPath);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    {
      map['edge_style'] = Variable<String>(
        $FindingsTable.$converteredgeStyle.toSql(edgeStyle),
      );
    }
    {
      map['edge_width'] = Variable<String>(
        $FindingsTable.$converteredgeWidth.toSql(edgeWidth),
      );
    }
    return map;
  }

  FindingsCompanion toCompanion(bool nullToAbsent) {
    return FindingsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      cityId: Value(cityId),
      landmarkId: landmarkId == null && nullToAbsent
          ? const Value.absent()
          : Value(landmarkId),
      category: Value(category),
      cameraId: Value(cameraId),
      cutoutUrl: Value(cutoutUrl),
      thumbUrl: thumbUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbUrl),
      localOriginalPath: localOriginalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localOriginalPath),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      edgeStyle: Value(edgeStyle),
      edgeWidth: Value(edgeWidth),
    );
  }

  factory Finding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Finding(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      cityId: serializer.fromJson<String>(json['cityId']),
      landmarkId: serializer.fromJson<String?>(json['landmarkId']),
      category: $FindingsTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      cameraId: serializer.fromJson<String>(json['cameraId']),
      cutoutUrl: serializer.fromJson<String>(json['cutoutUrl']),
      thumbUrl: serializer.fromJson<String?>(json['thumbUrl']),
      localOriginalPath: serializer.fromJson<String?>(
        json['localOriginalPath'],
      ),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      edgeStyle: $FindingsTable.$converteredgeStyle.fromJson(
        serializer.fromJson<String>(json['edgeStyle']),
      ),
      edgeWidth: $FindingsTable.$converteredgeWidth.fromJson(
        serializer.fromJson<String>(json['edgeWidth']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'cityId': serializer.toJson<String>(cityId),
      'landmarkId': serializer.toJson<String?>(landmarkId),
      'category': serializer.toJson<String>(
        $FindingsTable.$convertercategory.toJson(category),
      ),
      'cameraId': serializer.toJson<String>(cameraId),
      'cutoutUrl': serializer.toJson<String>(cutoutUrl),
      'thumbUrl': serializer.toJson<String?>(thumbUrl),
      'localOriginalPath': serializer.toJson<String?>(localOriginalPath),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'edgeStyle': serializer.toJson<String>(
        $FindingsTable.$converteredgeStyle.toJson(edgeStyle),
      ),
      'edgeWidth': serializer.toJson<String>(
        $FindingsTable.$converteredgeWidth.toJson(edgeWidth),
      ),
    };
  }

  Finding copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    String? cityId,
    Value<String?> landmarkId = const Value.absent(),
    CategoryId? category,
    String? cameraId,
    String? cutoutUrl,
    Value<String?> thumbUrl = const Value.absent(),
    Value<String?> localOriginalPath = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
    EdgeStyle? edgeStyle,
    EdgeWidth? edgeWidth,
  }) => Finding(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    cityId: cityId ?? this.cityId,
    landmarkId: landmarkId.present ? landmarkId.value : this.landmarkId,
    category: category ?? this.category,
    cameraId: cameraId ?? this.cameraId,
    cutoutUrl: cutoutUrl ?? this.cutoutUrl,
    thumbUrl: thumbUrl.present ? thumbUrl.value : this.thumbUrl,
    localOriginalPath: localOriginalPath.present
        ? localOriginalPath.value
        : this.localOriginalPath,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
    edgeStyle: edgeStyle ?? this.edgeStyle,
    edgeWidth: edgeWidth ?? this.edgeWidth,
  );
  Finding copyWithCompanion(FindingsCompanion data) {
    return Finding(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      landmarkId: data.landmarkId.present
          ? data.landmarkId.value
          : this.landmarkId,
      category: data.category.present ? data.category.value : this.category,
      cameraId: data.cameraId.present ? data.cameraId.value : this.cameraId,
      cutoutUrl: data.cutoutUrl.present ? data.cutoutUrl.value : this.cutoutUrl,
      thumbUrl: data.thumbUrl.present ? data.thumbUrl.value : this.thumbUrl,
      localOriginalPath: data.localOriginalPath.present
          ? data.localOriginalPath.value
          : this.localOriginalPath,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      edgeStyle: data.edgeStyle.present ? data.edgeStyle.value : this.edgeStyle,
      edgeWidth: data.edgeWidth.present ? data.edgeWidth.value : this.edgeWidth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Finding(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('cityId: $cityId, ')
          ..write('landmarkId: $landmarkId, ')
          ..write('category: $category, ')
          ..write('cameraId: $cameraId, ')
          ..write('cutoutUrl: $cutoutUrl, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('localOriginalPath: $localOriginalPath, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('edgeStyle: $edgeStyle, ')
          ..write('edgeWidth: $edgeWidth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    cityId,
    landmarkId,
    category,
    cameraId,
    cutoutUrl,
    thumbUrl,
    localOriginalPath,
    note,
    createdAt,
    edgeStyle,
    edgeWidth,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Finding &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.cityId == this.cityId &&
          other.landmarkId == this.landmarkId &&
          other.category == this.category &&
          other.cameraId == this.cameraId &&
          other.cutoutUrl == this.cutoutUrl &&
          other.thumbUrl == this.thumbUrl &&
          other.localOriginalPath == this.localOriginalPath &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.edgeStyle == this.edgeStyle &&
          other.edgeWidth == this.edgeWidth);
}

class FindingsCompanion extends UpdateCompanion<Finding> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<String> cityId;
  final Value<String?> landmarkId;
  final Value<CategoryId> category;
  final Value<String> cameraId;
  final Value<String> cutoutUrl;
  final Value<String?> thumbUrl;
  final Value<String?> localOriginalPath;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<EdgeStyle> edgeStyle;
  final Value<EdgeWidth> edgeWidth;
  final Value<int> rowid;
  const FindingsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.cityId = const Value.absent(),
    this.landmarkId = const Value.absent(),
    this.category = const Value.absent(),
    this.cameraId = const Value.absent(),
    this.cutoutUrl = const Value.absent(),
    this.thumbUrl = const Value.absent(),
    this.localOriginalPath = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.edgeStyle = const Value.absent(),
    this.edgeWidth = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FindingsCompanion.insert({
    required String id,
    this.userId = const Value.absent(),
    required String cityId,
    this.landmarkId = const Value.absent(),
    required CategoryId category,
    required String cameraId,
    required String cutoutUrl,
    this.thumbUrl = const Value.absent(),
    this.localOriginalPath = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.edgeStyle = const Value.absent(),
    this.edgeWidth = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cityId = Value(cityId),
       category = Value(category),
       cameraId = Value(cameraId),
       cutoutUrl = Value(cutoutUrl),
       createdAt = Value(createdAt);
  static Insertable<Finding> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? cityId,
    Expression<String>? landmarkId,
    Expression<String>? category,
    Expression<String>? cameraId,
    Expression<String>? cutoutUrl,
    Expression<String>? thumbUrl,
    Expression<String>? localOriginalPath,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<String>? edgeStyle,
    Expression<String>? edgeWidth,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (cityId != null) 'city_id': cityId,
      if (landmarkId != null) 'landmark_id': landmarkId,
      if (category != null) 'category': category,
      if (cameraId != null) 'camera_id': cameraId,
      if (cutoutUrl != null) 'cutout_url': cutoutUrl,
      if (thumbUrl != null) 'thumb_url': thumbUrl,
      if (localOriginalPath != null) 'local_original_path': localOriginalPath,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (edgeStyle != null) 'edge_style': edgeStyle,
      if (edgeWidth != null) 'edge_width': edgeWidth,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FindingsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<String>? cityId,
    Value<String?>? landmarkId,
    Value<CategoryId>? category,
    Value<String>? cameraId,
    Value<String>? cutoutUrl,
    Value<String?>? thumbUrl,
    Value<String?>? localOriginalPath,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<EdgeStyle>? edgeStyle,
    Value<EdgeWidth>? edgeWidth,
    Value<int>? rowid,
  }) {
    return FindingsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cityId: cityId ?? this.cityId,
      landmarkId: landmarkId ?? this.landmarkId,
      category: category ?? this.category,
      cameraId: cameraId ?? this.cameraId,
      cutoutUrl: cutoutUrl ?? this.cutoutUrl,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      localOriginalPath: localOriginalPath ?? this.localOriginalPath,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      edgeStyle: edgeStyle ?? this.edgeStyle,
      edgeWidth: edgeWidth ?? this.edgeWidth,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String>(cityId.value);
    }
    if (landmarkId.present) {
      map['landmark_id'] = Variable<String>(landmarkId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $FindingsTable.$convertercategory.toSql(category.value),
      );
    }
    if (cameraId.present) {
      map['camera_id'] = Variable<String>(cameraId.value);
    }
    if (cutoutUrl.present) {
      map['cutout_url'] = Variable<String>(cutoutUrl.value);
    }
    if (thumbUrl.present) {
      map['thumb_url'] = Variable<String>(thumbUrl.value);
    }
    if (localOriginalPath.present) {
      map['local_original_path'] = Variable<String>(localOriginalPath.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (edgeStyle.present) {
      map['edge_style'] = Variable<String>(
        $FindingsTable.$converteredgeStyle.toSql(edgeStyle.value),
      );
    }
    if (edgeWidth.present) {
      map['edge_width'] = Variable<String>(
        $FindingsTable.$converteredgeWidth.toSql(edgeWidth.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FindingsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('cityId: $cityId, ')
          ..write('landmarkId: $landmarkId, ')
          ..write('category: $category, ')
          ..write('cameraId: $cameraId, ')
          ..write('cutoutUrl: $cutoutUrl, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('localOriginalPath: $localOriginalPath, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('edgeStyle: $edgeStyle, ')
          ..write('edgeWidth: $edgeWidth, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _themeIdMeta = const VerificationMeta(
    'themeId',
  );
  @override
  late final GeneratedColumn<String> themeId = GeneratedColumn<String>(
    'theme_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String> cover = GeneratedColumn<String>(
    'cover',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, themeId, cover];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<Book> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('theme_id')) {
      context.handle(
        _themeIdMeta,
        themeId.isAcceptableOrUnknown(data['theme_id']!, _themeIdMeta),
      );
    }
    if (data.containsKey('cover')) {
      context.handle(
        _coverMeta,
        cover.isAcceptableOrUnknown(data['cover']!, _coverMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      themeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_id'],
      ),
      cover: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover'],
      ),
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final String id;
  final String? userId;
  final String? themeId;

  /// `Book.cover` sebagai JSON (`templateId`, `title`, `findingIds`,
  /// `decorationSetId`; K-037). Null = sampul bawaan.
  final String? cover;
  const Book({required this.id, this.userId, this.themeId, this.cover});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || themeId != null) {
      map['theme_id'] = Variable<String>(themeId);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String>(cover);
    }
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      themeId: themeId == null && nullToAbsent
          ? const Value.absent()
          : Value(themeId),
      cover: cover == null && nullToAbsent
          ? const Value.absent()
          : Value(cover),
    );
  }

  factory Book.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      themeId: serializer.fromJson<String?>(json['themeId']),
      cover: serializer.fromJson<String?>(json['cover']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'themeId': serializer.toJson<String?>(themeId),
      'cover': serializer.toJson<String?>(cover),
    };
  }

  Book copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    Value<String?> themeId = const Value.absent(),
    Value<String?> cover = const Value.absent(),
  }) => Book(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    themeId: themeId.present ? themeId.value : this.themeId,
    cover: cover.present ? cover.value : this.cover,
  );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      themeId: data.themeId.present ? data.themeId.value : this.themeId,
      cover: data.cover.present ? data.cover.value : this.cover,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('themeId: $themeId, ')
          ..write('cover: $cover')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, themeId, cover);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.themeId == this.themeId &&
          other.cover == this.cover);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<String?> themeId;
  final Value<String?> cover;
  final Value<int> rowid;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.themeId = const Value.absent(),
    this.cover = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required String id,
    this.userId = const Value.absent(),
    this.themeId = const Value.absent(),
    this.cover = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Book> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? themeId,
    Expression<String>? cover,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (themeId != null) 'theme_id': themeId,
      if (cover != null) 'cover': cover,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<String?>? themeId,
    Value<String?>? cover,
    Value<int>? rowid,
  }) {
    return BooksCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      themeId: themeId ?? this.themeId,
      cover: cover ?? this.cover,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (themeId.present) {
      map['theme_id'] = Variable<String>(themeId.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('themeId: $themeId, ')
          ..write('cover: $cover, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<String> bookId = GeneratedColumn<String>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES books (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String> cityId = GeneratedColumn<String>(
    'city_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, bookId, cityId, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chapter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['sort_order']!, _orderMeta),
      );
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {bookId, cityId},
  ];
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_id'],
      )!,
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_id'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final String id;
  final String bookId;
  final String cityId;
  final int order;
  const Chapter({
    required this.id,
    required this.bookId,
    required this.cityId,
    required this.order,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['book_id'] = Variable<String>(bookId);
    map['city_id'] = Variable<String>(cityId);
    map['sort_order'] = Variable<int>(order);
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      bookId: Value(bookId),
      cityId: Value(cityId),
      order: Value(order),
    );
  }

  factory Chapter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<String>(json['id']),
      bookId: serializer.fromJson<String>(json['bookId']),
      cityId: serializer.fromJson<String>(json['cityId']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bookId': serializer.toJson<String>(bookId),
      'cityId': serializer.toJson<String>(cityId),
      'order': serializer.toJson<int>(order),
    };
  }

  Chapter copyWith({String? id, String? bookId, String? cityId, int? order}) =>
      Chapter(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        cityId: cityId ?? this.cityId,
        order: order ?? this.order,
      );
  Chapter copyWithCompanion(ChaptersCompanion data) {
    return Chapter(
      id: data.id.present ? data.id.value : this.id,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      order: data.order.present ? data.order.value : this.order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('cityId: $cityId, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookId, cityId, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.cityId == this.cityId &&
          other.order == this.order);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<String> id;
  final Value<String> bookId;
  final Value<String> cityId;
  final Value<int> order;
  final Value<int> rowid;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.cityId = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChaptersCompanion.insert({
    required String id,
    required String bookId,
    required String cityId,
    required int order,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       bookId = Value(bookId),
       cityId = Value(cityId),
       order = Value(order);
  static Insertable<Chapter> custom({
    Expression<String>? id,
    Expression<String>? bookId,
    Expression<String>? cityId,
    Expression<int>? order,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (cityId != null) 'city_id': cityId,
      if (order != null) 'sort_order': order,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChaptersCompanion copyWith({
    Value<String>? id,
    Value<String>? bookId,
    Value<String>? cityId,
    Value<int>? order,
    Value<int>? rowid,
  }) {
    return ChaptersCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      cityId: cityId ?? this.cityId,
      order: order ?? this.order,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<String>(bookId.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String>(cityId.value);
    }
    if (order.present) {
      map['sort_order'] = Variable<int>(order.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('cityId: $cityId, ')
          ..write('order: $order, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PagesTable extends Pages with TableInfo<$PagesTable, Page> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chapters (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<PageKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PageKind>($PagesTable.$converterkind);
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PaperStyle, String> paperStyle =
      GeneratedColumn<String>(
        'paper_style',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(PaperStyle.plain.name),
      ).withConverter<PaperStyle>($PagesTable.$converterpaperStyle);
  static const VerificationMeta _stylePresetIdMeta = const VerificationMeta(
    'stylePresetId',
  );
  @override
  late final GeneratedColumn<String> stylePresetId = GeneratedColumn<String>(
    'style_preset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    chapterId,
    kind,
    templateId,
    order,
    paperStyle,
    stylePresetId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Page> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['sort_order']!, _orderMeta),
      );
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('style_preset_id')) {
      context.handle(
        _stylePresetIdMeta,
        stylePresetId.isAcceptableOrUnknown(
          data['style_preset_id']!,
          _stylePresetIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Page map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Page(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      kind: $PagesTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      ),
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      paperStyle: $PagesTable.$converterpaperStyle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}paper_style'],
        )!,
      ),
      stylePresetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}style_preset_id'],
      ),
    );
  }

  @override
  $PagesTable createAlias(String alias) {
    return $PagesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PageKind, String, String> $converterkind =
      const EnumNameConverter<PageKind>(PageKind.values);
  static JsonTypeConverter2<PaperStyle, String, String> $converterpaperStyle =
      const EnumNameConverter<PaperStyle>(PaperStyle.values);
}

class Page extends DataClass implements Insertable<Page> {
  final String id;
  final String chapterId;
  final PageKind kind;
  final String? templateId;
  final int order;
  final PaperStyle paperStyle;
  final String? stylePresetId;
  const Page({
    required this.id,
    required this.chapterId,
    required this.kind,
    this.templateId,
    required this.order,
    required this.paperStyle,
    this.stylePresetId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['chapter_id'] = Variable<String>(chapterId);
    {
      map['kind'] = Variable<String>($PagesTable.$converterkind.toSql(kind));
    }
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    map['sort_order'] = Variable<int>(order);
    {
      map['paper_style'] = Variable<String>(
        $PagesTable.$converterpaperStyle.toSql(paperStyle),
      );
    }
    if (!nullToAbsent || stylePresetId != null) {
      map['style_preset_id'] = Variable<String>(stylePresetId);
    }
    return map;
  }

  PagesCompanion toCompanion(bool nullToAbsent) {
    return PagesCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      kind: Value(kind),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      order: Value(order),
      paperStyle: Value(paperStyle),
      stylePresetId: stylePresetId == null && nullToAbsent
          ? const Value.absent()
          : Value(stylePresetId),
    );
  }

  factory Page.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Page(
      id: serializer.fromJson<String>(json['id']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      kind: $PagesTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      templateId: serializer.fromJson<String?>(json['templateId']),
      order: serializer.fromJson<int>(json['order']),
      paperStyle: $PagesTable.$converterpaperStyle.fromJson(
        serializer.fromJson<String>(json['paperStyle']),
      ),
      stylePresetId: serializer.fromJson<String?>(json['stylePresetId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'chapterId': serializer.toJson<String>(chapterId),
      'kind': serializer.toJson<String>(
        $PagesTable.$converterkind.toJson(kind),
      ),
      'templateId': serializer.toJson<String?>(templateId),
      'order': serializer.toJson<int>(order),
      'paperStyle': serializer.toJson<String>(
        $PagesTable.$converterpaperStyle.toJson(paperStyle),
      ),
      'stylePresetId': serializer.toJson<String?>(stylePresetId),
    };
  }

  Page copyWith({
    String? id,
    String? chapterId,
    PageKind? kind,
    Value<String?> templateId = const Value.absent(),
    int? order,
    PaperStyle? paperStyle,
    Value<String?> stylePresetId = const Value.absent(),
  }) => Page(
    id: id ?? this.id,
    chapterId: chapterId ?? this.chapterId,
    kind: kind ?? this.kind,
    templateId: templateId.present ? templateId.value : this.templateId,
    order: order ?? this.order,
    paperStyle: paperStyle ?? this.paperStyle,
    stylePresetId: stylePresetId.present
        ? stylePresetId.value
        : this.stylePresetId,
  );
  Page copyWithCompanion(PagesCompanion data) {
    return Page(
      id: data.id.present ? data.id.value : this.id,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      kind: data.kind.present ? data.kind.value : this.kind,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      order: data.order.present ? data.order.value : this.order,
      paperStyle: data.paperStyle.present
          ? data.paperStyle.value
          : this.paperStyle,
      stylePresetId: data.stylePresetId.present
          ? data.stylePresetId.value
          : this.stylePresetId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Page(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('kind: $kind, ')
          ..write('templateId: $templateId, ')
          ..write('order: $order, ')
          ..write('paperStyle: $paperStyle, ')
          ..write('stylePresetId: $stylePresetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    chapterId,
    kind,
    templateId,
    order,
    paperStyle,
    stylePresetId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Page &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.kind == this.kind &&
          other.templateId == this.templateId &&
          other.order == this.order &&
          other.paperStyle == this.paperStyle &&
          other.stylePresetId == this.stylePresetId);
}

class PagesCompanion extends UpdateCompanion<Page> {
  final Value<String> id;
  final Value<String> chapterId;
  final Value<PageKind> kind;
  final Value<String?> templateId;
  final Value<int> order;
  final Value<PaperStyle> paperStyle;
  final Value<String?> stylePresetId;
  final Value<int> rowid;
  const PagesCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.kind = const Value.absent(),
    this.templateId = const Value.absent(),
    this.order = const Value.absent(),
    this.paperStyle = const Value.absent(),
    this.stylePresetId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PagesCompanion.insert({
    required String id,
    required String chapterId,
    required PageKind kind,
    this.templateId = const Value.absent(),
    required int order,
    this.paperStyle = const Value.absent(),
    this.stylePresetId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       chapterId = Value(chapterId),
       kind = Value(kind),
       order = Value(order);
  static Insertable<Page> custom({
    Expression<String>? id,
    Expression<String>? chapterId,
    Expression<String>? kind,
    Expression<String>? templateId,
    Expression<int>? order,
    Expression<String>? paperStyle,
    Expression<String>? stylePresetId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (kind != null) 'kind': kind,
      if (templateId != null) 'template_id': templateId,
      if (order != null) 'sort_order': order,
      if (paperStyle != null) 'paper_style': paperStyle,
      if (stylePresetId != null) 'style_preset_id': stylePresetId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PagesCompanion copyWith({
    Value<String>? id,
    Value<String>? chapterId,
    Value<PageKind>? kind,
    Value<String?>? templateId,
    Value<int>? order,
    Value<PaperStyle>? paperStyle,
    Value<String?>? stylePresetId,
    Value<int>? rowid,
  }) {
    return PagesCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      kind: kind ?? this.kind,
      templateId: templateId ?? this.templateId,
      order: order ?? this.order,
      paperStyle: paperStyle ?? this.paperStyle,
      stylePresetId: stylePresetId ?? this.stylePresetId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $PagesTable.$converterkind.toSql(kind.value),
      );
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (order.present) {
      map['sort_order'] = Variable<int>(order.value);
    }
    if (paperStyle.present) {
      map['paper_style'] = Variable<String>(
        $PagesTable.$converterpaperStyle.toSql(paperStyle.value),
      );
    }
    if (stylePresetId.present) {
      map['style_preset_id'] = Variable<String>(stylePresetId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagesCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('kind: $kind, ')
          ..write('templateId: $templateId, ')
          ..write('order: $order, ')
          ..write('paperStyle: $paperStyle, ')
          ..write('stylePresetId: $stylePresetId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlacementsTable extends Placements
    with TableInfo<$PlacementsTable, Placement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _findingIdMeta = const VerificationMeta(
    'findingId',
  );
  @override
  late final GeneratedColumn<String> findingId = GeneratedColumn<String>(
    'finding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES findings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pageIdMeta = const VerificationMeta('pageId');
  @override
  late final GeneratedColumn<String> pageId = GeneratedColumn<String>(
    'page_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pages (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
    'x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
    'y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scaleMeta = const VerificationMeta('scale');
  @override
  late final GeneratedColumn<double> scale = GeneratedColumn<double>(
    'scale',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _rotationMeta = const VerificationMeta(
    'rotation',
  );
  @override
  late final GeneratedColumn<double> rotation = GeneratedColumn<double>(
    'rotation',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _zMeta = const VerificationMeta('z');
  @override
  late final GeneratedColumn<int> z = GeneratedColumn<int>(
    'z',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isManuallyArrangedMeta =
      const VerificationMeta('isManuallyArranged');
  @override
  late final GeneratedColumn<bool> isManuallyArranged = GeneratedColumn<bool>(
    'is_manually_arranged',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_manually_arranged" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TapePosition, String>
  tapePosition = GeneratedColumn<String>(
    'tape_position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(TapePosition.twoCorners.name),
  ).withConverter<TapePosition>($PlacementsTable.$convertertapePosition);
  @override
  late final GeneratedColumnWithTypeConverter<TapePattern, String> tapePattern =
      GeneratedColumn<String>(
        'tape_pattern',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(TapePattern.plain.name),
      ).withConverter<TapePattern>($PlacementsTable.$convertertapePattern);
  @override
  late final GeneratedColumnWithTypeConverter<NoteInk, String> noteInk =
      GeneratedColumn<String>(
        'note_ink',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(NoteInk.ink.name),
      ).withConverter<NoteInk>($PlacementsTable.$converternoteInk);
  static const VerificationMeta _hasFrameMeta = const VerificationMeta(
    'hasFrame',
  );
  @override
  late final GeneratedColumn<bool> hasFrame = GeneratedColumn<bool>(
    'has_frame',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_frame" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    findingId,
    pageId,
    x,
    y,
    scale,
    rotation,
    z,
    isManuallyArranged,
    tapePosition,
    tapePattern,
    noteInk,
    hasFrame,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'placements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Placement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('finding_id')) {
      context.handle(
        _findingIdMeta,
        findingId.isAcceptableOrUnknown(data['finding_id']!, _findingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_findingIdMeta);
    }
    if (data.containsKey('page_id')) {
      context.handle(
        _pageIdMeta,
        pageId.isAcceptableOrUnknown(data['page_id']!, _pageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pageIdMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('scale')) {
      context.handle(
        _scaleMeta,
        scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta),
      );
    }
    if (data.containsKey('rotation')) {
      context.handle(
        _rotationMeta,
        rotation.isAcceptableOrUnknown(data['rotation']!, _rotationMeta),
      );
    }
    if (data.containsKey('z')) {
      context.handle(_zMeta, z.isAcceptableOrUnknown(data['z']!, _zMeta));
    }
    if (data.containsKey('is_manually_arranged')) {
      context.handle(
        _isManuallyArrangedMeta,
        isManuallyArranged.isAcceptableOrUnknown(
          data['is_manually_arranged']!,
          _isManuallyArrangedMeta,
        ),
      );
    }
    if (data.containsKey('has_frame')) {
      context.handle(
        _hasFrameMeta,
        hasFrame.isAcceptableOrUnknown(data['has_frame']!, _hasFrameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {findingId};
  @override
  Placement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Placement(
      findingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finding_id'],
      )!,
      pageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}page_id'],
      )!,
      x: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}x'],
      )!,
      y: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}y'],
      )!,
      scale: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}scale'],
      )!,
      rotation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rotation'],
      )!,
      z: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}z'],
      )!,
      isManuallyArranged: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_manually_arranged'],
      )!,
      tapePosition: $PlacementsTable.$convertertapePosition.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tape_position'],
        )!,
      ),
      tapePattern: $PlacementsTable.$convertertapePattern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tape_pattern'],
        )!,
      ),
      noteInk: $PlacementsTable.$converternoteInk.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}note_ink'],
        )!,
      ),
      hasFrame: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_frame'],
      )!,
    );
  }

  @override
  $PlacementsTable createAlias(String alias) {
    return $PlacementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TapePosition, String, String>
  $convertertapePosition = const EnumNameConverter<TapePosition>(
    TapePosition.values,
  );
  static JsonTypeConverter2<TapePattern, String, String> $convertertapePattern =
      const EnumNameConverter<TapePattern>(TapePattern.values);
  static JsonTypeConverter2<NoteInk, String, String> $converternoteInk =
      const EnumNameConverter<NoteInk>(NoteInk.values);
}

class Placement extends DataClass implements Insertable<Placement> {
  final String findingId;
  final String pageId;
  final double x;
  final double y;
  final double scale;

  /// Derajat.
  final double rotation;
  final int z;

  /// Bila true, sistem tidak pernah menata ulang halaman ini (K-005).
  final bool isManuallyArranged;
  final TapePosition tapePosition;
  final TapePattern tapePattern;
  final NoteInk noteInk;
  final bool hasFrame;
  const Placement({
    required this.findingId,
    required this.pageId,
    required this.x,
    required this.y,
    required this.scale,
    required this.rotation,
    required this.z,
    required this.isManuallyArranged,
    required this.tapePosition,
    required this.tapePattern,
    required this.noteInk,
    required this.hasFrame,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['finding_id'] = Variable<String>(findingId);
    map['page_id'] = Variable<String>(pageId);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    map['scale'] = Variable<double>(scale);
    map['rotation'] = Variable<double>(rotation);
    map['z'] = Variable<int>(z);
    map['is_manually_arranged'] = Variable<bool>(isManuallyArranged);
    {
      map['tape_position'] = Variable<String>(
        $PlacementsTable.$convertertapePosition.toSql(tapePosition),
      );
    }
    {
      map['tape_pattern'] = Variable<String>(
        $PlacementsTable.$convertertapePattern.toSql(tapePattern),
      );
    }
    {
      map['note_ink'] = Variable<String>(
        $PlacementsTable.$converternoteInk.toSql(noteInk),
      );
    }
    map['has_frame'] = Variable<bool>(hasFrame);
    return map;
  }

  PlacementsCompanion toCompanion(bool nullToAbsent) {
    return PlacementsCompanion(
      findingId: Value(findingId),
      pageId: Value(pageId),
      x: Value(x),
      y: Value(y),
      scale: Value(scale),
      rotation: Value(rotation),
      z: Value(z),
      isManuallyArranged: Value(isManuallyArranged),
      tapePosition: Value(tapePosition),
      tapePattern: Value(tapePattern),
      noteInk: Value(noteInk),
      hasFrame: Value(hasFrame),
    );
  }

  factory Placement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Placement(
      findingId: serializer.fromJson<String>(json['findingId']),
      pageId: serializer.fromJson<String>(json['pageId']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      scale: serializer.fromJson<double>(json['scale']),
      rotation: serializer.fromJson<double>(json['rotation']),
      z: serializer.fromJson<int>(json['z']),
      isManuallyArranged: serializer.fromJson<bool>(json['isManuallyArranged']),
      tapePosition: $PlacementsTable.$convertertapePosition.fromJson(
        serializer.fromJson<String>(json['tapePosition']),
      ),
      tapePattern: $PlacementsTable.$convertertapePattern.fromJson(
        serializer.fromJson<String>(json['tapePattern']),
      ),
      noteInk: $PlacementsTable.$converternoteInk.fromJson(
        serializer.fromJson<String>(json['noteInk']),
      ),
      hasFrame: serializer.fromJson<bool>(json['hasFrame']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'findingId': serializer.toJson<String>(findingId),
      'pageId': serializer.toJson<String>(pageId),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'scale': serializer.toJson<double>(scale),
      'rotation': serializer.toJson<double>(rotation),
      'z': serializer.toJson<int>(z),
      'isManuallyArranged': serializer.toJson<bool>(isManuallyArranged),
      'tapePosition': serializer.toJson<String>(
        $PlacementsTable.$convertertapePosition.toJson(tapePosition),
      ),
      'tapePattern': serializer.toJson<String>(
        $PlacementsTable.$convertertapePattern.toJson(tapePattern),
      ),
      'noteInk': serializer.toJson<String>(
        $PlacementsTable.$converternoteInk.toJson(noteInk),
      ),
      'hasFrame': serializer.toJson<bool>(hasFrame),
    };
  }

  Placement copyWith({
    String? findingId,
    String? pageId,
    double? x,
    double? y,
    double? scale,
    double? rotation,
    int? z,
    bool? isManuallyArranged,
    TapePosition? tapePosition,
    TapePattern? tapePattern,
    NoteInk? noteInk,
    bool? hasFrame,
  }) => Placement(
    findingId: findingId ?? this.findingId,
    pageId: pageId ?? this.pageId,
    x: x ?? this.x,
    y: y ?? this.y,
    scale: scale ?? this.scale,
    rotation: rotation ?? this.rotation,
    z: z ?? this.z,
    isManuallyArranged: isManuallyArranged ?? this.isManuallyArranged,
    tapePosition: tapePosition ?? this.tapePosition,
    tapePattern: tapePattern ?? this.tapePattern,
    noteInk: noteInk ?? this.noteInk,
    hasFrame: hasFrame ?? this.hasFrame,
  );
  Placement copyWithCompanion(PlacementsCompanion data) {
    return Placement(
      findingId: data.findingId.present ? data.findingId.value : this.findingId,
      pageId: data.pageId.present ? data.pageId.value : this.pageId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      scale: data.scale.present ? data.scale.value : this.scale,
      rotation: data.rotation.present ? data.rotation.value : this.rotation,
      z: data.z.present ? data.z.value : this.z,
      isManuallyArranged: data.isManuallyArranged.present
          ? data.isManuallyArranged.value
          : this.isManuallyArranged,
      tapePosition: data.tapePosition.present
          ? data.tapePosition.value
          : this.tapePosition,
      tapePattern: data.tapePattern.present
          ? data.tapePattern.value
          : this.tapePattern,
      noteInk: data.noteInk.present ? data.noteInk.value : this.noteInk,
      hasFrame: data.hasFrame.present ? data.hasFrame.value : this.hasFrame,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Placement(')
          ..write('findingId: $findingId, ')
          ..write('pageId: $pageId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('scale: $scale, ')
          ..write('rotation: $rotation, ')
          ..write('z: $z, ')
          ..write('isManuallyArranged: $isManuallyArranged, ')
          ..write('tapePosition: $tapePosition, ')
          ..write('tapePattern: $tapePattern, ')
          ..write('noteInk: $noteInk, ')
          ..write('hasFrame: $hasFrame')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    findingId,
    pageId,
    x,
    y,
    scale,
    rotation,
    z,
    isManuallyArranged,
    tapePosition,
    tapePattern,
    noteInk,
    hasFrame,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Placement &&
          other.findingId == this.findingId &&
          other.pageId == this.pageId &&
          other.x == this.x &&
          other.y == this.y &&
          other.scale == this.scale &&
          other.rotation == this.rotation &&
          other.z == this.z &&
          other.isManuallyArranged == this.isManuallyArranged &&
          other.tapePosition == this.tapePosition &&
          other.tapePattern == this.tapePattern &&
          other.noteInk == this.noteInk &&
          other.hasFrame == this.hasFrame);
}

class PlacementsCompanion extends UpdateCompanion<Placement> {
  final Value<String> findingId;
  final Value<String> pageId;
  final Value<double> x;
  final Value<double> y;
  final Value<double> scale;
  final Value<double> rotation;
  final Value<int> z;
  final Value<bool> isManuallyArranged;
  final Value<TapePosition> tapePosition;
  final Value<TapePattern> tapePattern;
  final Value<NoteInk> noteInk;
  final Value<bool> hasFrame;
  final Value<int> rowid;
  const PlacementsCompanion({
    this.findingId = const Value.absent(),
    this.pageId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.scale = const Value.absent(),
    this.rotation = const Value.absent(),
    this.z = const Value.absent(),
    this.isManuallyArranged = const Value.absent(),
    this.tapePosition = const Value.absent(),
    this.tapePattern = const Value.absent(),
    this.noteInk = const Value.absent(),
    this.hasFrame = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlacementsCompanion.insert({
    required String findingId,
    required String pageId,
    required double x,
    required double y,
    this.scale = const Value.absent(),
    this.rotation = const Value.absent(),
    this.z = const Value.absent(),
    this.isManuallyArranged = const Value.absent(),
    this.tapePosition = const Value.absent(),
    this.tapePattern = const Value.absent(),
    this.noteInk = const Value.absent(),
    this.hasFrame = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : findingId = Value(findingId),
       pageId = Value(pageId),
       x = Value(x),
       y = Value(y);
  static Insertable<Placement> custom({
    Expression<String>? findingId,
    Expression<String>? pageId,
    Expression<double>? x,
    Expression<double>? y,
    Expression<double>? scale,
    Expression<double>? rotation,
    Expression<int>? z,
    Expression<bool>? isManuallyArranged,
    Expression<String>? tapePosition,
    Expression<String>? tapePattern,
    Expression<String>? noteInk,
    Expression<bool>? hasFrame,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (findingId != null) 'finding_id': findingId,
      if (pageId != null) 'page_id': pageId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (scale != null) 'scale': scale,
      if (rotation != null) 'rotation': rotation,
      if (z != null) 'z': z,
      if (isManuallyArranged != null)
        'is_manually_arranged': isManuallyArranged,
      if (tapePosition != null) 'tape_position': tapePosition,
      if (tapePattern != null) 'tape_pattern': tapePattern,
      if (noteInk != null) 'note_ink': noteInk,
      if (hasFrame != null) 'has_frame': hasFrame,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlacementsCompanion copyWith({
    Value<String>? findingId,
    Value<String>? pageId,
    Value<double>? x,
    Value<double>? y,
    Value<double>? scale,
    Value<double>? rotation,
    Value<int>? z,
    Value<bool>? isManuallyArranged,
    Value<TapePosition>? tapePosition,
    Value<TapePattern>? tapePattern,
    Value<NoteInk>? noteInk,
    Value<bool>? hasFrame,
    Value<int>? rowid,
  }) {
    return PlacementsCompanion(
      findingId: findingId ?? this.findingId,
      pageId: pageId ?? this.pageId,
      x: x ?? this.x,
      y: y ?? this.y,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      z: z ?? this.z,
      isManuallyArranged: isManuallyArranged ?? this.isManuallyArranged,
      tapePosition: tapePosition ?? this.tapePosition,
      tapePattern: tapePattern ?? this.tapePattern,
      noteInk: noteInk ?? this.noteInk,
      hasFrame: hasFrame ?? this.hasFrame,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (findingId.present) {
      map['finding_id'] = Variable<String>(findingId.value);
    }
    if (pageId.present) {
      map['page_id'] = Variable<String>(pageId.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (scale.present) {
      map['scale'] = Variable<double>(scale.value);
    }
    if (rotation.present) {
      map['rotation'] = Variable<double>(rotation.value);
    }
    if (z.present) {
      map['z'] = Variable<int>(z.value);
    }
    if (isManuallyArranged.present) {
      map['is_manually_arranged'] = Variable<bool>(isManuallyArranged.value);
    }
    if (tapePosition.present) {
      map['tape_position'] = Variable<String>(
        $PlacementsTable.$convertertapePosition.toSql(tapePosition.value),
      );
    }
    if (tapePattern.present) {
      map['tape_pattern'] = Variable<String>(
        $PlacementsTable.$convertertapePattern.toSql(tapePattern.value),
      );
    }
    if (noteInk.present) {
      map['note_ink'] = Variable<String>(
        $PlacementsTable.$converternoteInk.toSql(noteInk.value),
      );
    }
    if (hasFrame.present) {
      map['has_frame'] = Variable<bool>(hasFrame.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacementsCompanion(')
          ..write('findingId: $findingId, ')
          ..write('pageId: $pageId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('scale: $scale, ')
          ..write('rotation: $rotation, ')
          ..write('z: $z, ')
          ..write('isManuallyArranged: $isManuallyArranged, ')
          ..write('tapePosition: $tapePosition, ')
          ..write('tapePattern: $tapePattern, ')
          ..write('noteInk: $noteInk, ')
          ..write('hasFrame: $hasFrame, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FindingsTable findings = $FindingsTable(this);
  late final $BooksTable books = $BooksTable(this);
  late final $ChaptersTable chapters = $ChaptersTable(this);
  late final $PagesTable pages = $PagesTable(this);
  late final $PlacementsTable placements = $PlacementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    findings,
    books,
    chapters,
    pages,
    placements,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'books',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chapters', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'chapters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('pages', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'findings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('placements', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pages',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('placements', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$FindingsTableCreateCompanionBuilder = FindingsCompanion Function({
  required String id,
  Value<String?> userId,
  required String cityId,
  Value<String?> landmarkId,
  required CategoryId category,
  required String cameraId,
  required String cutoutUrl,
  Value<String?> thumbUrl,
  Value<String?> localOriginalPath,
  Value<String?> note,
  required DateTime createdAt,
  Value<EdgeStyle> edgeStyle,
  Value<EdgeWidth> edgeWidth,
  Value<int> rowid,
});
typedef $$FindingsTableUpdateCompanionBuilder = FindingsCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<String> cityId,
  Value<String?> landmarkId,
  Value<CategoryId> category,
  Value<String> cameraId,
  Value<String> cutoutUrl,
  Value<String?> thumbUrl,
  Value<String?> localOriginalPath,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<EdgeStyle> edgeStyle,
  Value<EdgeWidth> edgeWidth,
  Value<int> rowid,
});

final class $$FindingsTableReferences
    extends BaseReferences<_$AppDatabase, $FindingsTable, Finding> {
  $$FindingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlacementsTable, List<Placement>>
  _placementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.placements,
    aliasName: 'findings__id__placements__finding_id',
  );

  $$PlacementsTableProcessedTableManager get placementsRefs {
    final manager = $$PlacementsTableTableManager(
      $_db,
      $_db.placements,
    ).filter((f) => f.findingId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_placementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FindingsTableFilterComposer
    extends Composer<_$AppDatabase, $FindingsTable> {
  $$FindingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get landmarkId => $composableBuilder(
    column: $table.landmarkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoryId, CategoryId, String> get category =>
      $composableBuilder(
        column: $table.category,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get cameraId => $composableBuilder(
    column: $table.cameraId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cutoutUrl => $composableBuilder(
    column: $table.cutoutUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbUrl => $composableBuilder(
    column: $table.thumbUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localOriginalPath => $composableBuilder(
    column: $table.localOriginalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EdgeStyle, EdgeStyle, String> get edgeStyle =>
      $composableBuilder(
        column: $table.edgeStyle,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<EdgeWidth, EdgeWidth, String> get edgeWidth =>
      $composableBuilder(
        column: $table.edgeWidth,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  Expression<bool> placementsRefs(
    Expression<bool> Function($$PlacementsTableFilterComposer f) f,
  ) {
    final $$PlacementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placements,
      getReferencedColumn: (t) => t.findingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacementsTableFilterComposer(
            $db: $db,
            $table: $db.placements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FindingsTableOrderingComposer
    extends Composer<_$AppDatabase, $FindingsTable> {
  $$FindingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get landmarkId => $composableBuilder(
    column: $table.landmarkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cameraId => $composableBuilder(
    column: $table.cameraId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cutoutUrl => $composableBuilder(
    column: $table.cutoutUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbUrl => $composableBuilder(
    column: $table.thumbUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localOriginalPath => $composableBuilder(
    column: $table.localOriginalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get edgeStyle => $composableBuilder(
    column: $table.edgeStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get edgeWidth => $composableBuilder(
    column: $table.edgeWidth,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FindingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FindingsTable> {
  $$FindingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<String> get landmarkId => $composableBuilder(
    column: $table.landmarkId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CategoryId, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get cameraId =>
      $composableBuilder(column: $table.cameraId, builder: (column) => column);

  GeneratedColumn<String> get cutoutUrl =>
      $composableBuilder(column: $table.cutoutUrl, builder: (column) => column);

  GeneratedColumn<String> get thumbUrl =>
      $composableBuilder(column: $table.thumbUrl, builder: (column) => column);

  GeneratedColumn<String> get localOriginalPath => $composableBuilder(
    column: $table.localOriginalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EdgeStyle, String> get edgeStyle =>
      $composableBuilder(column: $table.edgeStyle, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EdgeWidth, String> get edgeWidth =>
      $composableBuilder(column: $table.edgeWidth, builder: (column) => column);

  Expression<T> placementsRefs<T extends Object>(
    Expression<T> Function($$PlacementsTableAnnotationComposer a) f,
  ) {
    final $$PlacementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placements,
      getReferencedColumn: (t) => t.findingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacementsTableAnnotationComposer(
            $db: $db,
            $table: $db.placements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FindingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FindingsTable,
          Finding,
          $$FindingsTableFilterComposer,
          $$FindingsTableOrderingComposer,
          $$FindingsTableAnnotationComposer,
          $$FindingsTableCreateCompanionBuilder,
          $$FindingsTableUpdateCompanionBuilder,
          (Finding, $$FindingsTableReferences),
          Finding,
          PrefetchHooks Function({bool placementsRefs})
        > {
  $$FindingsTableTableManager(_$AppDatabase db, $FindingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FindingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FindingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FindingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> cityId = const Value.absent(),
                Value<String?> landmarkId = const Value.absent(),
                Value<CategoryId> category = const Value.absent(),
                Value<String> cameraId = const Value.absent(),
                Value<String> cutoutUrl = const Value.absent(),
                Value<String?> thumbUrl = const Value.absent(),
                Value<String?> localOriginalPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<EdgeStyle> edgeStyle = const Value.absent(),
                Value<EdgeWidth> edgeWidth = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FindingsCompanion(
                id: id,
                userId: userId,
                cityId: cityId,
                landmarkId: landmarkId,
                category: category,
                cameraId: cameraId,
                cutoutUrl: cutoutUrl,
                thumbUrl: thumbUrl,
                localOriginalPath: localOriginalPath,
                note: note,
                createdAt: createdAt,
                edgeStyle: edgeStyle,
                edgeWidth: edgeWidth,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> userId = const Value.absent(),
                required String cityId,
                Value<String?> landmarkId = const Value.absent(),
                required CategoryId category,
                required String cameraId,
                required String cutoutUrl,
                Value<String?> thumbUrl = const Value.absent(),
                Value<String?> localOriginalPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<EdgeStyle> edgeStyle = const Value.absent(),
                Value<EdgeWidth> edgeWidth = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FindingsCompanion.insert(
                id: id,
                userId: userId,
                cityId: cityId,
                landmarkId: landmarkId,
                category: category,
                cameraId: cameraId,
                cutoutUrl: cutoutUrl,
                thumbUrl: thumbUrl,
                localOriginalPath: localOriginalPath,
                note: note,
                createdAt: createdAt,
                edgeStyle: edgeStyle,
                edgeWidth: edgeWidth,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FindingsTable, Finding>(table),
                  $$FindingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (placementsRefs) db.placements],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (placementsRefs)
                    await $_getPrefetchedDataByColumns<
                      Finding,
                      $FindingsTable,
                      Placement,
                      $PlacementsTable
                    >(
                      currentTable: table,
                      referencedTable: $$FindingsTableReferences
                          ._placementsRefsTable(db),
                      managerFromTypedResult: (p0) => $$FindingsTableReferences(
                        db,
                        table,
                        p0,
                      ).placementsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'finding_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FindingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FindingsTable,
      Finding,
      $$FindingsTableFilterComposer,
      $$FindingsTableOrderingComposer,
      $$FindingsTableAnnotationComposer,
      $$FindingsTableCreateCompanionBuilder,
      $$FindingsTableUpdateCompanionBuilder,
      (Finding, $$FindingsTableReferences),
      Finding,
      PrefetchHooks Function({bool placementsRefs})
    >;
typedef $$BooksTableCreateCompanionBuilder = BooksCompanion Function({
  required String id,
  Value<String?> userId,
  Value<String?> themeId,
  Value<String?> cover,
  Value<int> rowid,
});
typedef $$BooksTableUpdateCompanionBuilder = BooksCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<String?> themeId,
  Value<String?> cover,
  Value<int> rowid,
});

final class $$BooksTableReferences
    extends BaseReferences<_$AppDatabase, $BooksTable, Book> {
  $$BooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChaptersTable, List<Chapter>> _chaptersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.chapters,
    aliasName: 'books__id__chapters__book_id',
  );

  $$ChaptersTableProcessedTableManager get chaptersRefs {
    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.bookId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_chaptersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeId => $composableBuilder(
    column: $table.themeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cover => $composableBuilder(
    column: $table.cover,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> chaptersRefs(
    Expression<bool> Function($$ChaptersTableFilterComposer f) f,
  ) {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeId => $composableBuilder(
    column: $table.themeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cover => $composableBuilder(
    column: $table.cover,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get themeId =>
      $composableBuilder(column: $table.themeId, builder: (column) => column);

  GeneratedColumn<String> get cover =>
      $composableBuilder(column: $table.cover, builder: (column) => column);

  Expression<T> chaptersRefs<T extends Object>(
    Expression<T> Function($$ChaptersTableAnnotationComposer a) f,
  ) {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          Book,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (Book, $$BooksTableReferences),
          Book,
          PrefetchHooks Function({bool chaptersRefs})
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> themeId = const Value.absent(),
                Value<String?> cover = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion(
                id: id,
                userId: userId,
                themeId: themeId,
                cover: cover,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> userId = const Value.absent(),
                Value<String?> themeId = const Value.absent(),
                Value<String?> cover = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion.insert(
                id: id,
                userId: userId,
                themeId: themeId,
                cover: cover,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BooksTable, Book>(table),
                  $$BooksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chaptersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (chaptersRefs) db.chapters],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (chaptersRefs)
                    await $_getPrefetchedDataByColumns<
                      Book,
                      $BooksTable,
                      Chapter,
                      $ChaptersTable
                    >(
                      currentTable: table,
                      referencedTable: $$BooksTableReferences
                          ._chaptersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BooksTableReferences(db, table, p0).chaptersRefs,
                      currentColumn: 'id',
                      referencedColumn: 'book_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      Book,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (Book, $$BooksTableReferences),
      Book,
      PrefetchHooks Function({bool chaptersRefs})
    >;
typedef $$ChaptersTableCreateCompanionBuilder = ChaptersCompanion Function({
  required String id,
  required String bookId,
  required String cityId,
  required int order,
  Value<int> rowid,
});
typedef $$ChaptersTableUpdateCompanionBuilder = ChaptersCompanion Function({
  Value<String> id,
  Value<String> bookId,
  Value<String> cityId,
  Value<int> order,
  Value<int> rowid,
});

final class $$ChaptersTableReferences
    extends BaseReferences<_$AppDatabase, $ChaptersTable, Chapter> {
  $$ChaptersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BooksTable _bookIdTable(_$AppDatabase db) =>
      db.books.createAlias('chapters__book_id__books__id');

  $$BooksTableProcessedTableManager get bookId {
    final $_column = $_itemColumn<String>('book_id')!;

    final manager = $$BooksTableTableManager(
      $_db,
      $_db.books,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PagesTable, List<Page>> _pagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pages,
    aliasName: 'chapters__id__pages__chapter_id',
  );

  $$PagesTableProcessedTableManager get pagesRefs {
    final manager = $$PagesTableTableManager(
      $_db,
      $_db.pages,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_pagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  $$BooksTableFilterComposer get bookId {
    final $$BooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.books,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BooksTableFilterComposer(
            $db: $db,
            $table: $db.books,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> pagesRefs(
    Expression<bool> Function($$PagesTableFilterComposer f) f,
  ) {
    final $$PagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pages,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagesTableFilterComposer(
            $db: $db,
            $table: $db.pages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  $$BooksTableOrderingComposer get bookId {
    final $$BooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.books,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BooksTableOrderingComposer(
            $db: $db,
            $table: $db.books,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  $$BooksTableAnnotationComposer get bookId {
    final $$BooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.books,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BooksTableAnnotationComposer(
            $db: $db,
            $table: $db.books,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> pagesRefs<T extends Object>(
    Expression<T> Function($$PagesTableAnnotationComposer a) f,
  ) {
    final $$PagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pages,
      getReferencedColumn: (t) => t.chapterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagesTableAnnotationComposer(
            $db: $db,
            $table: $db.pages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChaptersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChaptersTable,
          Chapter,
          $$ChaptersTableFilterComposer,
          $$ChaptersTableOrderingComposer,
          $$ChaptersTableAnnotationComposer,
          $$ChaptersTableCreateCompanionBuilder,
          $$ChaptersTableUpdateCompanionBuilder,
          (Chapter, $$ChaptersTableReferences),
          Chapter,
          PrefetchHooks Function({bool bookId, bool pagesRefs})
        > {
  $$ChaptersTableTableManager(_$AppDatabase db, $ChaptersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> bookId = const Value.absent(),
                Value<String> cityId = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion(
                id: id,
                bookId: bookId,
                cityId: cityId,
                order: order,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String bookId,
                required String cityId,
                required int order,
                Value<int> rowid = const Value.absent(),
              }) => ChaptersCompanion.insert(
                id: id,
                bookId: bookId,
                cityId: cityId,
                order: order,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChaptersTable, Chapter>(table),
                  $$ChaptersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bookId = false, pagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pagesRefs) db.pages],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bookId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.bookId,
                        referencedTable: $$ChaptersTableReferences._bookIdTable(
                          db,
                        ),
                        referencedColumn: $$ChaptersTableReferences
                            ._bookIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pagesRefs)
                    await $_getPrefetchedDataByColumns<
                      Chapter,
                      $ChaptersTable,
                      Page,
                      $PagesTable
                    >(
                      currentTable: table,
                      referencedTable: $$ChaptersTableReferences
                          ._pagesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChaptersTableReferences(db, table, p0).pagesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'chapter_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChaptersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChaptersTable,
      Chapter,
      $$ChaptersTableFilterComposer,
      $$ChaptersTableOrderingComposer,
      $$ChaptersTableAnnotationComposer,
      $$ChaptersTableCreateCompanionBuilder,
      $$ChaptersTableUpdateCompanionBuilder,
      (Chapter, $$ChaptersTableReferences),
      Chapter,
      PrefetchHooks Function({bool bookId, bool pagesRefs})
    >;
typedef $$PagesTableCreateCompanionBuilder = PagesCompanion Function({
  required String id,
  required String chapterId,
  required PageKind kind,
  Value<String?> templateId,
  required int order,
  Value<PaperStyle> paperStyle,
  Value<String?> stylePresetId,
  Value<int> rowid,
});
typedef $$PagesTableUpdateCompanionBuilder = PagesCompanion Function({
  Value<String> id,
  Value<String> chapterId,
  Value<PageKind> kind,
  Value<String?> templateId,
  Value<int> order,
  Value<PaperStyle> paperStyle,
  Value<String?> stylePresetId,
  Value<int> rowid,
});

final class $$PagesTableReferences
    extends BaseReferences<_$AppDatabase, $PagesTable, Page> {
  $$PagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChaptersTable _chapterIdTable(_$AppDatabase db) =>
      db.chapters.createAlias('pages__chapter_id__chapters__id');

  $$ChaptersTableProcessedTableManager get chapterId {
    final $_column = $_itemColumn<String>('chapter_id')!;

    final manager = $$ChaptersTableTableManager(
      $_db,
      $_db.chapters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlacementsTable, List<Placement>>
  _placementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.placements,
    aliasName: 'pages__id__placements__page_id',
  );

  $$PlacementsTableProcessedTableManager get placementsRefs {
    final manager = $$PlacementsTableTableManager(
      $_db,
      $_db.placements,
    ).filter((f) => f.pageId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_placementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PagesTableFilterComposer extends Composer<_$AppDatabase, $PagesTable> {
  $$PagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PageKind, PageKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PaperStyle, PaperStyle, String>
  get paperStyle => $composableBuilder(
    column: $table.paperStyle,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get stylePresetId => $composableBuilder(
    column: $table.stylePresetId,
    builder: (column) => ColumnFilters(column),
  );

  $$ChaptersTableFilterComposer get chapterId {
    final $$ChaptersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableFilterComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> placementsRefs(
    Expression<bool> Function($$PlacementsTableFilterComposer f) f,
  ) {
    final $$PlacementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placements,
      getReferencedColumn: (t) => t.pageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacementsTableFilterComposer(
            $db: $db,
            $table: $db.placements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PagesTableOrderingComposer
    extends Composer<_$AppDatabase, $PagesTable> {
  $$PagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paperStyle => $composableBuilder(
    column: $table.paperStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stylePresetId => $composableBuilder(
    column: $table.stylePresetId,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChaptersTableOrderingComposer get chapterId {
    final $$ChaptersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableOrderingComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PagesTable> {
  $$PagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PageKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaperStyle, String> get paperStyle =>
      $composableBuilder(
        column: $table.paperStyle,
        builder: (column) => column,
      );

  GeneratedColumn<String> get stylePresetId => $composableBuilder(
    column: $table.stylePresetId,
    builder: (column) => column,
  );

  $$ChaptersTableAnnotationComposer get chapterId {
    final $$ChaptersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.chapters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChaptersTableAnnotationComposer(
            $db: $db,
            $table: $db.chapters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> placementsRefs<T extends Object>(
    Expression<T> Function($$PlacementsTableAnnotationComposer a) f,
  ) {
    final $$PlacementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placements,
      getReferencedColumn: (t) => t.pageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacementsTableAnnotationComposer(
            $db: $db,
            $table: $db.placements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PagesTable,
          Page,
          $$PagesTableFilterComposer,
          $$PagesTableOrderingComposer,
          $$PagesTableAnnotationComposer,
          $$PagesTableCreateCompanionBuilder,
          $$PagesTableUpdateCompanionBuilder,
          (Page, $$PagesTableReferences),
          Page,
          PrefetchHooks Function({bool chapterId, bool placementsRefs})
        > {
  $$PagesTableTableManager(_$AppDatabase db, $PagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<PageKind> kind = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<PaperStyle> paperStyle = const Value.absent(),
                Value<String?> stylePresetId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PagesCompanion(
                id: id,
                chapterId: chapterId,
                kind: kind,
                templateId: templateId,
                order: order,
                paperStyle: paperStyle,
                stylePresetId: stylePresetId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String chapterId,
                required PageKind kind,
                Value<String?> templateId = const Value.absent(),
                required int order,
                Value<PaperStyle> paperStyle = const Value.absent(),
                Value<String?> stylePresetId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PagesCompanion.insert(
                id: id,
                chapterId: chapterId,
                kind: kind,
                templateId: templateId,
                order: order,
                paperStyle: paperStyle,
                stylePresetId: stylePresetId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PagesTable, Page>(table),
                  $$PagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({chapterId = false, placementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (placementsRefs) db.placements],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (chapterId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.chapterId,
                        referencedTable: $$PagesTableReferences._chapterIdTable(
                          db,
                        ),
                        referencedColumn: $$PagesTableReferences
                            ._chapterIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (placementsRefs)
                    await $_getPrefetchedDataByColumns<
                      Page,
                      $PagesTable,
                      Placement,
                      $PlacementsTable
                    >(
                      currentTable: table,
                      referencedTable: $$PagesTableReferences
                          ._placementsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PagesTableReferences(db, table, p0).placementsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'page_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PagesTable,
      Page,
      $$PagesTableFilterComposer,
      $$PagesTableOrderingComposer,
      $$PagesTableAnnotationComposer,
      $$PagesTableCreateCompanionBuilder,
      $$PagesTableUpdateCompanionBuilder,
      (Page, $$PagesTableReferences),
      Page,
      PrefetchHooks Function({bool chapterId, bool placementsRefs})
    >;
typedef $$PlacementsTableCreateCompanionBuilder = PlacementsCompanion Function({
  required String findingId,
  required String pageId,
  required double x,
  required double y,
  Value<double> scale,
  Value<double> rotation,
  Value<int> z,
  Value<bool> isManuallyArranged,
  Value<TapePosition> tapePosition,
  Value<TapePattern> tapePattern,
  Value<NoteInk> noteInk,
  Value<bool> hasFrame,
  Value<int> rowid,
});
typedef $$PlacementsTableUpdateCompanionBuilder = PlacementsCompanion Function({
  Value<String> findingId,
  Value<String> pageId,
  Value<double> x,
  Value<double> y,
  Value<double> scale,
  Value<double> rotation,
  Value<int> z,
  Value<bool> isManuallyArranged,
  Value<TapePosition> tapePosition,
  Value<TapePattern> tapePattern,
  Value<NoteInk> noteInk,
  Value<bool> hasFrame,
  Value<int> rowid,
});

final class $$PlacementsTableReferences
    extends BaseReferences<_$AppDatabase, $PlacementsTable, Placement> {
  $$PlacementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FindingsTable _findingIdTable(_$AppDatabase db) =>
      db.findings.createAlias('placements__finding_id__findings__id');

  $$FindingsTableProcessedTableManager get findingId {
    final $_column = $_itemColumn<String>('finding_id')!;

    final manager = $$FindingsTableTableManager(
      $_db,
      $_db.findings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_findingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PagesTable _pageIdTable(_$AppDatabase db) =>
      db.pages.createAlias('placements__page_id__pages__id');

  $$PagesTableProcessedTableManager get pageId {
    final $_column = $_itemColumn<String>('page_id')!;

    final manager = $$PagesTableTableManager(
      $_db,
      $_db.pages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlacementsTableFilterComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rotation => $composableBuilder(
    column: $table.rotation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get z => $composableBuilder(
    column: $table.z,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManuallyArranged => $composableBuilder(
    column: $table.isManuallyArranged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TapePosition, TapePosition, String>
  get tapePosition => $composableBuilder(
    column: $table.tapePosition,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<TapePattern, TapePattern, String>
  get tapePattern => $composableBuilder(
    column: $table.tapePattern,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<NoteInk, NoteInk, String> get noteInk =>
      $composableBuilder(
        column: $table.noteInk,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get hasFrame => $composableBuilder(
    column: $table.hasFrame,
    builder: (column) => ColumnFilters(column),
  );

  $$FindingsTableFilterComposer get findingId {
    final $$FindingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.findingId,
      referencedTable: $db.findings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FindingsTableFilterComposer(
            $db: $db,
            $table: $db.findings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PagesTableFilterComposer get pageId {
    final $$PagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pageId,
      referencedTable: $db.pages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagesTableFilterComposer(
            $db: $db,
            $table: $db.pages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlacementsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rotation => $composableBuilder(
    column: $table.rotation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get z => $composableBuilder(
    column: $table.z,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManuallyArranged => $composableBuilder(
    column: $table.isManuallyArranged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tapePosition => $composableBuilder(
    column: $table.tapePosition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tapePattern => $composableBuilder(
    column: $table.tapePattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteInk => $composableBuilder(
    column: $table.noteInk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasFrame => $composableBuilder(
    column: $table.hasFrame,
    builder: (column) => ColumnOrderings(column),
  );

  $$FindingsTableOrderingComposer get findingId {
    final $$FindingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.findingId,
      referencedTable: $db.findings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FindingsTableOrderingComposer(
            $db: $db,
            $table: $db.findings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PagesTableOrderingComposer get pageId {
    final $$PagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pageId,
      referencedTable: $db.pages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagesTableOrderingComposer(
            $db: $db,
            $table: $db.pages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlacementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<double> get scale =>
      $composableBuilder(column: $table.scale, builder: (column) => column);

  GeneratedColumn<double> get rotation =>
      $composableBuilder(column: $table.rotation, builder: (column) => column);

  GeneratedColumn<int> get z =>
      $composableBuilder(column: $table.z, builder: (column) => column);

  GeneratedColumn<bool> get isManuallyArranged => $composableBuilder(
    column: $table.isManuallyArranged,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TapePosition, String> get tapePosition =>
      $composableBuilder(
        column: $table.tapePosition,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<TapePattern, String> get tapePattern =>
      $composableBuilder(
        column: $table.tapePattern,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<NoteInk, String> get noteInk =>
      $composableBuilder(column: $table.noteInk, builder: (column) => column);

  GeneratedColumn<bool> get hasFrame =>
      $composableBuilder(column: $table.hasFrame, builder: (column) => column);

  $$FindingsTableAnnotationComposer get findingId {
    final $$FindingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.findingId,
      referencedTable: $db.findings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FindingsTableAnnotationComposer(
            $db: $db,
            $table: $db.findings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PagesTableAnnotationComposer get pageId {
    final $$PagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pageId,
      referencedTable: $db.pages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagesTableAnnotationComposer(
            $db: $db,
            $table: $db.pages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlacementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlacementsTable,
          Placement,
          $$PlacementsTableFilterComposer,
          $$PlacementsTableOrderingComposer,
          $$PlacementsTableAnnotationComposer,
          $$PlacementsTableCreateCompanionBuilder,
          $$PlacementsTableUpdateCompanionBuilder,
          (Placement, $$PlacementsTableReferences),
          Placement,
          PrefetchHooks Function({bool findingId, bool pageId})
        > {
  $$PlacementsTableTableManager(_$AppDatabase db, $PlacementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> findingId = const Value.absent(),
                Value<String> pageId = const Value.absent(),
                Value<double> x = const Value.absent(),
                Value<double> y = const Value.absent(),
                Value<double> scale = const Value.absent(),
                Value<double> rotation = const Value.absent(),
                Value<int> z = const Value.absent(),
                Value<bool> isManuallyArranged = const Value.absent(),
                Value<TapePosition> tapePosition = const Value.absent(),
                Value<TapePattern> tapePattern = const Value.absent(),
                Value<NoteInk> noteInk = const Value.absent(),
                Value<bool> hasFrame = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlacementsCompanion(
                findingId: findingId,
                pageId: pageId,
                x: x,
                y: y,
                scale: scale,
                rotation: rotation,
                z: z,
                isManuallyArranged: isManuallyArranged,
                tapePosition: tapePosition,
                tapePattern: tapePattern,
                noteInk: noteInk,
                hasFrame: hasFrame,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String findingId,
                required String pageId,
                required double x,
                required double y,
                Value<double> scale = const Value.absent(),
                Value<double> rotation = const Value.absent(),
                Value<int> z = const Value.absent(),
                Value<bool> isManuallyArranged = const Value.absent(),
                Value<TapePosition> tapePosition = const Value.absent(),
                Value<TapePattern> tapePattern = const Value.absent(),
                Value<NoteInk> noteInk = const Value.absent(),
                Value<bool> hasFrame = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlacementsCompanion.insert(
                findingId: findingId,
                pageId: pageId,
                x: x,
                y: y,
                scale: scale,
                rotation: rotation,
                z: z,
                isManuallyArranged: isManuallyArranged,
                tapePosition: tapePosition,
                tapePattern: tapePattern,
                noteInk: noteInk,
                hasFrame: hasFrame,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlacementsTable, Placement>(table),
                  $$PlacementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({findingId = false, pageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (findingId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.findingId,
                        referencedTable: $$PlacementsTableReferences
                            ._findingIdTable(db),
                        referencedColumn: $$PlacementsTableReferences
                            ._findingIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (pageId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.pageId,
                        referencedTable: $$PlacementsTableReferences
                            ._pageIdTable(db),
                        referencedColumn: $$PlacementsTableReferences
                            ._pageIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlacementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlacementsTable,
      Placement,
      $$PlacementsTableFilterComposer,
      $$PlacementsTableOrderingComposer,
      $$PlacementsTableAnnotationComposer,
      $$PlacementsTableCreateCompanionBuilder,
      $$PlacementsTableUpdateCompanionBuilder,
      (Placement, $$PlacementsTableReferences),
      Placement,
      PrefetchHooks Function({bool findingId, bool pageId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FindingsTableTableManager get findings =>
      $$FindingsTableTableManager(_db, _db.findings);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db, _db.chapters);
  $$PagesTableTableManager get pages =>
      $$PagesTableTableManager(_db, _db.pages);
  $$PlacementsTableTableManager get placements =>
      $$PlacementsTableTableManager(_db, _db.placements);
}
