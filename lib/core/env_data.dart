import 'package:equatable/equatable.dart';

class EnvData extends Equatable {
  const EnvData({
    required this.apiKey,
    required this.baseUrl,
  });

  factory EnvData.fromMap({required Map<String, String> configMap}) {
    final apiKey = configMap['API_KEY'] ?? '';
    final baseUrl = configMap['BASE_URL'] ?? '';

    return EnvData(apiKey: apiKey, baseUrl: baseUrl);
  }

  final String apiKey;
  final String baseUrl;

  @override
  List<Object?> get props => [apiKey, baseUrl];

  @override
  bool? get stringify => true;
}
