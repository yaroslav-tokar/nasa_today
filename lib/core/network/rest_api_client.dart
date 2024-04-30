import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/env_data.dart';
import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';
import 'package:retrofit/http.dart';

part 'rest_api_client.g.dart';

@Injectable()
@RestApi()
abstract class RestApiClient {
  @factoryMethod
  factory RestApiClient({required Dio dio, required EnvData envData}) => _RestApiClient(
        dio,
        baseUrl: envData.baseUrl,
      );

  @GET('/planetary/apod')
  Future<ApodDto?> getApod();
}
