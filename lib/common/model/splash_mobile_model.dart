import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_mobile_model.freezed.dart';
part 'splash_mobile_model.g.dart';

@freezed
class SplashMobileModel with _$SplashMobileModel {
  factory SplashMobileModel({
    int? id,
    String? title,
    int? imageId,
    IntegratedAttachFileModel? image,
    String? visibilityStatus,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _SplashMobileModel;

  factory SplashMobileModel.fromJson(Map<String, dynamic> json) =>
      _$SplashMobileModelFromJson(json);
}
