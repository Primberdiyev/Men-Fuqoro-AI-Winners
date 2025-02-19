import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width - 60,
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.body18W600.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
