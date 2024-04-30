import 'package:dio/dio.dart';
import 'package:nasa_today/core/env_data.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.envData});

  final EnvData envData;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = envData.apiKey;

    super.onRequest(options, handler);
  }
}
