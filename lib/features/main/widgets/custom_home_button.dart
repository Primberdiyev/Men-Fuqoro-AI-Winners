import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.function,
  });
  final String iconPath;
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 0.5 * (MediaQuery.of(context).size.width - 80),
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
