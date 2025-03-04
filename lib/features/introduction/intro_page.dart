import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/core/ui_kit/custom_button.dart';
import 'package:men_fuqoro_ai/features/introduction/widgets/intro_item.dart';
import 'package:men_fuqoro_ai/features/main/pages/auth_page.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<IntroItem> items = [
      IntroItem(
        middleText: AppTexts.discoverSmart,
        bottomText: AppTexts.personalAssist,
        imagePath: AppImages.intro1,
        index: 0,
      ),
      IntroItem(
        middleText: AppTexts.personalize,
        bottomText: AppTexts.saveTime,
        imagePath: AppImages.intro2,
        index: 1,
      ),
      IntroItem(
        middleText: AppTexts.startIntro,
        bottomText: AppTexts.stepInto,
        imagePath: AppImages.intro3,
        index: 2,
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            Text(
              AppTexts.menFuqoro,
              maxLines: 2,
              style: AppTextStyles.body18W600.copyWith(
                color: AppColors.mainColor,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CustomButton(
          text: AppTexts.start,
          function: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AuthPage()));
          },
        ),
      ),
    );
  }
}
