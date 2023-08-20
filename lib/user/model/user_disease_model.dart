import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_disease_model.freezed.dart';
part 'user_disease_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class UserDiseaseModel with _$UserDiseaseModel {
  factory UserDiseaseModel({
    int? id,
    int? userId,
    int? imageId,
    IntegratedAttachFileModel? image,
    String? topk1Label,
    int? topk1Id,
    double? topk1Value,
    String? topk2Label,
    int? topk2Id,
    double? topk2Value,
    String? topk3Label,
    int? topk3Id,
    double? topk3Value,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    DiseaseModel? topk1Disease,
    IntegratedAttachFileModel? topk1DiseaseImage,
    DiseaseModel? topk2Disease,
    IntegratedAttachFileModel? topk2DiseaseImage,
    DiseaseModel? topk3Disease,
    IntegratedAttachFileModel? topk3DiseaseImage,
  }) = _UserDiseaseModel;

  factory UserDiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDiseaseModelFromJson(json);
}
