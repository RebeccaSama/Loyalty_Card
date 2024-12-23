import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      DataImages.arno,
      DataImages.but,
      DataImages.intermarche
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppTheme.kPrimary12,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              images.length,
              (i) => Padding(
                    padding: EdgeInsets.only(right: i == 48 ? 0 : 8),
                    child: Image.asset(images[i]),
                  )),
        ),
      ),
    );
  }
}
