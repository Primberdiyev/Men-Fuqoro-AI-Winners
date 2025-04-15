import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/core/services/hive_services.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';
import 'package:men_fuqoro_ai/features/main/providers/message_provider.dart';
import 'package:men_fuqoro_ai/features/main/widgets/custom_button.dart';
import 'package:men_fuqoro_ai/features/main/widgets/custom_text_field.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 123,
          left: 23,
          right: 23,
        ),
        child: Column(
          children: [
            Text(
              'Ro\'yhatdan o\'tish',
              style: AppTextStyles.head32W700,
            ),
            CustomTextField(
              controller: nameController,
              hintText: 'Ism',
              margin: const EdgeInsets.only(top: 32),
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              margin: const EdgeInsets.only(top: 32),
            ),
            CustomTextField(
              controller: passwordController,
              hintText: 'Parol',
              margin: const EdgeInsets.only(top: 32),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<MessageProvider>(
              builder: (
                context,
                provider,
                child,
              ) {
                return CustomButton(
                  height: 50,
                  buttonColor: AppColors.mainColor,
                  textColor: AppColors.generalColor,
                  margin: EdgeInsets.only(top: 50),
                  isLoading: provider.isLoading,
                  buttonText: "Davom etish",
                  function: () async {
                    try {
                      final UserModel userModel = UserModel(
                          email: nameController.text,
                          name: nameController.text,
                          surname: passwordController.text,
                          address: '',
                          imageAsset: '',
                          joinDate: '',
                          score: 0);

                      provider
                          .signUp(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text)
                          .then((_) {
                        if (context.mounted) {
                          HiveServices().saveUser(userModel);
                          Navigator.pushReplacementNamed(
                              context, RouteNames.home);
                        }
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
