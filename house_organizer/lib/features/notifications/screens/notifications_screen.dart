import 'package:flutter/material.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      title: 'Notifications',
      message: 'View and manage your notifications here.',
      icon: Icons.notifications_none,
    );
  }
}
