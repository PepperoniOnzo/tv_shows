import 'package:flutter/material.dart';
import 'package:tv_shows/data/constants/routes.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const ListScreen(),
        AppRoutes.details: (context) => const DetailsScreen(),
      },
    );
  }
}
