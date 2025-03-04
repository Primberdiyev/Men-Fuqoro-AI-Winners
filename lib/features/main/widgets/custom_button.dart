import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.buttonText,
    this.buttonColor = AppColors.generalColor,
    this.iconPath,
    this.textColor = AppColors.black,
    required this.margin,
    this.function,
    this.isLoading = false,
  });
  final double height;
  final String buttonText;
  final Color buttonColor;
  final String? iconPath;
  final Color textColor;
  final EdgeInsets margin;
  final VoidCallback? function;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isLoading ? function : null,
      child: Container(
        height: height,
        margin: margin,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: buttonColor,
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(color: AppColors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconPath != null
                      ? SvgPicture.asset(
                          iconPath ?? "",
                          alignment: Alignment.centerLeft,
                          height: 24,
                          width: 24,
                        )
                      : const SizedBox(
                          height: 24,
                          width: 24,
                        ),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body16W600.copyWith(
                      color: textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
      ),
    );
  }
}
