import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final void Function()? onChanged;
  final String? text;
  final Widget? widget;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.text,
    this.widget,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CheckboxTheme(
              data: CheckboxThemeData(
                side: BorderSide(color: AppTheme.kPrimary50, width: 1.5),
              ),
              child: Checkbox(
                checkColor: AppTheme.kWhiteColor,
                activeColor: AppTheme.kPrimaryColor,
                value: widget.value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onChanged: (bool? newValue) {
                  if (widget.onChanged != null) {
                    widget.onChanged!();
                  }
                },
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: widget.text != null
                ? Text(
                    widget.text!,
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.kPrimaryColor,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  )
                : widget.widget!,
          ),
        ],
      ),
    );
  }
}
