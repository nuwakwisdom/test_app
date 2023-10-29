// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/dashboard/data/datasources/dashboard_remote_datasource.dart'
    as _i6;
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i8;
import '../../features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i7;
import '../../features/dashboard/domain/usecases/image_list_by_breed_usecase.dart'
    as _i9;
import '../../features/dashboard/domain/usecases/image_list_by_sub_breed.dart'
    as _i10;
import '../../features/dashboard/domain/usecases/random_image_by_breed_usecase.dart'
    as _i11;
import '../../features/dashboard/domain/usecases/random_image_by_sub_breed_usecase.dart'
    as _i12;
import '../../features/dashboard/presentation/notifier/dashboard_notifier.dart'
    as _i13;
import '../network/network_info.dart' as _i5;
import 'register_module.dart' as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i6.DashboardRemoteDatasource>(() =>
      _i6.DashboardRemoteDatasourceImpl(networkInfo: gh<_i5.NetworkInfo>()));
  gh.lazySingleton<_i7.DashboardRepository>(() => _i8.DashboardRepositoryImpl(
      remoteDatasource: gh<_i6.DashboardRemoteDatasource>()));
  gh.lazySingleton<_i9.GetImageListByBreedUsecase>(() =>
      _i9.GetImageListByBreedUsecase(
          dashboardRepository: gh<_i7.DashboardRepository>()));
  gh.lazySingleton<_i10.GetImageListBySubBreedUsecase>(() =>
      _i10.GetImageListBySubBreedUsecase(
          dashboardRepository: gh<_i7.DashboardRepository>()));
  gh.lazySingleton<_i11.GetRandomImageByBreedUsecase>(() =>
      _i11.GetRandomImageByBreedUsecase(
          dashboardRepository: gh<_i7.DashboardRepository>()));
  gh.lazySingleton<_i12.GetRandomImageBySubBreedUsecase>(() =>
      _i12.GetRandomImageBySubBreedUsecase(
          dashboardRepository: gh<_i7.DashboardRepository>()));
  gh.lazySingleton<_i13.HomeNotifier>(() => _i13.HomeNotifier(
        getRandomImageByBreedUsecase: gh<_i11.GetRandomImageByBreedUsecase>(),
        getImageListByBreedUsecase: gh<_i9.GetImageListByBreedUsecase>(),
        getRandomImageBySubBreedUsecase:
            gh<_i12.GetRandomImageBySubBreedUsecase>(),
        getImageListBySubBreedUsecase: gh<_i10.GetImageListBySubBreedUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i14.RegisterModule {}
