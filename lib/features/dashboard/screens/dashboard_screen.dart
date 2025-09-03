import 'package:flutter/material.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      title: 'Dashboard',
      message: 'A detailed dashboard with charts and insights.',
      icon: Icons.dashboard_outlined,
    );
  }
}
