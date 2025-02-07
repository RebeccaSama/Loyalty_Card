import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/common/custom_button.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class MyCurrency extends StatefulWidget {
  const MyCurrency({super.key});

  @override
  State<MyCurrency> createState() => _MyCurrencyState();
}

class _MyCurrencyState extends State<MyCurrency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ma Monnaie",
                textAlign: TextAlign.center,
                style: GoogleFonts.dosis(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.kPrimaryColor),
              ),
              Text(
                "Digital guide !",
                textAlign: TextAlign.center,
                style: GoogleFonts.dosis(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.kPrimary50),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Image.asset("assets/images/my_currency.png"),
              ),
              RichText(
                text: TextSpan(
                  text: '1500 ',
                  style: GoogleFonts.dosis(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'XAF',
                        style: GoogleFonts.dosis(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.kPrimaryColor)),
                  ],
                ),
              ),
              const Gap(14),
              Text(
                "Votre reliquat disponible. Utilisez-le lors de votre prochain achat !",
                textAlign: TextAlign.center,
                style: GoogleFonts.dosis(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.kPrimary50),
              ),
              const Gap(24),
              CustomButton(
                text: "Get it",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
