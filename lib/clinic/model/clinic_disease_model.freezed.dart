// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinic_disease_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClinicDiseaseModel _$ClinicDiseaseModelFromJson(Map<String, dynamic> json) {
  return _ClinicDiseaseModel.fromJson(json);
}

/// @nodoc
mixin _$ClinicDiseaseModel {
  int? get clinicId => throw _privateConstructorUsedError;
  int? get diseaseId => throw _privateConstructorUsedError;
  String? get diseaseName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicDiseaseModelCopyWith<ClinicDiseaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicDiseaseModelCopyWith<$Res> {
  factory $ClinicDiseaseModelCopyWith(
          ClinicDiseaseModel value, $Res Function(ClinicDiseaseModel) then) =
      _$ClinicDiseaseModelCopyWithImpl<$Res, ClinicDiseaseModel>;
  @useResult
  $Res call({int? clinicId, int? diseaseId, String? diseaseName});
}

/// @nodoc
class _$ClinicDiseaseModelCopyWithImpl<$Res, $Val extends ClinicDiseaseModel>
    implements $ClinicDiseaseModelCopyWith<$Res> {
  _$ClinicDiseaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = freezed,
    Object? diseaseId = freezed,
    Object? diseaseName = freezed,
  }) {
    return _then(_value.copyWith(
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseId: freezed == diseaseId
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseName: freezed == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClinicDiseaseModelCopyWith<$Res>
    implements $ClinicDiseaseModelCopyWith<$Res> {
  factory _$$_ClinicDiseaseModelCopyWith(_$_ClinicDiseaseModel value,
          $Res Function(_$_ClinicDiseaseModel) then) =
      __$$_ClinicDiseaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? clinicId, int? diseaseId, String? diseaseName});
}

/// @nodoc
class __$$_ClinicDiseaseModelCopyWithImpl<$Res>
    extends _$ClinicDiseaseModelCopyWithImpl<$Res, _$_ClinicDiseaseModel>
    implements _$$_ClinicDiseaseModelCopyWith<$Res> {
  __$$_ClinicDiseaseModelCopyWithImpl(
      _$_ClinicDiseaseModel _value, $Res Function(_$_ClinicDiseaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicId = freezed,
    Object? diseaseId = freezed,
    Object? diseaseName = freezed,
  }) {
    return _then(_$_ClinicDiseaseModel(
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseId: freezed == diseaseId
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      diseaseName: freezed == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClinicDiseaseModel implements _ClinicDiseaseModel {
  _$_ClinicDiseaseModel({this.clinicId, this.diseaseId, this.diseaseName});

  factory _$_ClinicDiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClinicDiseaseModelFromJson(json);

  @override
  final int? clinicId;
  @override
  final int? diseaseId;
  @override
  final String? diseaseName;

  @override
  String toString() {
    return 'ClinicDiseaseModel(clinicId: $clinicId, diseaseId: $diseaseId, diseaseName: $diseaseName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClinicDiseaseModel &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.diseaseId, diseaseId) ||
                other.diseaseId == diseaseId) &&
            (identical(other.diseaseName, diseaseName) ||
                other.diseaseName == diseaseName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clinicId, diseaseId, diseaseName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClinicDiseaseModelCopyWith<_$_ClinicDiseaseModel> get copyWith =>
      __$$_ClinicDiseaseModelCopyWithImpl<_$_ClinicDiseaseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClinicDiseaseModelToJson(
      this,
    );
  }
}

abstract class _ClinicDiseaseModel implements ClinicDiseaseModel {
  factory _ClinicDiseaseModel(
      {final int? clinicId,
      final int? diseaseId,
      final String? diseaseName}) = _$_ClinicDiseaseModel;

  factory _ClinicDiseaseModel.fromJson(Map<String, dynamic> json) =
      _$_ClinicDiseaseModel.fromJson;

  @override
  int? get clinicId;
  @override
  int? get diseaseId;
  @override
  String? get diseaseName;
  @override
  @JsonKey(ignore: true)
  _$$_ClinicDiseaseModelCopyWith<_$_ClinicDiseaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
