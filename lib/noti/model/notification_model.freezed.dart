// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  int? get id => throw _privateConstructorUsedError;
  int? get categoryCode => throw _privateConstructorUsedError;
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get sendDate => throw _privateConstructorUsedError;
  int? get targetCodeDepth1 => throw _privateConstructorUsedError;
  int? get targetCodeDepth2 => throw _privateConstructorUsedError;
  String? get targetUsername => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get targetDepth1Name => throw _privateConstructorUsedError;
  String? get targetDepth2Name => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {int? id,
      int? categoryCode,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? sendDate,
      int? targetCodeDepth1,
      int? targetCodeDepth2,
      String? targetUsername,
      String? subject,
      String? content,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? lastModifiedDate,
      String? categoryName,
      String? targetDepth1Name,
      String? targetDepth2Name,
      String? topic});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryCode = freezed,
    Object? sendDate = freezed,
    Object? targetCodeDepth1 = freezed,
    Object? targetCodeDepth2 = freezed,
    Object? targetUsername = freezed,
    Object? subject = freezed,
    Object? content = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
    Object? categoryName = freezed,
    Object? targetDepth1Name = freezed,
    Object? targetDepth2Name = freezed,
    Object? topic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryCode: freezed == categoryCode
          ? _value.categoryCode
          : categoryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      sendDate: freezed == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetCodeDepth1: freezed == targetCodeDepth1
          ? _value.targetCodeDepth1
          : targetCodeDepth1 // ignore: cast_nullable_to_non_nullable
              as int?,
      targetCodeDepth2: freezed == targetCodeDepth2
          ? _value.targetCodeDepth2
          : targetCodeDepth2 // ignore: cast_nullable_to_non_nullable
              as int?,
      targetUsername: freezed == targetUsername
          ? _value.targetUsername
          : targetUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      targetDepth1Name: freezed == targetDepth1Name
          ? _value.targetDepth1Name
          : targetDepth1Name // ignore: cast_nullable_to_non_nullable
              as String?,
      targetDepth2Name: freezed == targetDepth2Name
          ? _value.targetDepth2Name
          : targetDepth2Name // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$_NotificationModelCopyWith(_$_NotificationModel value,
          $Res Function(_$_NotificationModel) then) =
      __$$_NotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? categoryCode,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? sendDate,
      int? targetCodeDepth1,
      int? targetCodeDepth2,
      String? targetUsername,
      String? subject,
      String? content,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? lastModifiedDate,
      String? categoryName,
      String? targetDepth1Name,
      String? targetDepth2Name,
      String? topic});
}

/// @nodoc
class __$$_NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$_NotificationModel>
    implements _$$_NotificationModelCopyWith<$Res> {
  __$$_NotificationModelCopyWithImpl(
      _$_NotificationModel _value, $Res Function(_$_NotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryCode = freezed,
    Object? sendDate = freezed,
    Object? targetCodeDepth1 = freezed,
    Object? targetCodeDepth2 = freezed,
    Object? targetUsername = freezed,
    Object? subject = freezed,
    Object? content = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
    Object? categoryName = freezed,
    Object? targetDepth1Name = freezed,
    Object? targetDepth2Name = freezed,
    Object? topic = freezed,
  }) {
    return _then(_$_NotificationModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryCode: freezed == categoryCode
          ? _value.categoryCode
          : categoryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      sendDate: freezed == sendDate
          ? _value.sendDate
          : sendDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetCodeDepth1: freezed == targetCodeDepth1
          ? _value.targetCodeDepth1
          : targetCodeDepth1 // ignore: cast_nullable_to_non_nullable
              as int?,
      targetCodeDepth2: freezed == targetCodeDepth2
          ? _value.targetCodeDepth2
          : targetCodeDepth2 // ignore: cast_nullable_to_non_nullable
              as int?,
      targetUsername: freezed == targetUsername
          ? _value.targetUsername
          : targetUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      targetDepth1Name: freezed == targetDepth1Name
          ? _value.targetDepth1Name
          : targetDepth1Name // ignore: cast_nullable_to_non_nullable
              as String?,
      targetDepth2Name: freezed == targetDepth2Name
          ? _value.targetDepth2Name
          : targetDepth2Name // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel implements _NotificationModel {
  _$_NotificationModel(
      {this.id,
      this.categoryCode,
      @JsonKey(toJson: datetimeToLocalDateTime) this.sendDate,
      this.targetCodeDepth1,
      this.targetCodeDepth2,
      this.targetUsername,
      this.subject,
      this.content,
      @JsonKey(toJson: datetimeToLocalDateTime) this.createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime) this.lastModifiedDate,
      this.categoryName,
      this.targetDepth1Name,
      this.targetDepth2Name,
      this.topic});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationModelFromJson(json);

  @override
  final int? id;
  @override
  final int? categoryCode;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  final DateTime? sendDate;
  @override
  final int? targetCodeDepth1;
  @override
  final int? targetCodeDepth2;
  @override
  final String? targetUsername;
  @override
  final String? subject;
  @override
  final String? content;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  final DateTime? createdDate;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  final DateTime? lastModifiedDate;
  @override
  final String? categoryName;
  @override
  final String? targetDepth1Name;
  @override
  final String? targetDepth2Name;
  @override
  final String? topic;

  @override
  String toString() {
    return 'NotificationModel(id: $id, categoryCode: $categoryCode, sendDate: $sendDate, targetCodeDepth1: $targetCodeDepth1, targetCodeDepth2: $targetCodeDepth2, targetUsername: $targetUsername, subject: $subject, content: $content, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate, categoryName: $categoryName, targetDepth1Name: $targetDepth1Name, targetDepth2Name: $targetDepth2Name, topic: $topic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryCode, categoryCode) ||
                other.categoryCode == categoryCode) &&
            (identical(other.sendDate, sendDate) ||
                other.sendDate == sendDate) &&
            (identical(other.targetCodeDepth1, targetCodeDepth1) ||
                other.targetCodeDepth1 == targetCodeDepth1) &&
            (identical(other.targetCodeDepth2, targetCodeDepth2) ||
                other.targetCodeDepth2 == targetCodeDepth2) &&
            (identical(other.targetUsername, targetUsername) ||
                other.targetUsername == targetUsername) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.targetDepth1Name, targetDepth1Name) ||
                other.targetDepth1Name == targetDepth1Name) &&
            (identical(other.targetDepth2Name, targetDepth2Name) ||
                other.targetDepth2Name == targetDepth2Name) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryCode,
      sendDate,
      targetCodeDepth1,
      targetCodeDepth2,
      targetUsername,
      subject,
      content,
      createdDate,
      lastModifiedDate,
      categoryName,
      targetDepth1Name,
      targetDepth2Name,
      topic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      __$$_NotificationModelCopyWithImpl<_$_NotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationModelToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {final int? id,
      final int? categoryCode,
      @JsonKey(toJson: datetimeToLocalDateTime)
          final DateTime? sendDate,
      final int? targetCodeDepth1,
      final int? targetCodeDepth2,
      final String? targetUsername,
      final String? subject,
      final String? content,
      @JsonKey(toJson: datetimeToLocalDateTime)
          final DateTime? createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime)
          final DateTime? lastModifiedDate,
      final String? categoryName,
      final String? targetDepth1Name,
      final String? targetDepth2Name,
      final String? topic}) = _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  int? get id;
  @override
  int? get categoryCode;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get sendDate;
  @override
  int? get targetCodeDepth1;
  @override
  int? get targetCodeDepth2;
  @override
  String? get targetUsername;
  @override
  String? get subject;
  @override
  String? get content;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get createdDate;
  @override
  @JsonKey(toJson: datetimeToLocalDateTime)
  DateTime? get lastModifiedDate;
  @override
  String? get categoryName;
  @override
  String? get targetDepth1Name;
  @override
  String? get targetDepth2Name;
  @override
  String? get topic;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
