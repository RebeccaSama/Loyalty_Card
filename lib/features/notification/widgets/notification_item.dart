import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/models/notification_class.dart';

class NotificationItem extends StatelessWidget {
  final NotificationClass notification;
  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notification.color,
      child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            notification.prefixIcon,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  maxLines: 3,
                  style: GoogleFonts.dosis(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  notification.subtitle,
                  style: GoogleFonts.dosis(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  notification.time,
                  style: GoogleFonts.dosis(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54),
                ),
              ],
            ),
            notification.sufixIcon
          ],
        ),
      ),
    );
  }
}
