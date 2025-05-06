import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/bottom_navigation/bottom_navigation.dart';
import 'package:loyalty_card/features/login/login_view.dart';
import 'package:loyalty_card/features/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    final userString = prefs.getString('user');
    print(userString);
    if (!hasSeenOnboarding) {
      await prefs.setBool('hasSeenOnboarding', true);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    } else if (userString != null) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
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
