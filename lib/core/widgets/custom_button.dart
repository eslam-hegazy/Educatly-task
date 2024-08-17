import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_fonts.dart';

Widget customButton({
  required BuildContext context,
  required String title,
  required VoidCallback press,
}) {
  return MaterialButton(
    color: AppColors.primaryColor,
    minWidth: double.infinity,
    height: context.height * 0.06,
    onPressed: press,
    child: Text(
      title,
      style: AppFonts.primaryStyle(fontSize: 16),
    ),
  );
}
