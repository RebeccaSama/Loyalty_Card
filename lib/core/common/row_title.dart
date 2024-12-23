import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class RowTitle extends StatelessWidget {
  final String title;
  final bool seeMor;
  final void Function()? onTap;

  const RowTitle({
    super.key,
    required this.title,
    this.seeMor = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: const BoxDecoration(
                  color: AppTheme.kPrimaryColor, shape: BoxShape.circle),
            ),
            const Gap(8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.kPrimaryColor),
            ),
          ],
        ),
        if (seeMor)
          GestureDetector(
            onTap: onTap,
            child: Text(
              "Voir tout",
              style: AppTypography.kExtraLight13
                  .copyWith(color: AppTheme.kPrimary50),
            ),
          )
      ],
    );
  }
}
