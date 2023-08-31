import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_clinic_model.freezed.dart';
part 'wishlist_clinic_model.g.dart';

@freezed
class WishlistClinicModel with _$WishlistClinicModel {
  factory WishlistClinicModel({
    int? userId,
    int? parentId,
    ClinicModel? clinic,
  }) = _WishlistClinicModel;

  factory WishlistClinicModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistClinicModelFromJson(json);
}
