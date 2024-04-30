import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:nasa_today/core/app.dart';
import 'package:nasa_today/core/di/app_di.dart';
import 'package:nasa_today/core/env_data.dart';
import 'package:nasa_today/utils/constants.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Loggy.initLoggy(logPrinter: const PrettyPrinter(showColors: true));

    const config = EnvData(
      apiKey: AppConstants.apiKey,
      baseUrl: AppConstants.apiUrl,
    );

    await configDi(config);

    runApp(const App());
  }, (error, stackTrace) {
    logError('Error while starting app...${error.toString()},\n$stackTrace');
  });
}
