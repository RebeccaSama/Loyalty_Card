import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/notification/widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " Notification ",
              textAlign: TextAlign.center,
              style: GoogleFonts.dosis(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.kPrimaryColor),
            ),
            const SizedBox(height: 33),
            const NotificationWidget(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(0, 0, 0, 0.12),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('voir plus',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.87)),
                          )),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
