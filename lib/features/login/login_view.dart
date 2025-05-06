import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/common/phonein_put_ield.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/inscription/register_view.dart';
import 'package:loyalty_card/features/login/controller/login_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final ScrollController _scrollController = ScrollController();
  late FocusNode _phoneFocusNode;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode = FocusNode();
    _phoneFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _phoneFocusNode.removeListener(_handleFocusChange);
    _phoneFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_phoneFocusNode.hasFocus) {
      // Délai pour laisser le clavier apparaître avant de faire défiler
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent -
              MediaQuery.of(context).viewInsets.bottom,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
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
                  left: -100,
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
                  const SizedBox(height: 56),
                  const Text(
                    "Veuillez entrer votre numéro de téléphone pour accéder à votre compte.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(32),
                  PhoneInputField(
                    controller: loginController.phoneNumberController,
                    title: "Numéro de téléphone",
                    focusNode: _phoneFocusNode,
                  ),
                  const Gap(72),
                  CustomButton(
                    isFullWidth: true,
                    text: "Se connecter",
                    isDisabled:
                        loginController.phoneNumberController.text.isEmpty,
                    onPressed: () async {
                      await loginController.login(context);
                    },
                    loading: loginController.isLoading,
                  ),
                  const Gap(72),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                    ),
                    child: Row(
                      children: [
                        const Text("Vous n'avez pas de compte ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            child: const Text("créer un compte",
                                style: TextStyle(
                                  color: AppTheme.kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ))),
                      ],
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
