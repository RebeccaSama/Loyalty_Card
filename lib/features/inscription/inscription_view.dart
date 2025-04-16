import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/custom_text_field.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/login/controller/register_controller.dart';

class InscriptionView extends ConsumerStatefulWidget {
  const InscriptionView({super.key});

  @override
  ConsumerState<InscriptionView> createState() => _InscriptionViewState();
}

class _InscriptionViewState extends ConsumerState<InscriptionView> {
  final TextEditingController fullNameCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerController = ref.read(registerControllerProvider);

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
                  height: 250,
                ),
                const Positioned(
                  top: 80,
                  left: -60,
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56),
                  const Text(
                    "Veuillez saisir vos identifiants pour vous inscrire",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(32),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          prefix: const Icon(
                            Icons.person_2_outlined,
                            color: AppTheme.kPrimaryColor,
                          ),
                          hint: "Nom",
                          controller: registerController.lastNameController,
                          onChanged: (_) {
                            setState(() {});
                          },
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: CustomTextField(
                          prefix: const Icon(
                            Icons.person_2_outlined,
                            color: AppTheme.kPrimaryColor,
                          ),
                          hint: "Prénom",
                          controller: registerController.firstNameController,
                          onChanged: (_) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  CustomTextField(
                    prefix: const Icon(
                      Icons.email_outlined,
                      color: AppTheme.kPrimaryColor,
                    ),
                    hint: "Email",
                    controller: registerController.emailController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    prefix: const Icon(
                      Icons.email_outlined,
                      color: AppTheme.kPrimaryColor,
                    ),
                    hint: "Password",
                    controller: registerController.passwordController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  const Gap(16),
                  PhoneInputField(
                    controller: phoneController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: CustomButton(
                      isFullWidth: true,
                      text: "S’inscrire",
                      onPressed: () async {
                        await registerController.register(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
