import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/features/dashboard/data/models/random_image_model.dart';
part 'image_list_model.g.dart';

@JsonSerializable()
class ImageListModel {
  ImageListModel({required this.messages});
  factory ImageListModel.fromJson(Map<String, dynamic> json) =>
      _$ImageListModelFromJson(json);
  List<String> messages;
  Map<String, dynamic> toJson() => _$ImageListModelToJson(this);
}
