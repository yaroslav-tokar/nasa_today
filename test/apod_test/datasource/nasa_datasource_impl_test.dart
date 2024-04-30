import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/features/apod/data/datasource/nasa_datasource.dart';
import 'package:nasa_today/features/apod/data/dto/apod_dto.dart';

import 'nasa_datasource_impl_test.mocks.dart';

@GenerateMocks([
  NasaDatasource,
])
void main() {
  late MockNasaDatasource mockNasaDatasource;

  setUp((){
    mockNasaDatasource = MockNasaDatasource();
  });

  group('NasaDatasource', () {
    test('getApod returns ApiSuccessResult with data when successful', () async {
      final apodDto = ApodDto(date: '01-01-1991');
      final successResponse = ApiSuccessResult(apodDto);

      provideDummy<ApiResponseResult<ApodDto?, Exception>>(successResponse);

      when(mockNasaDatasource.getApod()).thenAnswer((_) async => successResponse);

      final result = await mockNasaDatasource.getApod();

      expect(result, isA<ApiSuccessResult<ApodDto?, Exception>>());
      expect(result is ApiSuccessResult<ApodDto?, Exception>, true);
    });


    test('getApod returns ApiErrorResult with exception when failed', () async {
      final exception = Exception('Failed to fetch data');
      final errorResponse = ApiErrorResult<ApodDto?, Exception>(exception);

      provideDummy<ApiResponseResult<ApodDto?, Exception>>(errorResponse);
      when(mockNasaDatasource.getApod()).thenAnswer((_) async => errorResponse);

      final result = await mockNasaDatasource.getApod();

      expect(result, isA<ApiErrorResult<ApodDto?, Exception>>());
      expect(result is ApiErrorResult<ApodDto?, Exception>, true);
    });
  });
}
