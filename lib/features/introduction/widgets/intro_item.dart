import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';

class IntroItem extends StatelessWidget {
  const IntroItem({
    super.key,
    required this.middleText,
    required this.bottomText,
    required this.imagePath,
    required this.index,
  });
  final String middleText;
  final String bottomText;
  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Image.asset(
            imagePath,
            height: 358,
            width: 382,
          ),
        ),
        Text(
          middleText,
          style: AppTextStyles.body18W600,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Text(
          bottomText,
          style: AppTextStyles.body144600,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == i
                    ? AppColors.mainColor
                    : AppColors.mainColor.withValues(alpha: 0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
