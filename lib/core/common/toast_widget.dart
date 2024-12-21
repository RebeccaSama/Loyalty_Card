import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(38),
      decoration: const BoxDecoration(
          color: AppTheme.kPercentageRed,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Le code OTP que vous avez utilisé est incorrect ! Veuiller entrer le code correct.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          Icon(
            Icons.close_outlined,
            color: AppTheme.kWhiteColor,
            size: 24,
          )
        ],
      ),
    );
  }
}
