// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasa_today/core/di/modules/network_module.dart' as _i13;
import 'package:nasa_today/core/env_data.dart' as _i7;
import 'package:nasa_today/core/network/auth_interceptor.dart' as _i3;
import 'package:nasa_today/core/network/rest_api_client.dart' as _i6;
import 'package:nasa_today/features/apod/data/datasource/nasa_datasource.dart'
    as _i8;
import 'package:nasa_today/features/apod/data/datasource/nasa_datasource_impl.dart'
    as _i9;
import 'package:nasa_today/features/apod/data/repository/nasa_repository.dart'
    as _i10;
import 'package:nasa_today/features/apod/domain/repository/nasa_repository_impl.dart'
    as _i11;
import 'package:nasa_today/features/apod/presentation/cubit/apod_details_cubit.dart'
    as _i12;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.AuthInterceptor>(networkModule.provideAuthInterceptor);
    gh.singleton<_i4.Dio>(networkModule.dio);
    gh.singleton<_i5.PrettyDioLogger>(networkModule.providePrettyDioLogger);
    gh.factory<_i6.RestApiClient>(() => _i6.RestApiClient(
          dio: gh<_i4.Dio>(),
          envData: gh<_i7.EnvData>(),
        ));
    gh.singleton<_i8.NasaDatasource>(
        _i9.NasaDataSourceImpl(gh<_i6.RestApiClient>()));
    gh.singleton<_i10.NasaRepository>(
        _i11.NasaRepositoryImpl(gh<_i8.NasaDatasource>()));
    gh.singleton<_i12.ApodDetailsCubit>(
        _i12.ApodDetailsCubit(nasaRepository: gh<_i10.NasaRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i13.NetworkModule {}
