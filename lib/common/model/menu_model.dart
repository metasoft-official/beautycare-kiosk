import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_project/common/model/user_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  factory MenuModel({
    int? id,
    int? parentId,
    String? name,
    String? description,
    String? path,
    int? ranking,
    String? show,
    String? icon,
    String? publicStatus,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}
