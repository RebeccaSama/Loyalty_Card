import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const RefreshIndicatorWidget(
      {super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppTheme.kWhiteColor,
      backgroundColor:AppTheme.kPrimaryColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
