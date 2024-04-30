import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/core/network/exceptions/exeptions.dart';
import 'package:nasa_today/core/network/rest_api_client.dart';
import 'package:nasa_today/features/apod/data/datasource/nasa_datasource.dart';
import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';

@Singleton(as: NasaDatasource)
class NasaDataSourceImpl implements NasaDatasource {
  NasaDataSourceImpl(this.apiClient);

  final RestApiClient apiClient;

  @override
  Future<ApiResponseResult<ApodDto?, Exception>> getApod() async {
    try {
      final response = await apiClient.getApod();
      if (response != null) {
        return ApiSuccessResult(response);
      }

      return ApiErrorResult(DataNotFoundException());
    } catch (e) {
      return ApiErrorResult(DataParsingException(e.toString()));
    }
  }
}
