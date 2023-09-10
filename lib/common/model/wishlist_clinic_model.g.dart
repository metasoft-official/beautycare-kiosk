// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishlistClinicModel _$$_WishlistClinicModelFromJson(
        Map<String, dynamic> json) =>
    _$_WishlistClinicModel(
      userId: json['userId'] as int?,
      clinicId: json['clinicId'] as int?,
      clinic: json['clinic'] == null
          ? null
          : ClinicModel.fromJson(json['clinic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WishlistClinicModelToJson(
        _$_WishlistClinicModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'clinicId': instance.clinicId,
      'clinic': instance.clinic,
    };
