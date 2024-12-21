import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: -90,
            right: 20,
            left: -90,
            child: Image.asset(
              "assets/images/frame.png",
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const Positioned(
            top: 100,
            right: 20,
            left: -150,
            child: Center(
              child: Text(
                "Log In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
                Text(
                  "Veuillez entrer votre numéro de téléphone pour accéder à votre compte.",
                  style: TextStyle(
                    color: AppTheme.kPrimary50,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Gap(66),
                const PhoneInputField(
                  title: "Numéro de téléphone",
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.all(16),
        child: CustomButton(
          isFullWidth: true,
          text: "Se connecter",
        ),
      ),
    );
  }
}
