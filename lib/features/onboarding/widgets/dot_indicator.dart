import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  final OnboardingItems controller;
  final PageController pageController;

  const DotIndicator(
      {super.key, required this.controller, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: pageController,
        count: controller.items.length,
        onDotClicked: (index) => pageController.animateToPage(index,
            duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
        effect: CustomizableEffect(
          activeDotDecoration: DotDecoration(
            width: 12,
            height: 12,
            color: AppTheme.kPrimaryColor,
            rotationAngle: 180,
            borderRadius: BorderRadius.circular(100),
            verticalOffset: 0,
            dotBorder: const DotBorder(
              padding: 2,
              width: 2,
              color: AppTheme.kPrimaryColor,
            ),
          ),
          dotDecoration: DotDecoration(
            width: 12,
            height: 12,
            color: AppTheme.kPrimary50,
            borderRadius: BorderRadius.circular(100),
            verticalOffset: 0,
          ),
        ));
  }
}
