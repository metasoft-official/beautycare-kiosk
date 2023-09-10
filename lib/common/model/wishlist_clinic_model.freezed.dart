// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_clinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WishlistClinicModel _$WishlistClinicModelFromJson(Map<String, dynamic> json) {
  return _WishlistClinicModel.fromJson(json);
}

/// @nodoc
mixin _$WishlistClinicModel {
  int? get userId => throw _privateConstructorUsedError;
  int? get clinicId => throw _privateConstructorUsedError;
  ClinicModel? get clinic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishlistClinicModelCopyWith<WishlistClinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistClinicModelCopyWith<$Res> {
  factory $WishlistClinicModelCopyWith(
          WishlistClinicModel value, $Res Function(WishlistClinicModel) then) =
      _$WishlistClinicModelCopyWithImpl<$Res, WishlistClinicModel>;
  @useResult
  $Res call({int? userId, int? clinicId, ClinicModel? clinic});

  $ClinicModelCopyWith<$Res>? get clinic;
}

/// @nodoc
class _$WishlistClinicModelCopyWithImpl<$Res, $Val extends WishlistClinicModel>
    implements $WishlistClinicModelCopyWith<$Res> {
  _$WishlistClinicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clinicId = freezed,
    Object? clinic = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinic: freezed == clinic
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as ClinicModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClinicModelCopyWith<$Res>? get clinic {
    if (_value.clinic == null) {
      return null;
    }

    return $ClinicModelCopyWith<$Res>(_value.clinic!, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WishlistClinicModelCopyWith<$Res>
    implements $WishlistClinicModelCopyWith<$Res> {
  factory _$$_WishlistClinicModelCopyWith(_$_WishlistClinicModel value,
          $Res Function(_$_WishlistClinicModel) then) =
      __$$_WishlistClinicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? userId, int? clinicId, ClinicModel? clinic});

  @override
  $ClinicModelCopyWith<$Res>? get clinic;
}

/// @nodoc
class __$$_WishlistClinicModelCopyWithImpl<$Res>
    extends _$WishlistClinicModelCopyWithImpl<$Res, _$_WishlistClinicModel>
    implements _$$_WishlistClinicModelCopyWith<$Res> {
  __$$_WishlistClinicModelCopyWithImpl(_$_WishlistClinicModel _value,
      $Res Function(_$_WishlistClinicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clinicId = freezed,
    Object? clinic = freezed,
  }) {
    return _then(_$_WishlistClinicModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinic: freezed == clinic
          ? _value.clinic
          : clinic // ignore: cast_nullable_to_non_nullable
              as ClinicModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WishlistClinicModel implements _WishlistClinicModel {
  _$_WishlistClinicModel({this.userId, this.clinicId, this.clinic});

  factory _$_WishlistClinicModel.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistClinicModelFromJson(json);

  @override
  final int? userId;
  @override
  final int? clinicId;
  @override
  final ClinicModel? clinic;

  @override
  String toString() {
    return 'WishlistClinicModel(userId: $userId, clinicId: $clinicId, clinic: $clinic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishlistClinicModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.clinic, clinic) || other.clinic == clinic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, clinicId, clinic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistClinicModelCopyWith<_$_WishlistClinicModel> get copyWith =>
      __$$_WishlistClinicModelCopyWithImpl<_$_WishlistClinicModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistClinicModelToJson(
      this,
    );
  }
}

abstract class _WishlistClinicModel implements WishlistClinicModel {
  factory _WishlistClinicModel(
      {final int? userId,
      final int? clinicId,
      final ClinicModel? clinic}) = _$_WishlistClinicModel;

  factory _WishlistClinicModel.fromJson(Map<String, dynamic> json) =
      _$_WishlistClinicModel.fromJson;

  @override
  int? get userId;
  @override
  int? get clinicId;
  @override
  ClinicModel? get clinic;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistClinicModelCopyWith<_$_WishlistClinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
