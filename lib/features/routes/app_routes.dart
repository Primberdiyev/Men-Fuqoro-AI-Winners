import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/introduction/intro_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/home_page.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.intro:
      return MaterialPageRoute(
        builder: (_) => IntroPage(),
      );
    case RouteNames.home:
      return MaterialPageRoute(
        builder: (_) => HomePage(),
      );
  }
  return MaterialPageRoute(
    builder: (_) => IntroPage(),
  );
}
