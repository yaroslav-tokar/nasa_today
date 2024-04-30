import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/env_data.dart';

import 'app_di.config.dart';

final GetIt di = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future configDi(EnvData envConfig) async {
  di.registerSingleton(envConfig);
  di.$initGetIt();
}
