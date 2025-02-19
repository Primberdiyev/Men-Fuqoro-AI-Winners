import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle get head48W600 => TextStyle(
      fontSize: 48, fontWeight: FontWeight.w500, color: AppColors.white);
  static TextStyle get body18W600 => TextStyle(
        fontSize: 18,
        color: AppColors.mainColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get body144600 => TextStyle(
        fontSize: 14,
        color: AppColors.gray,
        fontWeight: FontWeight.w400,
      );
}
