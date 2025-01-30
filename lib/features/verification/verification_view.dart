import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/inscription/Inscription_view.dart';
import 'package:pinput/pinput.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController pinkCodeController = TextEditingController();
  bool showLoader = false;
  bool showSuccess = false;
  bool isCheck = false;

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
                  left: -80,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Vérification",
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
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 66),
                  RichText(
                    text: TextSpan(
                      text: 'Veuillez saisir le code OTP envoyé au ',
                      style: TextStyle(
                          color: AppTheme.kPrimary50,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '+994 (50) *** ** 67 ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff02021F))),
                      ],
                    ),
                  ),
                  const Gap(50),
                  Pinput(
                    controller: pinkCodeController,
                    autofocus: true,
                    length: 4,
                    showCursor: true,
                    preFilledWidget: const CircleAvatar(
                      radius: 4,
                      backgroundColor: Color.fromRGBO(0, 0, 0, 0.12),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    defaultPinTheme: PinTheme(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w900),
                      width: 59,
                      height: 59,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(0, 0, 0, 0.12)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      width: 59,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(0, 0, 0, 0.12)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      width: 59,
                      height: 59,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: pinkCodeController.text.length != 4
                                ? Colors.red
                                : AppTheme.kPrimaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    errorPinTheme: PinTheme(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (_) {
                      if (pinkCodeController.text.length == 4) {
                        setState(() {
                          showLoader = true;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppTheme.kRedColor,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Le code OTP que vous avez utilisé est incorrect ! Veuiller entrer le code corecte',
                                    style: GoogleFonts.dosis(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: AppTheme.kWhiteColor),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppTheme.kWhiteColor),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.close,
                                      color: AppTheme.kRedColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            behavior: SnackBarBehavior.fixed,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                          ),
                        );
                      }
                      return null;
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    onCompleted: (_) {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          showLoader = false;
                          showSuccess = true;
                        });
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const InscriptionView(),
                          ),
                        );
                      });
                    },
                  ),
                  const Gap(50),
                  Column(
                    children: [
                      const Text(
                        "Renvoyer le code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppTheme.kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("  (Dans",
                              style: TextStyle(
                                  color: AppTheme.kPrimary50,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          Text(" 30s)",
                              style: TextStyle(
                                  color: AppTheme.kPrimary50,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (showLoader && !showSuccess)
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: AppTheme.kGreenColor,
                        strokeWidth: 3,
                      )),
                    ),
                  if (showSuccess)
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 3, color: AppTheme.kGreenColor),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: AppTheme.kGreenColor,
                          weight: 50,
                          size: 26,
                        )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
