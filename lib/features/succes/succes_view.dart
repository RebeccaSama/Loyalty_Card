import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/bottom_navigation/bottom_navigation.dart';

class SuccesView extends StatefulWidget {
  const SuccesView({super.key});

  @override
  State<SuccesView> createState() => _SuccesViewState();
}

class _SuccesViewState extends State<SuccesView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              DataImages.success,
            ),
            const Gap(56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 172),
              child: Container(
                height: 4,
                width: double.infinity,
                color: AppTheme.kPrimaryColor,
              ),
            ),
            const Gap(16),
            const Text(
              "Succès !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                height: 28.8 / 24.0,
                letterSpacing: -0.02,
              ),
            ),
            const Gap(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  "Inscription réussie ! Explorez notre application et débloquez un voyage excitant vers la réussite et la facilité d'utilisation.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      height: 19.6 / 12.0,
                      color: Colors.grey,
                      fontSize: 17),
                  textAlign: TextAlign.center),
            ),
            const Gap(56),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppTheme.kPrimaryColor,
                strokeWidth: 3,
              )),
            )
          ],
        ),
      ),
    );
  }
}
