import 'package:flutter/material.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class HouseSettingsScreen extends StatelessWidget {
  const HouseSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      title: 'House Settings',
      message: 'Manage your house preferences and members.',
      icon: Icons.home_outlined,
    );
  }
}
