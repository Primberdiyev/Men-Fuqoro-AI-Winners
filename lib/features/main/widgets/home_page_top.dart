import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/widgets/custom_home_button.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';

class HomePageTop extends StatelessWidget {
  const HomePageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(
        top: 60,
        left: 20,
        right: 20,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.menFuqoroAI,
                style: AppTextStyles.body144600.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
              Icon(
                Icons.person_3_rounded,
                color: AppColors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomHomeButton(
                iconPath: AppImages.lawyer,
                text: AppTexts.introduceLawyer,
                function: () {
                  Navigator.pushNamed(context, RouteNames.lawyers);
                },
              ),
              CustomHomeButton(
                iconPath: AppImages.tasks,
                text: AppTexts.doTask,
                function: () {
                  Navigator.pushNamed(context, RouteNames.doTask);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
