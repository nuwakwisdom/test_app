// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/errors/error.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/features/dashboard/data/models/image_list_model.dart';
import 'package:test_app/features/dashboard/data/models/random_image_model.dart';

abstract class DashboardRemoteDatasource {
  Future<RandomImageModel> getRandomImageByBreed();
  Future<List<String>> getImageListByBreed();
  Future<RandomImageModel> getRandomImageBySubBreed();
  Future<List<String>> getImageListBySubBreed();
}

@LazySingleton(as: DashboardRemoteDatasource)
class DashboardRemoteDatasourceImpl extends DashboardRemoteDatasource {
  DashboardRemoteDatasourceImpl({
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  @override
  Future<RandomImageModel> getRandomImageByBreed() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'https://dog.ceo/api/breed/hound/images/random',
        options: Options(),
      );
      final randomImage = RandomImageModel.fromJson(
        response.data,
      );
      print(response.data);
      return randomImage;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<String>> getImageListByBreed() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'https://dog.ceo/api/breed/hound/images/random/50',
        options: Options(),
      );
      final imageList = ImageListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).messages;
      print(response.data);
      return imageList;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<RandomImageModel> getRandomImageBySubBreed() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'https://dog.ceo/api/breed/hound/afghan/images/random',
        options: Options(),
      );
      final randomImage = RandomImageModel.fromJson(
        response.data,
      );
      print(response.data);
      return randomImage;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<String>> getImageListBySubBreed() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'https://dog.ceo/api/breed/hound/afghan/images',
        options: Options(),
      );
      final imageList = ImageListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).messages;
      print(response.data);
      return imageList;
    } else {
      throw NoDataException();
    }
  }
}
