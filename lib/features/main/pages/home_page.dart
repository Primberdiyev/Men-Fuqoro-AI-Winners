import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/providers/message_provider.dart';
import 'package:men_fuqoro_ai/features/main/widgets/home_page_top.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';
import 'package:men_fuqoro_ai/features/utils/app_texts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<MessageProvider>().getUserModel();
    });
  }

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
          Consumer<MessageProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return Expanded(
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
            );
          }),
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
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.mainColor),
              child: TextButton(
                onPressed: () {
                    Navigator.pushNamed(context, RouteNames.chat);
                },
                child: Text(
                  '+',
                  style: AppTextStyles.body18W600
                      .copyWith(color: AppColors.white, fontSize: 30),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.rating);
              },
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
    );
  }
}
