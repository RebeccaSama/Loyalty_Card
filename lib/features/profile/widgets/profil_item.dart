import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class ProfilItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData iconData;
  const ProfilItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppTheme.kPrimaryColor),
            padding: const EdgeInsets.all(10),
            child: Icon(
              iconData,
              size: 24,
              color: AppTheme.kWhiteColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.kBold16,
                ),
                Text(
                  subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.kExtraLight13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
