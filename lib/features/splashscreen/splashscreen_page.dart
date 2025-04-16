import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/onboarding/onboarding.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacityTween = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);

    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.kPrimaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            // Center(child: Image.asset(DataImages.logo, width: 100, height: 100)),
            Center(
              child: FadeTransition(
                  opacity: _opacityTween,
                  child: Image.asset(DataImages.logo, width: 100, height: 100)),
            ),
            const Positioned(
              bottom: 110,
              child: CircularProgressIndicator(
                color: AppTheme.kWhiteColor,
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "©  EworkSpace. 2024",
                style: GoogleFonts.dosis(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: AppTheme.kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
