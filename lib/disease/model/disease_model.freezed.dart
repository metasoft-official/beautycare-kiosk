// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseModel _$DiseaseModelFromJson(Map<String, dynamic> json) {
  return _DiseaseModel.fromJson(json);
}

/// @nodoc
mixin _$DiseaseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get nameEng => throw _privateConstructorUsedError;
  int? get diseaseImageId => throw _privateConstructorUsedError;
  IntegratedAttachFileModel? get diseaseImage =>
      throw _privateConstructorUsedError;
  String? get symptoms => throw _privateConstructorUsedError;
  String? get cause => throw _privateConstructorUsedError;
  String? get test => throw _privateConstructorUsedError;
  String? get treatment => throw _privateConstructorUsedError;
  String? get prevention => throw _privateConstructorUsedError;
  int? get clinicImageId => throw _privateConstructorUsedError;
  IntegratedAttachFileModel? get clinicImage =>
      throw _privateConstructorUsedError;
  String? get visibilityStatus => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseModelCopyWith<DiseaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseModelCopyWith<$Res> {
  factory $DiseaseModelCopyWith(
          DiseaseModel value, $Res Function(DiseaseModel) then) =
      _$DiseaseModelCopyWithImpl<$Res, DiseaseModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? nameEng,
      int? diseaseImageId,
      IntegratedAttachFileModel? diseaseImage,
      String? symptoms,
      String? cause,
      String? test,
      String? treatment,
      String? prevention,
      int? clinicImageId,
      IntegratedAttachFileModel? clinicImage,
      String? visibilityStatus,
      DateTime? createdDate,
      DateTime? lastModifiedDate});

  $IntegratedAttachFileModelCopyWith<$Res>? get diseaseImage;
  $IntegratedAttachFileModelCopyWith<$Res>? get clinicImage;
}

/// @nodoc
class _$DiseaseModelCopyWithImpl<$Res, $Val extends DiseaseModel>
    implements $DiseaseModelCopyWith<$Res> {
  _$DiseaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEng = freezed,
    Object? diseaseImageId = freezed,
    Object? diseaseImage = freezed,
    Object? symptoms = freezed,
    Object? cause = freezed,
    Object? test = freezed,
    Object? treatment = freezed,
    Object? prevention = freezed,
    Object? clinicImageId = freezed,
    Object? clinicImage = freezed,
    Object? visibilityStatus = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEng: freezed == nameEng
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String?,
      diseaseImageId: freezed == diseaseImageId
          ? _value.diseaseImageId
          : diseaseImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseImage: freezed == diseaseImage
          ? _value.diseaseImage
          : diseaseImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      symptoms: freezed == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
      treatment: freezed == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevention: freezed == prevention
          ? _value.prevention
          : prevention // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicImageId: freezed == clinicImageId
          ? _value.clinicImageId
          : clinicImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicImage: freezed == clinicImage
          ? _value.clinicImage
          : clinicImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $IntegratedAttachFileModelCopyWith<$Res>? get diseaseImage {
    if (_value.diseaseImage == null) {
      return null;
    }

    return $IntegratedAttachFileModelCopyWith<$Res>(_value.diseaseImage!,
        (value) {
      return _then(_value.copyWith(diseaseImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IntegratedAttachFileModelCopyWith<$Res>? get clinicImage {
    if (_value.clinicImage == null) {
      return null;
    }

    return $IntegratedAttachFileModelCopyWith<$Res>(_value.clinicImage!,
        (value) {
      return _then(_value.copyWith(clinicImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiseaseModelCopyWith<$Res>
    implements $DiseaseModelCopyWith<$Res> {
  factory _$$_DiseaseModelCopyWith(
          _$_DiseaseModel value, $Res Function(_$_DiseaseModel) then) =
      __$$_DiseaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? nameEng,
      int? diseaseImageId,
      IntegratedAttachFileModel? diseaseImage,
      String? symptoms,
      String? cause,
      String? test,
      String? treatment,
      String? prevention,
      int? clinicImageId,
      IntegratedAttachFileModel? clinicImage,
      String? visibilityStatus,
      DateTime? createdDate,
      DateTime? lastModifiedDate});

  @override
  $IntegratedAttachFileModelCopyWith<$Res>? get diseaseImage;
  @override
  $IntegratedAttachFileModelCopyWith<$Res>? get clinicImage;
}

/// @nodoc
class __$$_DiseaseModelCopyWithImpl<$Res>
    extends _$DiseaseModelCopyWithImpl<$Res, _$_DiseaseModel>
    implements _$$_DiseaseModelCopyWith<$Res> {
  __$$_DiseaseModelCopyWithImpl(
      _$_DiseaseModel _value, $Res Function(_$_DiseaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nameEng = freezed,
    Object? diseaseImageId = freezed,
    Object? diseaseImage = freezed,
    Object? symptoms = freezed,
    Object? cause = freezed,
    Object? test = freezed,
    Object? treatment = freezed,
    Object? prevention = freezed,
    Object? clinicImageId = freezed,
    Object? clinicImage = freezed,
    Object? visibilityStatus = freezed,
    Object? createdDate = freezed,
    Object? lastModifiedDate = freezed,
  }) {
    return _then(_$_DiseaseModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEng: freezed == nameEng
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String?,
      diseaseImageId: freezed == diseaseImageId
          ? _value.diseaseImageId
          : diseaseImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseImage: freezed == diseaseImage
          ? _value.diseaseImage
          : diseaseImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      symptoms: freezed == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
      treatment: freezed == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String?,
      prevention: freezed == prevention
          ? _value.prevention
          : prevention // ignore: cast_nullable_to_non_nullable
              as String?,
      clinicImageId: freezed == clinicImageId
          ? _value.clinicImageId
          : clinicImageId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicImage: freezed == clinicImage
          ? _value.clinicImage
          : clinicImage // ignore: cast_nullable_to_non_nullable
              as IntegratedAttachFileModel?,
      visibilityStatus: freezed == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_DiseaseModel implements _DiseaseModel {
  _$_DiseaseModel(
      {this.id,
      this.name,
      this.nameEng,
      this.diseaseImageId,
      this.diseaseImage,
      this.symptoms,
      this.cause,
      this.test,
      this.treatment,
      this.prevention,
      this.clinicImageId,
      this.clinicImage,
      this.visibilityStatus,
      this.createdDate,
      this.lastModifiedDate});

  factory _$_DiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? nameEng;
  @override
  final int? diseaseImageId;
  @override
  final IntegratedAttachFileModel? diseaseImage;
  @override
  final String? symptoms;
  @override
  final String? cause;
  @override
  final String? test;
  @override
  final String? treatment;
  @override
  final String? prevention;
  @override
  final int? clinicImageId;
  @override
  final IntegratedAttachFileModel? clinicImage;
  @override
  final String? visibilityStatus;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? lastModifiedDate;

  @override
  String toString() {
    return 'DiseaseModel(id: $id, name: $name, nameEng: $nameEng, diseaseImageId: $diseaseImageId, diseaseImage: $diseaseImage, symptoms: $symptoms, cause: $cause, test: $test, treatment: $treatment, prevention: $prevention, clinicImageId: $clinicImageId, clinicImage: $clinicImage, visibilityStatus: $visibilityStatus, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEng, nameEng) || other.nameEng == nameEng) &&
            (identical(other.diseaseImageId, diseaseImageId) ||
                other.diseaseImageId == diseaseImageId) &&
            (identical(other.diseaseImage, diseaseImage) ||
                other.diseaseImage == diseaseImage) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.cause, cause) || other.cause == cause) &&
            (identical(other.test, test) || other.test == test) &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.prevention, prevention) ||
                other.prevention == prevention) &&
            (identical(other.clinicImageId, clinicImageId) ||
                other.clinicImageId == clinicImageId) &&
            (identical(other.clinicImage, clinicImage) ||
                other.clinicImage == clinicImage) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                other.visibilityStatus == visibilityStatus) &&
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
      name,
      nameEng,
      diseaseImageId,
      diseaseImage,
      symptoms,
      cause,
      test,
      treatment,
      prevention,
      clinicImageId,
      clinicImage,
      visibilityStatus,
      createdDate,
      lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseModelCopyWith<_$_DiseaseModel> get copyWith =>
      __$$_DiseaseModelCopyWithImpl<_$_DiseaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseModelToJson(
      this,
    );
  }
}

abstract class _DiseaseModel implements DiseaseModel {
  factory _DiseaseModel(
      {final int? id,
      final String? name,
      final String? nameEng,
      final int? diseaseImageId,
      final IntegratedAttachFileModel? diseaseImage,
      final String? symptoms,
      final String? cause,
      final String? test,
      final String? treatment,
      final String? prevention,
      final int? clinicImageId,
      final IntegratedAttachFileModel? clinicImage,
      final String? visibilityStatus,
      final DateTime? createdDate,
      final DateTime? lastModifiedDate}) = _$_DiseaseModel;

  factory _DiseaseModel.fromJson(Map<String, dynamic> json) =
      _$_DiseaseModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get nameEng;
  @override
  int? get diseaseImageId;
  @override
  IntegratedAttachFileModel? get diseaseImage;
  @override
  String? get symptoms;
  @override
  String? get cause;
  @override
  String? get test;
  @override
  String? get treatment;
  @override
  String? get prevention;
  @override
  int? get clinicImageId;
  @override
  IntegratedAttachFileModel? get clinicImage;
  @override
  String? get visibilityStatus;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseModelCopyWith<_$_DiseaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
