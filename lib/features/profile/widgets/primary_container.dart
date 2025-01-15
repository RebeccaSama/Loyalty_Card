import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final EdgeInsets? padding;
  const PrimaryContainer(
      {required this.child,
      this.height,
      this.padding,
      this.radius,
      super.key,
      this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: color ?? AppTheme.kPrimary50,
          borderRadius: BorderRadius.circular(radius ?? 8)),
      child: child,
    );
  }
}
