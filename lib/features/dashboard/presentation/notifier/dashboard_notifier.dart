import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/usecase/usecase.dart';
import 'package:test_app/features/dashboard/domain/entities/random_image_entity.dart';
import 'package:test_app/features/dashboard/domain/usecases/image_list_by_breed_usecase.dart';
import 'package:test_app/features/dashboard/domain/usecases/image_list_by_sub_breed.dart';
import 'package:test_app/features/dashboard/domain/usecases/random_image_by_breed_usecase.dart';
import 'package:test_app/features/dashboard/domain/usecases/random_image_by_sub_breed_usecase.dart';

@lazySingleton
class HomeNotifier extends ChangeNotifier {
  HomeNotifier({
    required this.getRandomImageByBreedUsecase,
    required this.getImageListByBreedUsecase,
    required this.getRandomImageBySubBreedUsecase,
    required this.getImageListBySubBreedUsecase,
  });
  final GetRandomImageByBreedUsecase getRandomImageByBreedUsecase;
  final GetImageListByBreedUsecase getImageListByBreedUsecase;
  final GetRandomImageBySubBreedUsecase getRandomImageBySubBreedUsecase;
  final GetImageListBySubBreedUsecase getImageListBySubBreedUsecase;
  RandomImageEntity? imageEntity;
  List<String>? imageList;
  Future<void> getRandomImageByBreed(
    BuildContext context,
  ) async {
    final response = await getRandomImageByBreedUsecase(
      NoParams(),
    );

    response.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        imageEntity = r;
        notifyListeners();
      },
    );
  }

  Future<void> getImageListByBreed(
    BuildContext context,
  ) async {
    final response = await getImageListByBreedUsecase(NoParams());
    response.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        imageList = r;
        notifyListeners();
      },
    );
  }

  Future<void> getRandomImageBySubBreed(
    BuildContext context,
  ) async {
    final response = await getRandomImageBySubBreedUsecase(
      NoParams(),
    );
    response.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        imageEntity = r;
        notifyListeners();
      },
    );
  }

  Future<void> getImageListBySubBreed(
    BuildContext context,
  ) async {
    final response = await getImageListBySubBreedUsecase(
      NoParams(),
    );
    response.fold(
      (l) {
        notifyListeners();
      },
      (r) async {
        imageList = r;
        notifyListeners();
      },
    );
  }
}
