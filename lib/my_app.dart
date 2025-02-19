import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/introduction/intro_page.dart';
import 'package:men_fuqoro_ai/features/routes/app_routes.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      home: IntroPage(),
    );
  }
}
