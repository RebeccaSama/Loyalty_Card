import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data.dart';
import 'package:loyalty_card/features/login/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();
  int _pageIndex = 0;
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: _pageIndex == 3
            ? CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                isFullWidth: true,
                text: "Démarrer",
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.kGriserColor,
                        fontFamily: 'Dosis',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                      _pageIndex = _pageIndex + 1;
                      setState(() {});
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.kPrimaryColor,
                        fontFamily: 'Dosis',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
            onPageChanged: (index) => setState(() {
                  isLastPage = controller.items.length - 1 == index;
                  _pageIndex = index;
                }),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    width: 300,
                    height: 200,
                    controller.items[index].image,
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
                  const Gap(24),
                  Text(
                    controller.items[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      height: 28.8 / 24.0,
                      letterSpacing: -0.02,
                    ),
                  ),
                  const Gap(16),
                  Text(controller.items[index].subtitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          height: 19.6 / 12.0,
                          color: Colors.grey,
                          fontSize: 16),
                      textAlign: TextAlign.center),
                  const Gap(24),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: controller.items.length,
                      onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
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
                          color: AppTheme.kPrimaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(100),
                          verticalOffset: 0,
                        ),
                      ))
                ],
              );
            }),
      ),
    );
  }
}
