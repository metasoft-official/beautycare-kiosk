// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_dto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDtoModel _$AccountDtoModelFromJson(Map<String, dynamic> json) {
  return _AccountDtoModel.fromJson(json);
}

/// @nodoc
mixin _$AccountDtoModel {
  int? get roleId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  UserModel? get userDto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDtoModelCopyWith<AccountDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDtoModelCopyWith<$Res> {
  factory $AccountDtoModelCopyWith(
          AccountDtoModel value, $Res Function(AccountDtoModel) then) =
      _$AccountDtoModelCopyWithImpl<$Res, AccountDtoModel>;
  @useResult
  $Res call({int? roleId, int? userId, UserModel? userDto});

  $UserModelCopyWith<$Res>? get userDto;
}

/// @nodoc
class _$AccountDtoModelCopyWithImpl<$Res, $Val extends AccountDtoModel>
    implements $AccountDtoModelCopyWith<$Res> {
  _$AccountDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? userId = freezed,
    Object? userDto = freezed,
  }) {
    return _then(_value.copyWith(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userDto: freezed == userDto
          ? _value.userDto
          : userDto // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userDto {
    if (_value.userDto == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userDto!, (value) {
      return _then(_value.copyWith(userDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountDtoModelCopyWith<$Res>
    implements $AccountDtoModelCopyWith<$Res> {
  factory _$$_AccountDtoModelCopyWith(
          _$_AccountDtoModel value, $Res Function(_$_AccountDtoModel) then) =
      __$$_AccountDtoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? roleId, int? userId, UserModel? userDto});

  @override
  $UserModelCopyWith<$Res>? get userDto;
}

/// @nodoc
class __$$_AccountDtoModelCopyWithImpl<$Res>
    extends _$AccountDtoModelCopyWithImpl<$Res, _$_AccountDtoModel>
    implements _$$_AccountDtoModelCopyWith<$Res> {
  __$$_AccountDtoModelCopyWithImpl(
      _$_AccountDtoModel _value, $Res Function(_$_AccountDtoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? userId = freezed,
    Object? userDto = freezed,
  }) {
    return _then(_$_AccountDtoModel(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userDto: freezed == userDto
          ? _value.userDto
          : userDto // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDtoModel implements _AccountDtoModel {
  _$_AccountDtoModel({this.roleId, this.userId, this.userDto});

  factory _$_AccountDtoModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDtoModelFromJson(json);

  @override
  final int? roleId;
  @override
  final int? userId;
  @override
  final UserModel? userDto;

  @override
  String toString() {
    return 'AccountDtoModel(roleId: $roleId, userId: $userId, userDto: $userDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDtoModel &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userDto, userDto) || other.userDto == userDto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roleId, userId, userDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDtoModelCopyWith<_$_AccountDtoModel> get copyWith =>
      __$$_AccountDtoModelCopyWithImpl<_$_AccountDtoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDtoModelToJson(
      this,
    );
  }
}

abstract class _AccountDtoModel implements AccountDtoModel {
  factory _AccountDtoModel(
      {final int? roleId,
      final int? userId,
      final UserModel? userDto}) = _$_AccountDtoModel;

  factory _AccountDtoModel.fromJson(Map<String, dynamic> json) =
      _$_AccountDtoModel.fromJson;

  @override
  int? get roleId;
  @override
  int? get userId;
  @override
  UserModel? get userDto;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDtoModelCopyWith<_$_AccountDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
