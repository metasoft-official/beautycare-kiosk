// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CodeModel _$CodeModelFromJson(Map<String, dynamic> json) {
  return _CodeModel.fromJson(json);
}

/// @nodoc
mixin _$CodeModel {
  int? get id => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  int? get orderNo => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeModelCopyWith<CodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeModelCopyWith<$Res> {
  factory $CodeModelCopyWith(CodeModel value, $Res Function(CodeModel) then) =
      _$CodeModelCopyWithImpl<$Res, CodeModel>;
  @useResult
  $Res call(
      {int? id,
      int? parentId,
      String? name,
      String? description,
      String? value,
      int? orderNo,
      String? status,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class _$CodeModelCopyWithImpl<$Res, $Val extends CodeModel>
    implements $CodeModelCopyWith<$Res> {
  _$CodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? orderNo = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CodeModelCopyWith<$Res> implements $CodeModelCopyWith<$Res> {
  factory _$$_CodeModelCopyWith(
          _$_CodeModel value, $Res Function(_$_CodeModel) then) =
      __$$_CodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? parentId,
      String? name,
      String? description,
      String? value,
      int? orderNo,
      String? status,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class __$$_CodeModelCopyWithImpl<$Res>
    extends _$CodeModelCopyWithImpl<$Res, _$_CodeModel>
    implements _$$_CodeModelCopyWith<$Res> {
  __$$_CodeModelCopyWithImpl(
      _$_CodeModel _value, $Res Function(_$_CodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? orderNo = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_CodeModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CodeModel implements _CodeModel {
  _$_CodeModel(
      {this.id,
      this.parentId,
      this.name,
      this.description,
      this.value,
      this.orderNo,
      this.status,
      this.createdDate,
      this.lastModifiedDate});

  factory _$_CodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_CodeModelFromJson(json);

  @override
  final int? id;
  @override
  final int? parentId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? value;
  @override
  final int? orderNo;
  @override
  final String? status;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? lastModifiedDate;

  @override
  String toString() {
    return 'CodeModel(id: $id, parentId: $parentId, name: $name, description: $description, value: $value, orderNo: $orderNo, status: $status, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parentId, name, description,
      value, orderNo, status, createdDate, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeModelCopyWith<_$_CodeModel> get copyWith =>
      __$$_CodeModelCopyWithImpl<_$_CodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CodeModelToJson(
      this,
    );
  }
}

abstract class _CodeModel implements CodeModel {
  factory _CodeModel(
      {final int? id,
      final int? parentId,
      final String? name,
      final String? description,
      final String? value,
      final int? orderNo,
      final String? status,
      final DateTime? createdDate,
      final DateTime? lastModifiedDate}) = _$_CodeModel;

  factory _CodeModel.fromJson(Map<String, dynamic> json) =
      _$_CodeModel.fromJson;

  @override
  int? get id;
  @override
  int? get parentId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get value;
  @override
  int? get orderNo;
  @override
  String? get status;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_CodeModelCopyWith<_$_CodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
