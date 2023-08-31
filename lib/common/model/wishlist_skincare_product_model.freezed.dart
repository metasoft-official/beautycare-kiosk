// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_skincare_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WishlistSkincareProductModel _$WishlistSkincareProductModelFromJson(
    Map<String, dynamic> json) {
  return _WishlistSkincareProductModel.fromJson(json);
}

/// @nodoc
mixin _$WishlistSkincareProductModel {
  int? get userId => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  SkinProductModel? get skincareProduct => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishlistSkincareProductModelCopyWith<WishlistSkincareProductModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistSkincareProductModelCopyWith<$Res> {
  factory $WishlistSkincareProductModelCopyWith(
          WishlistSkincareProductModel value,
          $Res Function(WishlistSkincareProductModel) then) =
      _$WishlistSkincareProductModelCopyWithImpl<$Res,
          WishlistSkincareProductModel>;
  @useResult
  $Res call({int? userId, int? parentId, SkinProductModel? skincareProduct});

  $SkinProductModelCopyWith<$Res>? get skincareProduct;
}

/// @nodoc
class _$WishlistSkincareProductModelCopyWithImpl<$Res,
        $Val extends WishlistSkincareProductModel>
    implements $WishlistSkincareProductModelCopyWith<$Res> {
  _$WishlistSkincareProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? skincareProduct = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      skincareProduct: freezed == skincareProduct
          ? _value.skincareProduct
          : skincareProduct // ignore: cast_nullable_to_non_nullable
              as SkinProductModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SkinProductModelCopyWith<$Res>? get skincareProduct {
    if (_value.skincareProduct == null) {
      return null;
    }

    return $SkinProductModelCopyWith<$Res>(_value.skincareProduct!, (value) {
      return _then(_value.copyWith(skincareProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WishlistSkincareProductModelCopyWith<$Res>
    implements $WishlistSkincareProductModelCopyWith<$Res> {
  factory _$$_WishlistSkincareProductModelCopyWith(
          _$_WishlistSkincareProductModel value,
          $Res Function(_$_WishlistSkincareProductModel) then) =
      __$$_WishlistSkincareProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? userId, int? parentId, SkinProductModel? skincareProduct});

  @override
  $SkinProductModelCopyWith<$Res>? get skincareProduct;
}

/// @nodoc
class __$$_WishlistSkincareProductModelCopyWithImpl<$Res>
    extends _$WishlistSkincareProductModelCopyWithImpl<$Res,
        _$_WishlistSkincareProductModel>
    implements _$$_WishlistSkincareProductModelCopyWith<$Res> {
  __$$_WishlistSkincareProductModelCopyWithImpl(
      _$_WishlistSkincareProductModel _value,
      $Res Function(_$_WishlistSkincareProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? parentId = freezed,
    Object? skincareProduct = freezed,
  }) {
    return _then(_$_WishlistSkincareProductModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      skincareProduct: freezed == skincareProduct
          ? _value.skincareProduct
          : skincareProduct // ignore: cast_nullable_to_non_nullable
              as SkinProductModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WishlistSkincareProductModel implements _WishlistSkincareProductModel {
  _$_WishlistSkincareProductModel(
      {this.userId, this.parentId, this.skincareProduct});

  factory _$_WishlistSkincareProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistSkincareProductModelFromJson(json);

  @override
  final int? userId;
  @override
  final int? parentId;
  @override
  final SkinProductModel? skincareProduct;

  @override
  String toString() {
    return 'WishlistSkincareProductModel(userId: $userId, parentId: $parentId, skincareProduct: $skincareProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishlistSkincareProductModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.skincareProduct, skincareProduct) ||
                other.skincareProduct == skincareProduct));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, parentId, skincareProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistSkincareProductModelCopyWith<_$_WishlistSkincareProductModel>
      get copyWith => __$$_WishlistSkincareProductModelCopyWithImpl<
          _$_WishlistSkincareProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistSkincareProductModelToJson(
      this,
    );
  }
}

abstract class _WishlistSkincareProductModel
    implements WishlistSkincareProductModel {
  factory _WishlistSkincareProductModel(
          {final int? userId,
          final int? parentId,
          final SkinProductModel? skincareProduct}) =
      _$_WishlistSkincareProductModel;

  factory _WishlistSkincareProductModel.fromJson(Map<String, dynamic> json) =
      _$_WishlistSkincareProductModel.fromJson;

  @override
  int? get userId;
  @override
  int? get parentId;
  @override
  SkinProductModel? get skincareProduct;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistSkincareProductModelCopyWith<_$_WishlistSkincareProductModel>
      get copyWith => throw _privateConstructorUsedError;
}
