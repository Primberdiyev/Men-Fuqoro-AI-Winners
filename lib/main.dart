import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';
import 'package:men_fuqoro_ai/firebase_options.dart';
import 'package:men_fuqoro_ai/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<UserModel>('userBox');
  runApp(MyApp());
}
