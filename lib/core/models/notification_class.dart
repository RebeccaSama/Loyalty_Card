import 'package:flutter/material.dart';

class NotificationClass {
  final Widget prefixIcon;
  final Icon sufixIcon;
  final Color color;
  final String title, subtitle, time;

  NotificationClass({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.prefixIcon,
    required this.sufixIcon,
    required this.time,
  });
}
