import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

convertMoney(amount) {
  final oCcy = NumberFormat("#,##0", "en_US");
  return "${oCcy.format(amount)} FCFA";
}

convertMoneyF(amount) {
  final oCcy = NumberFormat("#,##0", "en_US");
  return oCcy.format(amount);
}

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

class Utils {
  static Future<T?> showCustomDialog<T>(
      {required BuildContext context,
      bool canPop = true,
      Color? backgroundColor,
      EdgeInsets insetPadding =
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      double blur = 6,
      double? borderRadius,
      required Widget Function(BuildContext ctx) child}) {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: WillPopScope(
                onWillPop: () async {
                  return canPop;
                },
                child: Dialog(
                  backgroundColor: backgroundColor,
                  insetPadding: insetPadding,
                  shape: borderRadius == null
                      ? null
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius)),
                  child: child(ctx),
                ),
              ),
            ),
          );
        });
  }
}

void showLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          color: Colors.white.withValues(alpha: 0.6),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: AppTheme.kPrimaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.kMedium16.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
