import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:men_fuqoro_ai/core/services/hive_services.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';
import 'package:men_fuqoro_ai/features/main/services/law_service.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Hive.openBox<UserModel>('userBox');
    QonunService.initialize();
    isRegistered();
  }

  Future<void> isRegistered() async {
    await Future.delayed(Duration(seconds: 3));
    final hiveService = HiveServices().getUser();
    if (hiveService != null) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.home);
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.intro);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.main,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
