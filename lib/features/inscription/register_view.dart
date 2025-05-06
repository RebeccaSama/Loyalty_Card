import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/custom_text_field.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/inscription/controller/register_controller.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final registerController = ref.watch(registerControllerProvider);

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
                          prefix: Icon(
                            Icons.person_2_outlined,
                            color:
                                AppTheme.kPrimaryColor.withValues(alpha: 0.3),
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
                          prefix: Icon(
                            Icons.person_2_outlined,
                            color:
                                AppTheme.kPrimaryColor.withValues(alpha: 0.3),
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
                    keyboardType: TextInputType.emailAddress,
                    prefix: Icon(
                      Icons.email_outlined,
                      color: AppTheme.kPrimaryColor.withValues(alpha: 0.3),
                    ),
                    hint: "Email",
                    controller: registerController.emailController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  const Gap(16),
                  PhoneInputField(
                    controller: registerController.phoneNumberController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 72),
                    child: CustomButton(
                      isFullWidth: true,
                      text: "S’inscrire",
                      isDisabled: registerController.isLoading ||
                          registerController.lastNameController.text.isEmpty ||
                          registerController.firstNameController.text.isEmpty ||
                          registerController
                              .phoneNumberController.text.isEmpty ||
                          registerController.emailController.text.isEmpty,
                      loading: registerController.isLoading,
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
