import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows/data/constants/app_colors.dart';
import 'package:tv_shows/data/constants/routes.dart';
import 'package:tv_shows/views/app_view.dart';

import 'screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(ChangeNotifierProvider(
      create: (context) => AppView(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundPrimary,
        listTileTheme: const ListTileThemeData(
          tileColor: AppColors.backgroundSecondary,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.backgroundSecondary,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textSecondary),
          ),
          prefixIconColor: AppColors.textSecondary,
          hintStyle: TextStyle(color: AppColors.textSecondary),
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const ListScreen(),
        AppRoutes.details: (context) => const DetailsScreen(),
      },
    );
  }
}
