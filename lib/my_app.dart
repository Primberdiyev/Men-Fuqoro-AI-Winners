import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/introduction/intro_page.dart';
import 'package:men_fuqoro_ai/features/main/providers/auth_provider.dart';
import 'package:men_fuqoro_ai/features/main/providers/message_provider.dart';
import 'package:men_fuqoro_ai/features/routes/app_routes.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MessageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        home: IntroPage(),
      ),
    );
  }
}
