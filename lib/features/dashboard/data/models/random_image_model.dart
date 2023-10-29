import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/features/dashboard/domain/entities/random_image_entity.dart';
part 'random_image_model.g.dart';

@JsonSerializable()
class RandomImageModel extends RandomImageEntity {
  const RandomImageModel({
    super.message,
  });
  factory RandomImageModel.fromJson(Map<String, dynamic> json) =>
      _$RandomImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RandomImageModelToJson(this);
}
