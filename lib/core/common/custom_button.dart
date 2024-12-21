import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool isFullWidth;
  final Color colorText;
  final bool isDisabled;
  final bool transparent;
  final bool loading;
  final double radius;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.text,
      this.child,
      this.isFullWidth = false,
      this.isDisabled = false,
      this.transparent = false,
      this.loading = false,
      this.colorText = AppTheme.kPrimaryColor,
      this.radius = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: isFullWidth ? double.infinity : null,
      child: TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
              backgroundColor: transparent
                  ? null
                  : AppTheme.kPrimaryColor.withOpacity(isDisabled ? 0.5 : 1),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(colorText),
                    strokeWidth: 2,
                  ),
                )
              : (text != null
                  ? Text(text!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dosis(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppTheme.kWhiteColor,
                        ),
                      ))
                  : child!)),
    );
  }
}
