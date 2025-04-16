import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/models/localisation_model.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class LocalisationsItem extends StatelessWidget {
  final Localisations localisations;
  const LocalisationsItem({super.key, required this.localisations});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppTheme.kPrimary12,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.kPrimary50),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  localisations.title,
                    style: GoogleFonts.dosis(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.kPrimaryColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
