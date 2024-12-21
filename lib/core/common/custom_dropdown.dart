import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? title;
  final List<T> options;
  final String hint;
  final void Function(T?)? onChanged;
  final T? value;
  final double borderRadius;
  final String Function(T) dropDownMenuText; // Made non-nullable

  const CustomDropdown({
    super.key,
    required this.options,
    this.title,
    required this.hint,
    required this.onChanged, // Ensure onChanged is non-null for interactivity
    this.value,
    this.borderRadius = 8,
    required this.dropDownMenuText, // Made required for displaying items
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color:AppTheme.kPrimary50,
          ),
          color: AppTheme.kWhiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<T>(
              items: options.isNotEmpty
                  ? options.map((T e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          dropDownMenuText(e),
                          style: AppTypography.kExtraLight16.copyWith(
                            color: AppTheme.kPrimaryColor,
                          ),
                        ),
                      );
                    }).toList()
                  : null,
              decoration: const InputDecoration(border: InputBorder.none),
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(8),
              hint: Text(
                hint,
                style: AppTypography.kExtraLight16.copyWith(
                  color: AppTheme.kPrimaryColor,
                ),
              ),
              onChanged: options.isEmpty ? null : onChanged,
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
      ),
    );
  }
}
