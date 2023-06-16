// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) {
  return _RoleModel.fromJson(json);
}

/// @nodoc
mixin _$RoleModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get roleTypeCode => throw _privateConstructorUsedError;
  int? get roleDetailTypeCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleModelCopyWith<RoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleModelCopyWith<$Res> {
  factory $RoleModelCopyWith(RoleModel vvalue, $Res Function(RoleModel) then) =
      _$RoleModelCopyWithImpl<$Res, RoleModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? roleTypeCode,
      int? roleDetailTypeCode,
      String? description,
      String? value,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class _$RoleModelCopyWithImpl<$Res, $Val extends RoleModel>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? roleTypeCode = freezed,
    Object? roleDetailTypeCode = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
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
      roleTypeCode: freezed == roleTypeCode
          ? _value.roleTypeCode
          : roleTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      roleDetailTypeCode: freezed == roleDetailTypeCode
          ? _value.roleDetailTypeCode
          : roleDetailTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_RoleModelCopyWith<$Res> implements $RoleModelCopyWith<$Res> {
  factory _$$_RoleModelCopyWith(
          _$_RoleModel value, $Res Function(_$_RoleModel) then) =
      __$$_RoleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? roleTypeCode,
      int? roleDetailTypeCode,
      String? description,
      String? value,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class __$$_RoleModelCopyWithImpl<$Res>
    extends _$RoleModelCopyWithImpl<$Res, _$_RoleModel>
    implements _$$_RoleModelCopyWith<$Res> {
  __$$_RoleModelCopyWithImpl(
      _$_RoleModel _value, $Res Function(_$_RoleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? roleTypeCode = freezed,
    Object? roleDetailTypeCode = freezed,
    Object? description = freezed,
    Object? value = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_RoleModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      roleTypeCode: freezed == roleTypeCode
          ? _value.roleTypeCode
          : roleTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      roleDetailTypeCode: freezed == roleDetailTypeCode
          ? _value.roleDetailTypeCode
          : roleDetailTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$_RoleModel implements _RoleModel {
  _$_RoleModel(
      {this.id,
      this.name,
      this.roleTypeCode,
      this.roleDetailTypeCode,
      this.description,
      this.value,
      this.createdDate,
      this.lastModifiedDate});

  factory _$_RoleModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoleModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? roleTypeCode;
  @override
  final int? roleDetailTypeCode;
  @override
  final String? description;
  @override
  final String? value;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? lastModifiedDate;

  @override
  String toString() {
    return 'RoleModel(id: $id, name: $name, roleTypeCode: $roleTypeCode, roleDetailTypeCode: $roleDetailTypeCode, description: $description, value: $value, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roleTypeCode, roleTypeCode) ||
                other.roleTypeCode == roleTypeCode) &&
            (identical(other.roleDetailTypeCode, roleDetailTypeCode) ||
                other.roleDetailTypeCode == roleDetailTypeCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, roleTypeCode,
      roleDetailTypeCode, description, value, createdDate, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoleModelCopyWith<_$_RoleModel> get copyWith =>
      __$$_RoleModelCopyWithImpl<_$_RoleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleModelToJson(
      this,
    );
  }
}

abstract class _RoleModel implements RoleModel {
  factory _RoleModel(
      {final int? id,
      final String? name,
      final int? roleTypeCode,
      final int? roleDetailTypeCode,
      final String? description,
      final String? value,
      final DateTime? createdDate,
      final DateTime? lastModifiedDate}) = _$_RoleModel;

  factory _RoleModel.fromJson(Map<String, dynamic> json) =
      _$_RoleModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get roleTypeCode;
  @override
  int? get roleDetailTypeCode;
  @override
  String? get description;
  @override
  String? get value;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_RoleModelCopyWith<_$_RoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
