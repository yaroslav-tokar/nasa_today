import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';

abstract interface class NasaDatasource {
  Future<ApiResponseResult<ApodDto?, Exception>> getApod();
}
