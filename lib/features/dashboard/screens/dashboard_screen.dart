import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/user.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/supervisor/screens/supervisor_dashboard_screen.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return authState.when(
      data: (user) {
        if (user != null &&
            (user.role == UserRole.supervisor || user.role == UserRole.admin)) {
          return const SupervisorDashboardScreen();
        }
        return const ComingSoonScreen(
          title: 'Dashboard',
          message: 'A detailed dashboard with charts and insights.',
          icon: Icons.dashboard_outlined,
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Error: ${e.toString()}')),
      ),
    );
  }
}
