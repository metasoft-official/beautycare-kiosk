// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return _RegionModel.fromJson(json);
}

/// @nodoc
mixin _$RegionModel {
  int? get id => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get orderNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionModelCopyWith<RegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionModelCopyWith<$Res> {
  factory $RegionModelCopyWith(
          RegionModel value, $Res Function(RegionModel) then) =
      _$RegionModelCopyWithImpl<$Res, RegionModel>;
  @useResult
  $Res call({int? id, int? parentId, String? name, int? orderNo});
}

/// @nodoc
class _$RegionModelCopyWithImpl<$Res, $Val extends RegionModel>
    implements $RegionModelCopyWith<$Res> {
  _$RegionModelCopyWithImpl(this._value, this._then);

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
    Object? orderNo = freezed,
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
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionModelCopyWith<$Res>
    implements $RegionModelCopyWith<$Res> {
  factory _$$_RegionModelCopyWith(
          _$_RegionModel value, $Res Function(_$_RegionModel) then) =
      __$$_RegionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? parentId, String? name, int? orderNo});
}

/// @nodoc
class __$$_RegionModelCopyWithImpl<$Res>
    extends _$RegionModelCopyWithImpl<$Res, _$_RegionModel>
    implements _$$_RegionModelCopyWith<$Res> {
  __$$_RegionModelCopyWithImpl(
      _$_RegionModel _value, $Res Function(_$_RegionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? orderNo = freezed,
  }) {
    return _then(_$_RegionModel(
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
      orderNo: freezed == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegionModel implements _RegionModel {
  _$_RegionModel({this.id, this.parentId, this.name, this.orderNo});

  factory _$_RegionModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegionModelFromJson(json);

  @override
  final int? id;
  @override
  final int? parentId;
  @override
  final String? name;
  @override
  final int? orderNo;

  @override
  String toString() {
    return 'RegionModel(id: $id, parentId: $parentId, name: $name, orderNo: $orderNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parentId, name, orderNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionModelCopyWith<_$_RegionModel> get copyWith =>
      __$$_RegionModelCopyWithImpl<_$_RegionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionModelToJson(
      this,
    );
  }
}

abstract class _RegionModel implements RegionModel {
  factory _RegionModel(
      {final int? id,
      final int? parentId,
      final String? name,
      final int? orderNo}) = _$_RegionModel;

  factory _RegionModel.fromJson(Map<String, dynamic> json) =
      _$_RegionModel.fromJson;

  @override
  int? get id;
  @override
  int? get parentId;
  @override
  String? get name;
  @override
  int? get orderNo;
  @override
  @JsonKey(ignore: true)
  _$$_RegionModelCopyWith<_$_RegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
