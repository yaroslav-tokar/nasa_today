import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/di/app_di.dart';
import 'package:nasa_today/core/network/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  static const _sendTimeout = 90000;
  static const _receiveTimeout = 90000;
  static const _connectTimeout = 90000;

  @Singleton()
  Dio get dio => Dio(_dioOptions)
    ..interceptors.addAll([
      provideAuthInterceptor,
      providePrettyDioLogger,
    ]);

  BaseOptions get _dioOptions => BaseOptions(
        sendTimeout: const Duration(milliseconds: _sendTimeout),
        contentType: 'application/json',
        receiveTimeout: const Duration(milliseconds: _receiveTimeout),
        connectTimeout: const Duration(milliseconds: _connectTimeout),
      );

  @Singleton()
  AuthInterceptor get provideAuthInterceptor => AuthInterceptor(envData: di.get());

  @Singleton()
  PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
}
