import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/errors/failure.dart';
import 'package:test_app/core/usecase/usecase.dart';
import 'package:test_app/features/dashboard/domain/entities/random_image_entity.dart';
import 'package:test_app/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class GetRandomImageByBreedUsecase
    extends UseCase<RandomImageEntity, NoParams> {
  GetRandomImageByBreedUsecase({
    required this.dashboardRepository,
  });

  final DashboardRepository dashboardRepository;

  @override
  Future<Either<Failure, RandomImageEntity>> call(
    NoParams params,
  ) async {
    return dashboardRepository.getRandomImage();
  }
}
