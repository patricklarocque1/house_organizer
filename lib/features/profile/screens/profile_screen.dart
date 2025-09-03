import 'package:flutter/material.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      title: 'Profile',
      message: 'Manage your profile and account settings.',
      icon: Icons.person_outline,
    );
  }
}
