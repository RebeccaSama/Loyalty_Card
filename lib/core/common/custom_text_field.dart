import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String? phone)? validator;
  final TextStyle? style;
  final String? hint;
  final int maxLines;
  final String? label;
  final Widget? suffix;
  final bool obscure;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final bool? enabled;
  final String? title;
  final FocusNode? focusNode;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasDecoration;

  const CustomTextField(
      {super.key,
      this.controller,
      this.suffix,
      this.title,
      this.obscure = false,
      this.onChanged,
      this.validator,
      this.style,
      this.enabled,
      this.focusNode,
      this.hint,
      this.hintStyle,
      this.keyboardType,
      this.readOnly = false,
      this.inputFormatters,
      this.hasDecoration = true,
      this.maxLines = 1,
      this.prefix,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Text(
                  title!,
                ),
                const Gap(8),
                const Text(
                  "*",
                  style:
                      TextStyle(fontFamily: 'Dosis-Medium', color: Colors.red),
                )
              ],
            ),
          ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: AppTheme.kPrimary50),
                  color: AppTheme.kWhiteColor,
                  borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                controller: controller,
                readOnly: readOnly,
                inputFormatters: inputFormatters,
                maxLines: maxLines,
                obscureText: obscure,
                obscuringCharacter: "*",
                onChanged: onChanged,
                keyboardType: keyboardType,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                enabled: enabled,
                validator: validator,
                style: style,
                focusNode: focusNode,
                decoration: InputDecoration(
                  suffixIcon: suffix,
                  prefixIcon: prefix,
                  suffixIconConstraints: const BoxConstraints(),
                  hintText: hint,
                  hintStyle: AppTypography.kExtraLight16.copyWith(
                    color: AppTheme.kPrimaryColor.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            if (label != null)
              Positioned(
                  top: -8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: Colors.white,
                    child: Text(
                      label!,
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'Dosis-Medium'),
                    ),
                  ))
          ],
        ),
      ],
    );
  }
}
