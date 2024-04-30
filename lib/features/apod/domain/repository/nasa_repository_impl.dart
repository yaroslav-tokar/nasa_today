import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/features/apod/data/datasource/nasa_datasource.dart';
import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';
import 'package:nasa_today/features/apod/data/repository/nasa_repository.dart';
import 'package:nasa_today/features/apod/domain/models/apod_model.dart';

@Singleton(as: NasaRepository)
class NasaRepositoryImpl implements NasaRepository {
  NasaRepositoryImpl(this.nasaDatasource);

  final NasaDatasource nasaDatasource;

  @override
  Future<ApiResponseResult<ApodModel, Exception>> getApod() async {
    final payload = await nasaDatasource.getApod();

    switch (payload) {
      case ApiSuccessResult<ApodDto?, Exception>():
        final data = payload.data;
        return ApiSuccessResult(ApodModel.fromDto(data));
      case ApiErrorResult<ApodDto?, Exception>():
        return ApiErrorResult(payload.exception);
    }
  }
}
