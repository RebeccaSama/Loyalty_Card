import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class PhoneInputField extends StatefulWidget {
  final String? title;
  final TextEditingController? controller;

  const PhoneInputField({super.key, this.controller, this.title});

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.title!,
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: AppTheme.kPrimaryColor.withOpacity(0.12)),
              color: AppTheme.kWhiteColor,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InternationalPhoneNumberInput(
                textStyle: const TextStyle(
                    color: AppTheme.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                hintText: "677 - 889 - 556",
                onInputChanged: (PhoneNumber number) {},
                onInputValidated: (bool value) {},
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    setSelectorButtonAsPrefixIcon: true,
                    useBottomSheetSafeArea: false,
                    useEmoji: true),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(
                    color: AppTheme.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                initialValue: number,
                textFieldController: widget.controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: InputBorder.none,
                onSaved: (PhoneNumber number) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
