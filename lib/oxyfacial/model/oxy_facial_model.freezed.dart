// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oxy_facial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OxyFacialModel _$OxyFacialModelFromJson(Map<String, dynamic> json) {
  return _OxyFacialModel.fromJson(json);
}

/// @nodoc
mixin _$OxyFacialModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get nameEng => throw _privateConstructorUsedError;
  int? get backgroundImageId => throw _privateConstructorUsedError;
  IntegratedAttachFileModel? get backgroundImage =>
      throw _privateConstructorUsedError;
  int? get deviceImageId => throw _privateConstructorUsedError;
  IntegratedAttachFileModel? get deviceImage =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get visibilityStatus => throw _privateConstructorUsedError;
  DateTime? get createdTime => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;
  List<OxyFacialItemModel>? get itemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OxyFacialModelCopyWith<OxyFacialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OxyFacialModelCopyWith<$Res> {
  factory $OxyFacialModelCopyWith(
          OxyFacialModel value, $Res Function(OxyFacialModel) then) =
      _$OxyFacialModelCopyWithImpl<$Res, OxyFacialModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? nameEng,
      int? backgroundImageId,
      IntegratedAttachFileModel? backgroundImage,
      int? deviceImageId,
      IntegratedAttachFileModel? deviceImage,
      String? description,
      String? visibilityStatus,
      DateTime? createdTime,
      DateTime? lastModifiedDate,
      List<OxyFacialItemModel>? itemList});

  $IntegratedAttachFileModelCopyWith<$Res>? get backgroundImage;
  $IntegratedAttachFileModelCopyWith<$Res>? get deviceImage;
}

/// @nodoc
class _$OxyFacialModelCopyWithImpl<$Res, $Val extends OxyFacialModel>
    implements $OxyFacialModelCopyWith<$Res> {
  _$OxyFacialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEng = freezed,
    Object? backgroundImageId = freezed,
    Object? backgroundImage = freezed,
    Object? deviceImageId = freezed,
    Object? deviceImage = freezed,
    Object? description = freezed,
    Object? visibilityStatus = freezed,
    Object? createdTime = freezed,
    Object? lastModifiedDate = freezed,
    Object? itemList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEng: freezed == nameEng
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageId: freezed == backgroundImageId
          ? _value.backgroundImageId
          : backgroundImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      deviceImageId: freezed == deviceImageId
          ? _value.deviceImageId
          : deviceImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceImage: freezed == deviceImage
          ? _value.deviceImage
          : deviceImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<OxyFacialItemModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IntegratedAttachFileModelCopyWith<$Res>? get backgroundImage {
    if (_value.backgroundImage == null) {
      return null;
    }

    return $IntegratedAttachFileModelCopyWith<$Res>(_value.backgroundImage!,
        (value) {
      return _then(_value.copyWith(backgroundImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IntegratedAttachFileModelCopyWith<$Res>? get deviceImage {
    if (_value.deviceImage == null) {
      return null;
    }

    return $IntegratedAttachFileModelCopyWith<$Res>(_value.deviceImage!,
        (value) {
      return _then(_value.copyWith(deviceImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OxyFacialModelCopyWith<$Res>
    implements $OxyFacialModelCopyWith<$Res> {
  factory _$$_OxyFacialModelCopyWith(
          _$_OxyFacialModel value, $Res Function(_$_OxyFacialModel) then) =
      __$$_OxyFacialModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? nameEng,
      int? backgroundImageId,
      IntegratedAttachFileModel? backgroundImage,
      int? deviceImageId,
      IntegratedAttachFileModel? deviceImage,
      String? description,
      String? visibilityStatus,
      DateTime? createdTime,
      DateTime? lastModifiedDate,
      List<OxyFacialItemModel>? itemList});

  @override
  $IntegratedAttachFileModelCopyWith<$Res>? get backgroundImage;
  @override
  $IntegratedAttachFileModelCopyWith<$Res>? get deviceImage;
}

/// @nodoc
class __$$_OxyFacialModelCopyWithImpl<$Res>
    extends _$OxyFacialModelCopyWithImpl<$Res, _$_OxyFacialModel>
    implements _$$_OxyFacialModelCopyWith<$Res> {
  __$$_OxyFacialModelCopyWithImpl(
      _$_OxyFacialModel _value, $Res Function(_$_OxyFacialModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEng = freezed,
    Object? backgroundImageId = freezed,
    Object? backgroundImage = freezed,
    Object? deviceImageId = freezed,
    Object? deviceImage = freezed,
    Object? description = freezed,
    Object? visibilityStatus = freezed,
    Object? createdTime = freezed,
    Object? lastModifiedDate = freezed,
    Object? itemList = freezed,
  }) {
    return _then(_$_OxyFacialModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEng: freezed == nameEng
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageId: freezed == backgroundImageId
          ? _value.backgroundImageId
          : backgroundImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      deviceImageId: freezed == deviceImageId
          ? _value.deviceImageId
          : deviceImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceImage: freezed == deviceImage
          ? _value.deviceImage
          : deviceImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<OxyFacialItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OxyFacialModel implements _OxyFacialModel {
  _$_OxyFacialModel(
      {this.id,
      this.name,
      this.nameEng,
      this.backgroundImageId,
      this.backgroundImage,
      this.deviceImageId,
      this.deviceImage,
      this.description,
      this.visibilityStatus,
      this.createdTime,
      this.lastModifiedDate,
      final List<OxyFacialItemModel>? itemList})
      : _itemList = itemList;

  factory _$_OxyFacialModel.fromJson(Map<String, dynamic> json) =>
      _$$_OxyFacialModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? nameEng;
  @override
  final int? backgroundImageId;
  @override
  final IntegratedAttachFileModel? backgroundImage;
  @override
  final int? deviceImageId;
  @override
  final IntegratedAttachFileModel? deviceImage;
  @override
  final String? description;
  @override
  final String? visibilityStatus;
  @override
  final DateTime? createdTime;
  @override
  final DateTime? lastModifiedDate;
  final List<OxyFacialItemModel>? _itemList;
  @override
  List<OxyFacialItemModel>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OxyFacialModel(id: $id, name: $name, nameEng: $nameEng, backgroundImageId: $backgroundImageId, backgroundImage: $backgroundImage, deviceImageId: $deviceImageId, deviceImage: $deviceImage, description: $description, visibilityStatus: $visibilityStatus, createdTime: $createdTime, lastModifiedDate: $lastModifiedDate, itemList: $itemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OxyFacialModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEng, nameEng) || other.nameEng == nameEng) &&
            (identical(other.backgroundImageId, backgroundImageId) ||
                other.backgroundImageId == backgroundImageId) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.deviceImageId, deviceImageId) ||
                other.deviceImageId == deviceImageId) &&
            (identical(other.deviceImage, deviceImage) ||
                other.deviceImage == deviceImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                other.visibilityStatus == visibilityStatus) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nameEng,
      backgroundImageId,
      backgroundImage,
      deviceImageId,
      deviceImage,
      description,
      visibilityStatus,
      createdTime,
      lastModifiedDate,
      const DeepCollectionEquality().hash(_itemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OxyFacialModelCopyWith<_$_OxyFacialModel> get copyWith =>
      __$$_OxyFacialModelCopyWithImpl<_$_OxyFacialModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OxyFacialModelToJson(
      this,
    );
  }
}

abstract class _OxyFacialModel implements OxyFacialModel {
  factory _OxyFacialModel(
      {final int? id,
      final String? name,
      final String? nameEng,
      final int? backgroundImageId,
      final IntegratedAttachFileModel? backgroundImage,
      final int? deviceImageId,
      final IntegratedAttachFileModel? deviceImage,
      final String? description,
      final String? visibilityStatus,
      final DateTime? createdTime,
      final DateTime? lastModifiedDate,
      final List<OxyFacialItemModel>? itemList}) = _$_OxyFacialModel;

  factory _OxyFacialModel.fromJson(Map<String, dynamic> json) =
      _$_OxyFacialModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get nameEng;
  @override
  int? get backgroundImageId;
  @override
  IntegratedAttachFileModel? get backgroundImage;
  @override
  int? get deviceImageId;
  @override
  IntegratedAttachFileModel? get deviceImage;
  @override
  String? get description;
  @override
  String? get visibilityStatus;
  @override
  DateTime? get createdTime;
  @override
  DateTime? get lastModifiedDate;
  @override
  List<OxyFacialItemModel>? get itemList;
  @override
  @JsonKey(ignore: true)
  _$$_OxyFacialModelCopyWith<_$_OxyFacialModel> get copyWith =>
      throw _privateConstructorUsedError;
}
