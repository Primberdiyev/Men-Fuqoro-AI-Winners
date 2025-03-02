import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/widgets/home_page_top.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePageTop(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 50, left: 25, right: 25),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              AppTexts.analyzer,
              style: AppTextStyles.body18W600.copyWith(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Text(
              AppTexts.history,
              style: AppTextStyles.body18W600.copyWith(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.document,
                    height: 100,
                    width: 100,
                  ),
                ),
                Text(AppTexts.historyEmpty)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 25,
          left: 30,
          right: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                AppTexts.home,
                style: AppTextStyles.body18W600.copyWith(
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppTexts.rate,
                style: AppTextStyles.body18W600.copyWith(
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.chat);
          },
          child: Text(
            '+',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
