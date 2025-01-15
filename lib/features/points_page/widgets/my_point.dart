import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/app_typography.dart';

class MyPoint extends StatelessWidget {
  final String title;
  final String nuber;
  const MyPoint({super.key, required this.title, required this.nuber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTypography.kBold24,
        ),
        Text(
          nuber,
          style: AppTypography.kExtraLight16,
        )
      ],
    );
  }
}
