// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleUserModel _$RoleUserModelFromJson(Map<String, dynamic> json) {
  return _RoleUserModel.fromJson(json);
}

/// @nodoc
mixin _$RoleUserModel {
  int? get id => throw _privateConstructorUsedError;
  int? get roleId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  RoleModel? get role => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleUserModelCopyWith<RoleUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleUserModelCopyWith<$Res> {
  factory $RoleUserModelCopyWith(
          RoleUserModel value, $Res Function(RoleUserModel) then) =
      _$RoleUserModelCopyWithImpl<$Res, RoleUserModel>;
  @useResult
  $Res call(
      {int? id, int? roleId, int? userId, RoleModel? role, UserModel? user});

  $RoleModelCopyWith<$Res>? get role;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$RoleUserModelCopyWithImpl<$Res, $Val extends RoleUserModel>
    implements $RoleUserModelCopyWith<$Res> {
  _$RoleUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roleId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleModelCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $RoleModelCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoleUserModelCopyWith<$Res>
    implements $RoleUserModelCopyWith<$Res> {
  factory _$$_RoleUserModelCopyWith(
          _$_RoleUserModel value, $Res Function(_$_RoleUserModel) then) =
      __$$_RoleUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, int? roleId, int? userId, RoleModel? role, UserModel? user});

  @override
  $RoleModelCopyWith<$Res>? get role;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_RoleUserModelCopyWithImpl<$Res>
    extends _$RoleUserModelCopyWithImpl<$Res, _$_RoleUserModel>
    implements _$$_RoleUserModelCopyWith<$Res> {
  __$$_RoleUserModelCopyWithImpl(
      _$_RoleUserModel _value, $Res Function(_$_RoleUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roleId = freezed,
    Object? userId = freezed,
    Object? role = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_RoleUserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoleUserModel implements _RoleUserModel {
  _$_RoleUserModel({this.id, this.roleId, this.userId, this.role, this.user});

  factory _$_RoleUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoleUserModelFromJson(json);

  @override
  final int? id;
  @override
  final int? roleId;
  @override
  final int? userId;
  @override
  final RoleModel? role;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'RoleUserModel(id: $id, roleId: $roleId, userId: $userId, role: $role, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoleUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, roleId, userId, role, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoleUserModelCopyWith<_$_RoleUserModel> get copyWith =>
      __$$_RoleUserModelCopyWithImpl<_$_RoleUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleUserModelToJson(
      this,
    );
  }
}

abstract class _RoleUserModel implements RoleUserModel {
  factory _RoleUserModel(
      {final int? id,
      final int? roleId,
      final int? userId,
      final RoleModel? role,
      final UserModel? user}) = _$_RoleUserModel;

  factory _RoleUserModel.fromJson(Map<String, dynamic> json) =
      _$_RoleUserModel.fromJson;

  @override
  int? get id;
  @override
  int? get roleId;
  @override
  int? get userId;
  @override
  RoleModel? get role;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_RoleUserModelCopyWith<_$_RoleUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
