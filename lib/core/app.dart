import 'package:flutter/material.dart';
import 'package:nasa_today/features/apod/presentation/pages/apod_details_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'NASA’s Astronomy Picture of the Day',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: ApodDetailsPage(),
      );
}
