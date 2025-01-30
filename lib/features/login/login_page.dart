import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/verification/verification_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/frame.png",
                  fit: BoxFit.cover,
                  height: 350,
                ),
                const Positioned(
                  top: 120,
                  left: -150,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 66),
                  Text(
                    "Veuillez entrer votre numéro de téléphone pour accéder à votre compte.",
                    style: TextStyle(
                      color: AppTheme.kPrimary50,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(42),
                  const PhoneInputField(
                    title: "Numéro de téléphone",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomButton(
          isFullWidth: true,
          text: "Se connecter",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationView()));
          },
        ),
      ),
    );
  }
}
