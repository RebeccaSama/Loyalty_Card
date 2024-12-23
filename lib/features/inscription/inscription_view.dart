import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/custom_text_field.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/succes/succes_view.dart';

class InscriptionView extends StatefulWidget {
  const InscriptionView({super.key});

  @override
  State<InscriptionView> createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView> {
  final TextEditingController fullNameCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -90,
            right: -70,
            left: -70,
            child: Image.asset(
              "assets/images/frame.png",
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const Positioned(
            top: 100,
            left: -150,
            right: 0,
            child: Center(
              child: Text(
                "Inscription",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                Text(
                  "Veuillez fournir vos informations d'identification pour accéder à votre compte",
                  style: TextStyle(
                    color: AppTheme.kPrimary50,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Gap(42),
                CustomTextField(
                  prefix: Icon(
                    Icons.person_2_outlined,
                    color: AppTheme.kPrimary50,
                  ),
                  hint: "Nom et prénom",
                  controller: fullNameCodeController,
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
                const Gap(16),
                CustomTextField(
                  prefix: Icon(
                    Icons.email_outlined,
                    color: AppTheme.kPrimary50,
                  ),
                  hint: "Email",
                  controller: emailController,
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
                const Gap(16),
                PhoneInputField(
                  controller: phoneController,
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomButton(
          isFullWidth: true,
          text: "S’inscrire",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SuccesView()));
          },
        ),
      ),
    );
  }
}
