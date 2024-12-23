import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class TextFieldAppBar extends StatelessWidget {
  final bool enable;
  final Widget action;
  final TextEditingController? textEditingController;
  final void Function()? clearInput;
  final void Function()? onTapInput;
  final void Function()? onTap;
  const TextFieldAppBar(
      {Key? key,
      required this.action,
      this.onTap,
      this.enable = true,
      this.clearInput,
      this.textEditingController,
      this.onTapInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: AppTheme.kPrimary12,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), bottomLeft: Radius.circular(24))),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: enable
                    ? TextField(
                        controller: textEditingController,
                        cursorColor: Colors.grey,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                        autofocus: false,
                        onTap: onTapInput,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: "Rechercher",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(0, 10, 43, 0.36),
                                fontWeight: FontWeight.w400),
                            suffixIcon: SizedBox()),
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Rechercher",
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(0, 10, 43, 0.36),
                              fontWeight: FontWeight.w400),
                        ),
                      )),
          ),
          Visibility(
            visible: textEditingController?.text.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: clearInput,
                child: const CircleAvatar(
                  radius: 9,
                  backgroundColor: AppTheme.kPrimaryColor,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          action
        ],
      ),
    );
  }
}
