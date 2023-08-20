// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) {
  return _PromotionModel.fromJson(json);
}

/// @nodoc
mixin _$PromotionModel {
  int? get id => throw _privateConstructorUsedError;
  int? get categoryCode => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get promotionImageId => throw _privateConstructorUsedError;
  IntegratedAttachFileModel? get promotionImage =>
      throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get visibilityStatus => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionModelCopyWith<PromotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionModelCopyWith<$Res> {
  factory $PromotionModelCopyWith(
          PromotionModel value, $Res Function(PromotionModel) then) =
      _$PromotionModelCopyWithImpl<$Res, PromotionModel>;
  @useResult
  $Res call(
      {int? id,
      int? categoryCode,
      String? categoryName,
      String? title,
      int? promotionImageId,
      IntegratedAttachFileModel? promotionImage,
      DateTime? startDate,
      DateTime? endDate,
      String? description,
      String? link,
      String? visibilityStatus,
      int? order,
      DateTime? createdDate,
      DateTime? lastModifiedDate});

  $IntegratedAttachFileModelCopyWith<$Res>? get promotionImage;
}

/// @nodoc
class _$PromotionModelCopyWithImpl<$Res, $Val extends PromotionModel>
    implements $PromotionModelCopyWith<$Res> {
  _$PromotionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryCode = freezed,
    Object? categoryName = freezed,
    Object? title = freezed,
    Object? promotionImageId = freezed,
    Object? promotionImage = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? description = freezed,
    Object? link = freezed,
    Object? visibilityStatus = freezed,
    Object? order = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
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
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionImageId: freezed == promotionImageId
          ? _value.promotionImageId
          : promotionImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionImage: freezed == promotionImage
          ? _value.promotionImage
          : promotionImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $IntegratedAttachFileModelCopyWith<$Res>? get promotionImage {
    if (_value.promotionImage == null) {
      return null;
    }

    return $IntegratedAttachFileModelCopyWith<$Res>(_value.promotionImage!,
        (value) {
      return _then(_value.copyWith(promotionImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PromotionModelCopyWith<$Res>
    implements $PromotionModelCopyWith<$Res> {
  factory _$$_PromotionModelCopyWith(
          _$_PromotionModel value, $Res Function(_$_PromotionModel) then) =
      __$$_PromotionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? categoryCode,
      String? categoryName,
      String? title,
      int? promotionImageId,
      IntegratedAttachFileModel? promotionImage,
      DateTime? startDate,
      DateTime? endDate,
      String? description,
      String? link,
      String? visibilityStatus,
      int? order,
      DateTime? createdDate,
      DateTime? lastModifiedDate});

  @override
  $IntegratedAttachFileModelCopyWith<$Res>? get promotionImage;
}

/// @nodoc
class __$$_PromotionModelCopyWithImpl<$Res>
    extends _$PromotionModelCopyWithImpl<$Res, _$_PromotionModel>
    implements _$$_PromotionModelCopyWith<$Res> {
  __$$_PromotionModelCopyWithImpl(
      _$_PromotionModel _value, $Res Function(_$_PromotionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryCode = freezed,
    Object? categoryName = freezed,
    Object? title = freezed,
    Object? promotionImageId = freezed,
    Object? promotionImage = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? description = freezed,
    Object? link = freezed,
    Object? visibilityStatus = freezed,
    Object? order = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_PromotionModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryCode: freezed == categoryCode
          ? _value.categoryCode
          : categoryCode // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionImageId: freezed == promotionImageId
          ? _value.promotionImageId
          : promotionImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionImage: freezed == promotionImage
          ? _value.promotionImage
          : promotionImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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
class _$_PromotionModel implements _PromotionModel {
  _$_PromotionModel(
      {this.id,
      this.categoryCode,
      this.categoryName,
      this.title,
      this.promotionImageId,
      this.promotionImage,
      this.startDate,
      this.endDate,
      this.description,
      this.link,
      this.visibilityStatus,
      this.order,
      this.createdDate,
      this.lastModifiedDate});

  factory _$_PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionModelFromJson(json);

  @override
  final int? id;
  @override
  final int? categoryCode;
  @override
  final String? categoryName;
  @override
  final String? title;
  @override
  final int? promotionImageId;
  @override
  final IntegratedAttachFileModel? promotionImage;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? description;
  @override
  final String? link;
  @override
  final String? visibilityStatus;
  @override
  final int? order;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? lastModifiedDate;

  @override
  String toString() {
    return 'PromotionModel(id: $id, categoryCode: $categoryCode, categoryName: $categoryName, title: $title, promotionImageId: $promotionImageId, promotionImage: $promotionImage, startDate: $startDate, endDate: $endDate, description: $description, link: $link, visibilityStatus: $visibilityStatus, order: $order, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromotionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryCode, categoryCode) ||
                other.categoryCode == categoryCode) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.promotionImageId, promotionImageId) ||
                other.promotionImageId == promotionImageId) &&
            (identical(other.promotionImage, promotionImage) ||
                other.promotionImage == promotionImage) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                other.visibilityStatus == visibilityStatus) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryCode,
      categoryName,
      title,
      promotionImageId,
      promotionImage,
      startDate,
      endDate,
      description,
      link,
      visibilityStatus,
      order,
      createdDate,
      lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromotionModelCopyWith<_$_PromotionModel> get copyWith =>
      __$$_PromotionModelCopyWithImpl<_$_PromotionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionModelToJson(
      this,
    );
  }
}

abstract class _PromotionModel implements PromotionModel {
  factory _PromotionModel(
      {final int? id,
      final int? categoryCode,
      final String? categoryName,
      final String? title,
      final int? promotionImageId,
      final IntegratedAttachFileModel? promotionImage,
      final DateTime? startDate,
      final DateTime? endDate,
      final String? description,
      final String? link,
      final String? visibilityStatus,
      final int? order,
      final DateTime? createdDate,
      final DateTime? lastModifiedDate}) = _$_PromotionModel;

  factory _PromotionModel.fromJson(Map<String, dynamic> json) =
      _$_PromotionModel.fromJson;

  @override
  int? get id;
  @override
  int? get categoryCode;
  @override
  String? get categoryName;
  @override
  String? get title;
  @override
  int? get promotionImageId;
  @override
  IntegratedAttachFileModel? get promotionImage;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get description;
  @override
  String? get link;
  @override
  String? get visibilityStatus;
  @override
  int? get order;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_PromotionModelCopyWith<_$_PromotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
