// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_trend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchTrendModel _$SearchTrendModelFromJson(Map<String, dynamic> json) {
  return _SearchTrendModel.fromJson(json);
}

/// @nodoc
mixin _$SearchTrendModel {
  int? get id => throw _privateConstructorUsedError;
  String? get searchKeyword => throw _privateConstructorUsedError;
  String? get visibilityStatus => throw _privateConstructorUsedError;
  int? get title => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchTrendModelCopyWith<SearchTrendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTrendModelCopyWith<$Res> {
  factory $SearchTrendModelCopyWith(
          SearchTrendModel value, $Res Function(SearchTrendModel) then) =
      _$SearchTrendModelCopyWithImpl<$Res, SearchTrendModel>;
  @useResult
  $Res call(
      {int? id,
      String? searchKeyword,
      String? visibilityStatus,
      int? title,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class _$SearchTrendModelCopyWithImpl<$Res, $Val extends SearchTrendModel>
    implements $SearchTrendModelCopyWith<$Res> {
  _$SearchTrendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? searchKeyword = freezed,
    Object? visibilityStatus = freezed,
    Object? title = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeyword: freezed == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_SearchTrendModelCopyWith<$Res>
    implements $SearchTrendModelCopyWith<$Res> {
  factory _$$_SearchTrendModelCopyWith(
          _$_SearchTrendModel value, $Res Function(_$_SearchTrendModel) then) =
      __$$_SearchTrendModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? searchKeyword,
      String? visibilityStatus,
      int? title,
      DateTime? createdDate,
      DateTime? lastModifiedDate});
}

/// @nodoc
class __$$_SearchTrendModelCopyWithImpl<$Res>
    extends _$SearchTrendModelCopyWithImpl<$Res, _$_SearchTrendModel>
    implements _$$_SearchTrendModelCopyWith<$Res> {
  __$$_SearchTrendModelCopyWithImpl(
      _$_SearchTrendModel _value, $Res Function(_$_SearchTrendModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? searchKeyword = freezed,
    Object? visibilityStatus = freezed,
    Object? title = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_SearchTrendModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      searchKeyword: freezed == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_SearchTrendModel implements _SearchTrendModel {
  _$_SearchTrendModel(
      {this.id,
      this.searchKeyword,
      this.visibilityStatus,
      this.title,
      this.createdDate,
      this.lastModifiedDate});

  factory _$_SearchTrendModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchTrendModelFromJson(json);

  @override
  final int? id;
  @override
  final String? searchKeyword;
  @override
  final String? visibilityStatus;
  @override
  final int? title;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? lastModifiedDate;

  @override
  String toString() {
    return 'SearchTrendModel(id: $id, searchKeyword: $searchKeyword, visibilityStatus: $visibilityStatus, title: $title, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTrendModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.searchKeyword, searchKeyword) ||
                other.searchKeyword == searchKeyword) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                other.visibilityStatus == visibilityStatus) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, searchKeyword,
      visibilityStatus, title, createdDate, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchTrendModelCopyWith<_$_SearchTrendModel> get copyWith =>
      __$$_SearchTrendModelCopyWithImpl<_$_SearchTrendModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchTrendModelToJson(
      this,
    );
  }
}

abstract class _SearchTrendModel implements SearchTrendModel {
  factory _SearchTrendModel(
      {final int? id,
      final String? searchKeyword,
      final String? visibilityStatus,
      final int? title,
      final DateTime? createdDate,
      final DateTime? lastModifiedDate}) = _$_SearchTrendModel;

  factory _SearchTrendModel.fromJson(Map<String, dynamic> json) =
      _$_SearchTrendModel.fromJson;

  @override
  int? get id;
  @override
  String? get searchKeyword;
  @override
  String? get visibilityStatus;
  @override
  int? get title;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_SearchTrendModelCopyWith<_$_SearchTrendModel> get copyWith =>
      throw _privateConstructorUsedError;
}
