import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/features/apod/domain/models/apod_model.dart';

abstract interface class NasaRepository {
  Future<ApiResponseResult<ApodModel, Exception>> getApod();
}
