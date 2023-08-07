// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageResponse<T> _$PageResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PageResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PageResponse<T> {
  bool? get hasNext => throw _privateConstructorUsedError;
  bool? get hasPrevious => throw _privateConstructorUsedError;
  bool? get isFirst => throw _privateConstructorUsedError;
  bool? get isLast => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pageEnd => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get pageStart => throw _privateConstructorUsedError;
  int? get rowEnd => throw _privateConstructorUsedError;
  int? get rowSize => throw _privateConstructorUsedError;
  int? get rowStart => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalRows => throw _privateConstructorUsedError;
  List<T>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageResponseCopyWith<T, PageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageResponseCopyWith<T, $Res> {
  factory $PageResponseCopyWith(
          PageResponse<T> value, $Res Function(PageResponse<T>) then) =
      _$PageResponseCopyWithImpl<T, $Res, PageResponse<T>>;
  @useResult
  $Res call(
      {bool? hasNext,
      bool? hasPrevious,
      bool? isFirst,
      bool? isLast,
      int? page,
      int? pageEnd,
      int? pageSize,
      int? pageStart,
      int? rowEnd,
      int? rowSize,
      int? rowStart,
      int? totalPages,
      int? totalRows,
      List<T>? items});
}

/// @nodoc
class _$PageResponseCopyWithImpl<T, $Res, $Val extends PageResponse<T>>
    implements $PageResponseCopyWith<T, $Res> {
  _$PageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
    Object? isFirst = freezed,
    Object? isLast = freezed,
    Object? page = freezed,
    Object? pageEnd = freezed,
    Object? pageSize = freezed,
    Object? pageStart = freezed,
    Object? rowEnd = freezed,
    Object? rowSize = freezed,
    Object? rowStart = freezed,
    Object? totalPages = freezed,
    Object? totalRows = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrevious: freezed == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFirst: freezed == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLast: freezed == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageEnd: freezed == pageEnd
          ? _value.pageEnd
          : pageEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageStart: freezed == pageStart
          ? _value.pageStart
          : pageStart // ignore: cast_nullable_to_non_nullable
              as int?,
      rowEnd: freezed == rowEnd
          ? _value.rowEnd
          : rowEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      rowSize: freezed == rowSize
          ? _value.rowSize
          : rowSize // ignore: cast_nullable_to_non_nullable
              as int?,
      rowStart: freezed == rowStart
          ? _value.rowStart
          : rowStart // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRows: freezed == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageResponseCopyWith<T, $Res>
    implements $PageResponseCopyWith<T, $Res> {
  factory _$$_PageResponseCopyWith(
          _$_PageResponse<T> value, $Res Function(_$_PageResponse<T>) then) =
      __$$_PageResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool? hasNext,
      bool? hasPrevious,
      bool? isFirst,
      bool? isLast,
      int? page,
      int? pageEnd,
      int? pageSize,
      int? pageStart,
      int? rowEnd,
      int? rowSize,
      int? rowStart,
      int? totalPages,
      int? totalRows,
      List<T>? items});
}

/// @nodoc
class __$$_PageResponseCopyWithImpl<T, $Res>
    extends _$PageResponseCopyWithImpl<T, $Res, _$_PageResponse<T>>
    implements _$$_PageResponseCopyWith<T, $Res> {
  __$$_PageResponseCopyWithImpl(
      _$_PageResponse<T> _value, $Res Function(_$_PageResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = freezed,
    Object? hasPrevious = freezed,
    Object? isFirst = freezed,
    Object? isLast = freezed,
    Object? page = freezed,
    Object? pageEnd = freezed,
    Object? pageSize = freezed,
    Object? pageStart = freezed,
    Object? rowEnd = freezed,
    Object? rowSize = freezed,
    Object? rowStart = freezed,
    Object? totalPages = freezed,
    Object? totalRows = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_PageResponse<T>(
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrevious: freezed == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFirst: freezed == isFirst
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLast: freezed == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageEnd: freezed == pageEnd
          ? _value.pageEnd
          : pageEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageStart: freezed == pageStart
          ? _value.pageStart
          : pageStart // ignore: cast_nullable_to_non_nullable
              as int?,
      rowEnd: freezed == rowEnd
          ? _value.rowEnd
          : rowEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      rowSize: freezed == rowSize
          ? _value.rowSize
          : rowSize // ignore: cast_nullable_to_non_nullable
              as int?,
      rowStart: freezed == rowStart
          ? _value.rowStart
          : rowStart // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalRows: freezed == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_PageResponse<T> implements _PageResponse<T> {
  _$_PageResponse(
      {this.hasNext,
      this.hasPrevious,
      this.isFirst,
      this.isLast,
      this.page,
      this.pageEnd,
      this.pageSize,
      this.pageStart,
      this.rowEnd,
      this.rowSize,
      this.rowStart,
      this.totalPages,
      this.totalRows,
      final List<T>? items})
      : _items = items;

  factory _$_PageResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PageResponseFromJson(json, fromJsonT);

  @override
  final bool? hasNext;
  @override
  final bool? hasPrevious;
  @override
  final bool? isFirst;
  @override
  final bool? isLast;
  @override
  final int? page;
  @override
  final int? pageEnd;
  @override
  final int? pageSize;
  @override
  final int? pageStart;
  @override
  final int? rowEnd;
  @override
  final int? rowSize;
  @override
  final int? rowStart;
  @override
  final int? totalPages;
  @override
  final int? totalRows;
  final List<T>? _items;
  @override
  List<T>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PageResponse<$T>(hasNext: $hasNext, hasPrevious: $hasPrevious, isFirst: $isFirst, isLast: $isLast, page: $page, pageEnd: $pageEnd, pageSize: $pageSize, pageStart: $pageStart, rowEnd: $rowEnd, rowSize: $rowSize, rowStart: $rowStart, totalPages: $totalPages, totalRows: $totalRows, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageResponse<T> &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious) &&
            (identical(other.isFirst, isFirst) || other.isFirst == isFirst) &&
            (identical(other.isLast, isLast) || other.isLast == isLast) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageEnd, pageEnd) || other.pageEnd == pageEnd) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageStart, pageStart) ||
                other.pageStart == pageStart) &&
            (identical(other.rowEnd, rowEnd) || other.rowEnd == rowEnd) &&
            (identical(other.rowSize, rowSize) || other.rowSize == rowSize) &&
            (identical(other.rowStart, rowStart) ||
                other.rowStart == rowStart) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalRows, totalRows) ||
                other.totalRows == totalRows) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasNext,
      hasPrevious,
      isFirst,
      isLast,
      page,
      pageEnd,
      pageSize,
      pageStart,
      rowEnd,
      rowSize,
      rowStart,
      totalPages,
      totalRows,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageResponseCopyWith<T, _$_PageResponse<T>> get copyWith =>
      __$$_PageResponseCopyWithImpl<T, _$_PageResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PageResponseToJson<T>(this, toJsonT);
  }
}

abstract class _PageResponse<T> implements PageResponse<T> {
  factory _PageResponse(
      {final bool? hasNext,
      final bool? hasPrevious,
      final bool? isFirst,
      final bool? isLast,
      final int? page,
      final int? pageEnd,
      final int? pageSize,
      final int? pageStart,
      final int? rowEnd,
      final int? rowSize,
      final int? rowStart,
      final int? totalPages,
      final int? totalRows,
      final List<T>? items}) = _$_PageResponse<T>;

  factory _PageResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_PageResponse<T>.fromJson;

  @override
  bool? get hasNext;
  @override
  bool? get hasPrevious;
  @override
  bool? get isFirst;
  @override
  bool? get isLast;
  @override
  int? get page;
  @override
  int? get pageEnd;
  @override
  int? get pageSize;
  @override
  int? get pageStart;
  @override
  int? get rowEnd;
  @override
  int? get rowSize;
  @override
  int? get rowStart;
  @override
  int? get totalPages;
  @override
  int? get totalRows;
  @override
  List<T>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_PageResponseCopyWith<T, _$_PageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
