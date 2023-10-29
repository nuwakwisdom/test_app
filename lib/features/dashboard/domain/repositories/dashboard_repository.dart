import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/failure.dart';
import 'package:test_app/features/dashboard/data/models/random_image_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, RandomImageModel>> getRandomImage();
  Future<Either<Failure, List<String>>> getImageListByBreeds();
  Future<Either<Failure, RandomImageModel>> getRandomImageBySubBreed();
  Future<Either<Failure, List<String>>> getImageListBySubBreed();
}
