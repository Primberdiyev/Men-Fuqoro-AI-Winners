import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key,
    required this.iconPath,
    required this.text,
  });
  final String iconPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(iconPath),
          Text(
            text,
            maxLines: 2,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
