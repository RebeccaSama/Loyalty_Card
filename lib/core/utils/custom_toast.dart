import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:toastification/toastification.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomToast {
  static void showSuccessToast(BuildContext context, String message) {
    _showToast(
      context,
      message,
      ToastificationType.success,
      Iconsax.tick_circle_outline,
      Colors.green.shade50,
      AppTheme.backgroundPositiveHover,
    );
  }

  static void showErrorToast(BuildContext context, String message) {
    _showToast(
      context,
      message,
      ToastificationType.error,
      Iconsax.close_circle_outline,
      Colors.red.shade50,
      AppTheme.iconDangerSecondary,
    );
  }

  static void showWarningToast(BuildContext context, String message) {
    _showToast(
      context,
      message,
      ToastificationType.warning,
      Iconsax.warning_2_outline,
      Colors.orange.shade50,
      AppTheme.iconWarningSecondary,
    );
  }

  static void showInfoToast(BuildContext context, String message) {
    _showToast(
      context,
      message,
      ToastificationType.info,
      Iconsax.info_circle_outline,
      Colors.blue.shade50,
      AppTheme.iconInfoSecondary,
    );
  }

  static void _showToast(
    BuildContext context,
    String message,
    ToastificationType type,
    IconData icon,
    Color backgroundColor,
    Color iconColor,
  ) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(message),
      icon: Icon(icon, color: iconColor),
      backgroundColor: backgroundColor,
      autoCloseDuration: const Duration(seconds: 4),
      showProgressBar: true,
    );
  }
}
