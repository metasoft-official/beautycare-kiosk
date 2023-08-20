// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurveyAnswerModel _$SurveyAnswerModelFromJson(Map<String, dynamic> json) {
  return _SurveyAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyAnswerModel {
  int? get id => throw _privateConstructorUsedError;
  int? get questionId => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyAnswerModelCopyWith<SurveyAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyAnswerModelCopyWith<$Res> {
  factory $SurveyAnswerModelCopyWith(
          SurveyAnswerModel value, $Res Function(SurveyAnswerModel) then) =
      _$SurveyAnswerModelCopyWithImpl<$Res, SurveyAnswerModel>;
  @useResult
  $Res call({int? id, int? questionId, String? answer, int? order, int? score});
}

/// @nodoc
class _$SurveyAnswerModelCopyWithImpl<$Res, $Val extends SurveyAnswerModel>
    implements $SurveyAnswerModelCopyWith<$Res> {
  _$SurveyAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
    Object? order = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurveyAnswerModelCopyWith<$Res>
    implements $SurveyAnswerModelCopyWith<$Res> {
  factory _$$_SurveyAnswerModelCopyWith(_$_SurveyAnswerModel value,
          $Res Function(_$_SurveyAnswerModel) then) =
      __$$_SurveyAnswerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? questionId, String? answer, int? order, int? score});
}

/// @nodoc
class __$$_SurveyAnswerModelCopyWithImpl<$Res>
    extends _$SurveyAnswerModelCopyWithImpl<$Res, _$_SurveyAnswerModel>
    implements _$$_SurveyAnswerModelCopyWith<$Res> {
  __$$_SurveyAnswerModelCopyWithImpl(
      _$_SurveyAnswerModel _value, $Res Function(_$_SurveyAnswerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? answer = freezed,
    Object? order = freezed,
    Object? score = freezed,
  }) {
    return _then(_$_SurveyAnswerModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurveyAnswerModel implements _SurveyAnswerModel {
  _$_SurveyAnswerModel(
      {this.id, this.questionId, this.answer, this.order, this.score});

  factory _$_SurveyAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyAnswerModelFromJson(json);

  @override
  final int? id;
  @override
  final int? questionId;
  @override
  final String? answer;
  @override
  final int? order;
  @override
  final int? score;

  @override
  String toString() {
    return 'SurveyAnswerModel(id: $id, questionId: $questionId, answer: $answer, order: $order, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurveyAnswerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, questionId, answer, order, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurveyAnswerModelCopyWith<_$_SurveyAnswerModel> get copyWith =>
      __$$_SurveyAnswerModelCopyWithImpl<_$_SurveyAnswerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyAnswerModelToJson(
      this,
    );
  }
}

abstract class _SurveyAnswerModel implements SurveyAnswerModel {
  factory _SurveyAnswerModel(
      {final int? id,
      final int? questionId,
      final String? answer,
      final int? order,
      final int? score}) = _$_SurveyAnswerModel;

  factory _SurveyAnswerModel.fromJson(Map<String, dynamic> json) =
      _$_SurveyAnswerModel.fromJson;

  @override
  int? get id;
  @override
  int? get questionId;
  @override
  String? get answer;
  @override
  int? get order;
  @override
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyAnswerModelCopyWith<_$_SurveyAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
