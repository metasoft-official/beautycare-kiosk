// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skin_mbti_keyword_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkinMbtiKeywordModel _$SkinMbtiKeywordModelFromJson(Map<String, dynamic> json) {
  return _SkinMbtiKeywordModel.fromJson(json);
}

/// @nodoc
mixin _$SkinMbtiKeywordModel {
  int? get id => throw _privateConstructorUsedError;
  int? get skinMbtiId => throw _privateConstructorUsedError;
  int? get keywordCode => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkinMbtiKeywordModelCopyWith<SkinMbtiKeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkinMbtiKeywordModelCopyWith<$Res> {
  factory $SkinMbtiKeywordModelCopyWith(SkinMbtiKeywordModel value,
          $Res Function(SkinMbtiKeywordModel) then) =
      _$SkinMbtiKeywordModelCopyWithImpl<$Res, SkinMbtiKeywordModel>;
  @useResult
  $Res call({int? id, int? skinMbtiId, int? keywordCode, String? keyword});
}

/// @nodoc
class _$SkinMbtiKeywordModelCopyWithImpl<$Res,
        $Val extends SkinMbtiKeywordModel>
    implements $SkinMbtiKeywordModelCopyWith<$Res> {
  _$SkinMbtiKeywordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? skinMbtiId = freezed,
    Object? keywordCode = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      skinMbtiId: freezed == skinMbtiId
          ? _value.skinMbtiId
          : skinMbtiId // ignore: cast_nullable_to_non_nullable
              as int?,
      keywordCode: freezed == keywordCode
          ? _value.keywordCode
          : keywordCode // ignore: cast_nullable_to_non_nullable
              as int?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SkinMbtiKeywordModelCopyWith<$Res>
    implements $SkinMbtiKeywordModelCopyWith<$Res> {
  factory _$$_SkinMbtiKeywordModelCopyWith(_$_SkinMbtiKeywordModel value,
          $Res Function(_$_SkinMbtiKeywordModel) then) =
      __$$_SkinMbtiKeywordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? skinMbtiId, int? keywordCode, String? keyword});
}

/// @nodoc
class __$$_SkinMbtiKeywordModelCopyWithImpl<$Res>
    extends _$SkinMbtiKeywordModelCopyWithImpl<$Res, _$_SkinMbtiKeywordModel>
    implements _$$_SkinMbtiKeywordModelCopyWith<$Res> {
  __$$_SkinMbtiKeywordModelCopyWithImpl(_$_SkinMbtiKeywordModel _value,
      $Res Function(_$_SkinMbtiKeywordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? skinMbtiId = freezed,
    Object? keywordCode = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_$_SkinMbtiKeywordModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      skinMbtiId: freezed == skinMbtiId
          ? _value.skinMbtiId
          : skinMbtiId // ignore: cast_nullable_to_non_nullable
              as int?,
      keywordCode: freezed == keywordCode
          ? _value.keywordCode
          : keywordCode // ignore: cast_nullable_to_non_nullable
              as int?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkinMbtiKeywordModel implements _SkinMbtiKeywordModel {
  _$_SkinMbtiKeywordModel(
      {this.id, this.skinMbtiId, this.keywordCode, this.keyword});

  factory _$_SkinMbtiKeywordModel.fromJson(Map<String, dynamic> json) =>
      _$$_SkinMbtiKeywordModelFromJson(json);

  @override
  final int? id;
  @override
  final int? skinMbtiId;
  @override
  final int? keywordCode;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'SkinMbtiKeywordModel(id: $id, skinMbtiId: $skinMbtiId, keywordCode: $keywordCode, keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkinMbtiKeywordModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skinMbtiId, skinMbtiId) ||
                other.skinMbtiId == skinMbtiId) &&
            (identical(other.keywordCode, keywordCode) ||
                other.keywordCode == keywordCode) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, skinMbtiId, keywordCode, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkinMbtiKeywordModelCopyWith<_$_SkinMbtiKeywordModel> get copyWith =>
      __$$_SkinMbtiKeywordModelCopyWithImpl<_$_SkinMbtiKeywordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkinMbtiKeywordModelToJson(
      this,
    );
  }
}

abstract class _SkinMbtiKeywordModel implements SkinMbtiKeywordModel {
  factory _SkinMbtiKeywordModel(
      {final int? id,
      final int? skinMbtiId,
      final int? keywordCode,
      final String? keyword}) = _$_SkinMbtiKeywordModel;

  factory _SkinMbtiKeywordModel.fromJson(Map<String, dynamic> json) =
      _$_SkinMbtiKeywordModel.fromJson;

  @override
  int? get id;
  @override
  int? get skinMbtiId;
  @override
  int? get keywordCode;
  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_SkinMbtiKeywordModelCopyWith<_$_SkinMbtiKeywordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
