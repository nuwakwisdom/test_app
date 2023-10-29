// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/errors/error.dart';
import 'package:test_app/core/errors/failure.dart';
import 'package:test_app/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:test_app/features/dashboard/data/models/random_image_model.dart';
import 'package:test_app/features/dashboard/domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl({
    required this.remoteDatasource,
  });
  final DashboardRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, RandomImageModel>> getRandomImage() async {
    try {
      final response = await remoteDatasource.getRandomImageByBreed();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getImageListByBreeds() async {
    try {
      final response = await remoteDatasource.getImageListByBreed();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, RandomImageModel>> getRandomImageBySubBreed() async {
    try {
      final response = await remoteDatasource.getRandomImageBySubBreed();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getImageListBySubBreed() async {
    try {
      final response = await remoteDatasource.getImageListBySubBreed();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }
}
