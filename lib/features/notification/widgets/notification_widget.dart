import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/notification_model.dart';
import 'package:loyalty_card/features/notification/widgets/notification_item.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: notificationItems.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: NotificationItem(notification: notificationItems[index]));
      },
      separatorBuilder: (_, __) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Divider(
            thickness: 0.2,
            color: AppTheme.kPrimaryColor,
          ),
        );
      },
    );
  }
}
