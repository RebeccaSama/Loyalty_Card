import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class ToastService {
  static void showSuccess(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void showError(String message) {
    _showToast(
      message: message,
      backgroundColor: AppTheme.kPercentageRed,
      icon: Icons.error,
    );
  }

  static void showInfo(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
    );
  }

  static void showWarning(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void _showToast({
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Méthode personnalisée pour plus de flexibilité
  static void showCustomToast({
    required String message,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast length = Toast.LENGTH_SHORT,
    int timeInSecForIosWeb = 3,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  // Méthode pour annuler tous les toasts actifs
  static void cancelAllToasts() {
    Fluttertoast.cancel();
  }
}
