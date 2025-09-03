import 'package:flutter/material.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      title: 'Reports',
      message: 'View activity reports and analytics.',
      icon: Icons.analytics_outlined,
    );
  }
}
