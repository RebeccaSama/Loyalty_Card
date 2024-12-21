import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data.dart';
import 'package:loyalty_card/features/login/login_page.dart';
import 'package:loyalty_card/features/onboarding/widgets/dot_indicator.dart';
import 'package:loyalty_card/features/onboarding/widgets/onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: _pageController,
                onPageChanged: (index) {
                  _pageIndex = index;
                  setState(() {});
                },
                itemBuilder: (context, index) => OnboardingWidget(
                  onboarding: onboardingList[index],
                ),
              ),
            ),
            Visibility(
              visible: _pageIndex != 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                          child: Text(
                            'skip',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.kPrimary50,
                              fontFamily: 'Dosis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _pageController.nextPage(
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
          ],
        ),
      ),
    );
  }
}
