import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class ProfitItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color color;
  final void Function() onTap;

  const ProfitItem(
      {super.key,
      required this.iconData,
      required this.title,
      this.color = AppTheme.kPrimaryColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: color.withValues(alpha: 0.2)),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  iconData,
                  size: 24,
                  color: color,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: AppTypography.kMedium16
                    .copyWith(color: AppTheme.kPrimaryColor),
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
          )
        ],
      ),
    );
  }
}
