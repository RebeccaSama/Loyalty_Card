import 'package:flutter/material.dart';
import 'package:loyalty_card/core/models/onboarding.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class OnboardingWidget extends StatelessWidget {
  final Onboarding onboarding;
  const OnboardingWidget({
    Key? key,
    required this.onboarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              onboarding.image,
              height: 180,
            ),
            const SizedBox(height: 68),
            Text(
              onboarding.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.kPrimaryColor,
                fontSize: 32,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              onboarding.subtitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.kPrimary50,
                fontSize: 16,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
