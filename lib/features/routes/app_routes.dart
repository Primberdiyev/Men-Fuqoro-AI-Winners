import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/introduction/intro_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/advokatlar_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/attend_sud.dart';
import 'package:men_fuqoro_ai/features/main/pages/chat_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/do_task_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/home_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/rating_page.dart';
import 'package:men_fuqoro_ai/features/main/pages/sud_page.dart';
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
    case RouteNames.chat:
      return MaterialPageRoute(
        builder: (_) => ChatPage(),
      );
    case RouteNames.doTask:
      return MaterialPageRoute(
        builder: (_) => DoTaskPage(),
      );
    case RouteNames.rating:
      return MaterialPageRoute(
        builder: (_) => RatingPage(),
      );
    case RouteNames.lawyers:
      return MaterialPageRoute(
        builder: (_) => LawyerListPage(),
      );
    case RouteNames.sud:
      return MaterialPageRoute(builder: (_) => SudPage());
    case RouteNames.attendSud:
      return MaterialPageRoute(builder: (_) => AttendSud());
  }
  return MaterialPageRoute(
    builder: (_) => IntroPage(),
  );
}
