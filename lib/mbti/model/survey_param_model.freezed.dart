// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_param_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyParamModel _$SurveyParamModelFromJson(Map<String, dynamic> json) {
  return _SurveyParamModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyParamModel {
  int? get userId => throw _privateConstructorUsedError;
  List<SurveyResponseModel>? get responses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyParamModelCopyWith<SurveyParamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyParamModelCopyWith<$Res> {
  factory $SurveyParamModelCopyWith(
          SurveyParamModel value, $Res Function(SurveyParamModel) then) =
      _$SurveyParamModelCopyWithImpl<$Res, SurveyParamModel>;
  @useResult
  $Res call({int? userId, List<SurveyResponseModel>? responses});
}

/// @nodoc
class _$SurveyParamModelCopyWithImpl<$Res, $Val extends SurveyParamModel>
    implements $SurveyParamModelCopyWith<$Res> {
  _$SurveyParamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? responses = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      responses: freezed == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyParamModelCopyWith<$Res>
    implements $SurveyParamModelCopyWith<$Res> {
  factory _$$_SurveyParamModelCopyWith(
          _$_SurveyParamModel value, $Res Function(_$_SurveyParamModel) then) =
      __$$_SurveyParamModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? userId, List<SurveyResponseModel>? responses});
}

/// @nodoc
class __$$_SurveyParamModelCopyWithImpl<$Res>
    extends _$SurveyParamModelCopyWithImpl<$Res, _$_SurveyParamModel>
    implements _$$_SurveyParamModelCopyWith<$Res> {
  __$$_SurveyParamModelCopyWithImpl(
      _$_SurveyParamModel _value, $Res Function(_$_SurveyParamModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? responses = freezed,
  }) {
    return _then(_$_SurveyParamModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      responses: freezed == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<SurveyResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyParamModel implements _SurveyParamModel {
  _$_SurveyParamModel({this.userId, final List<SurveyResponseModel>? responses})
      : _responses = responses;

  factory _$_SurveyParamModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyParamModelFromJson(json);

  @override
  final int? userId;
  final List<SurveyResponseModel>? _responses;
  @override
  List<SurveyResponseModel>? get responses {
    final value = _responses;
    if (value == null) return null;
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SurveyParamModel(userId: $userId, responses: $responses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyParamModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_responses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyParamModelCopyWith<_$_SurveyParamModel> get copyWith =>
      __$$_SurveyParamModelCopyWithImpl<_$_SurveyParamModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyParamModelToJson(
      this,
    );
  }
}

abstract class _SurveyParamModel implements SurveyParamModel {
  factory _SurveyParamModel(
      {final int? userId,
      final List<SurveyResponseModel>? responses}) = _$_SurveyParamModel;

  factory _SurveyParamModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyParamModel.fromJson;

  @override
  int? get userId;
  @override
  List<SurveyResponseModel>? get responses;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyParamModelCopyWith<_$_SurveyParamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SurveyResponseModel _$SurveyResponseModelFromJson(Map<String, dynamic> json) {
  return _SurveyResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponseModel {
  int? get questionId => throw _privateConstructorUsedError;
  int? get answerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyResponseModelCopyWith<SurveyResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseModelCopyWith<$Res> {
  factory $SurveyResponseModelCopyWith(
          SurveyResponseModel value, $Res Function(SurveyResponseModel) then) =
      _$SurveyResponseModelCopyWithImpl<$Res, SurveyResponseModel>;
  @useResult
  $Res call({int? questionId, int? answerId});
}

/// @nodoc
class _$SurveyResponseModelCopyWithImpl<$Res, $Val extends SurveyResponseModel>
    implements $SurveyResponseModelCopyWith<$Res> {
  _$SurveyResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answerId = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyResponseModelCopyWith<$Res>
    implements $SurveyResponseModelCopyWith<$Res> {
  factory _$$_SurveyResponseModelCopyWith(_$_SurveyResponseModel value,
          $Res Function(_$_SurveyResponseModel) then) =
      __$$_SurveyResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? questionId, int? answerId});
}

/// @nodoc
class __$$_SurveyResponseModelCopyWithImpl<$Res>
    extends _$SurveyResponseModelCopyWithImpl<$Res, _$_SurveyResponseModel>
    implements _$$_SurveyResponseModelCopyWith<$Res> {
  __$$_SurveyResponseModelCopyWithImpl(_$_SurveyResponseModel _value,
      $Res Function(_$_SurveyResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answerId = freezed,
  }) {
    return _then(_$_SurveyResponseModel(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyResponseModel implements _SurveyResponseModel {
  _$_SurveyResponseModel({this.questionId, this.answerId});

  factory _$_SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyResponseModelFromJson(json);

  @override
  final int? questionId;
  @override
  final int? answerId;

  @override
  String toString() {
    return 'SurveyResponseModel(questionId: $questionId, answerId: $answerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyResponseModel &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, answerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyResponseModelCopyWith<_$_SurveyResponseModel> get copyWith =>
      __$$_SurveyResponseModelCopyWithImpl<_$_SurveyResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyResponseModelToJson(
      this,
    );
  }
}

abstract class _SurveyResponseModel implements SurveyResponseModel {
  factory _SurveyResponseModel({final int? questionId, final int? answerId}) =
      _$_SurveyResponseModel;

  factory _SurveyResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyResponseModel.fromJson;

  @override
  int? get questionId;
  @override
  int? get answerId;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyResponseModelCopyWith<_$_SurveyResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
