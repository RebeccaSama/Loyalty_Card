import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.kPrimaryColor : AppTheme.kPrimary50,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
