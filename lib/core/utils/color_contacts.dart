import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';

Color colorAvatar(String character) {
  switch (character) {
    case 'A':
      return const Color(0xff483D8B);
    case 'B':
      return const Color(0xff2F4F4F);
    case 'C':
      return AppTheme.kPrimaryColor;
    case 'D':
      return const Color(0xff0000FF);
    case 'E':
      return const Color(0xff8A2BE2);
    case 'F':
      return const Color(0xffA52A2A);
    case 'G':
      return const Color(0xffD2691E);
    case 'H':
      return const Color(0xffDC143C);
    case 'I':
      return const Color(0xff00008B);
    case 'J':
      return const Color(0xff008B8B);
    case 'K':
      return const Color(0xffB8860B);
    case 'L':
      return const Color(0xff006400);
    case 'M':
      return const Color(0xff8B008B);
    case 'N':
      return const Color(0xff8B0000);
    case 'O':
      return const Color(0xff808080);
    case 'P':
      return const Color(0xffFF69B4);
    case 'Q':
      return const Color(0xff4B0082);
    case 'R':
      return const Color(0xffBA55D3);
    case 'S':
      return const Color(0xff0000CD);
    case 'T':
      return const Color(0xff3CB371);
    case 'U':
      return const Color(0xff7B68EE);
    case 'W':
      return const Color(0xff00FFFF);
    case 'X':
      return const Color(0xff7FFF00);
    case 'Y':
      return const Color(0xffD2691E);
    case 'Z':
      return const Color(0xffFF7F50);
    default:
      return Colors.black;
  }
}
