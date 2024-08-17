
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/theme/app_colors.dart';

enum TypeSnackBar { error, internet, success, warning }

dynamic getSnackBar(
    {required TypeSnackBar typeSnackBar, String? text, String? title}) {
  if (typeSnackBar == TypeSnackBar.internet) {
    return Get.rawSnackbar(
      message: "No Internet Connection",
      backgroundColor: AppColors.minutesColor,
      dismissDirection: DismissDirection.endToStart,
    );
  } else if (typeSnackBar == TypeSnackBar.error) {
    return Get.snackbar(
      "Error",
      text ?? '',
      backgroundColor: AppColors.minutesColor,
      colorText: AppColors.whiteColor,
      dismissDirection: DismissDirection.endToStart,
    );
  } else if (typeSnackBar == TypeSnackBar.warning) {
    return Get.snackbar(
      "Warning",
      text ?? '',
      backgroundColor: Colors.yellow[120],
      colorText: Get.isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
      dismissDirection: DismissDirection.endToStart,
    );
  } else {
    return Get.snackbar(
      "Success",
      text ?? '',
      backgroundColor: Colors.blue,
      colorText: AppColors.whiteColor,
      dismissDirection: DismissDirection.endToStart,
    );
  }
}
