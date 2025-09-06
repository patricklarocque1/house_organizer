import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart' as riverpod show AsyncValue;
import 'package:integration_test/integration_test.dart';
import 'package:house_organizer/features/dashboard/screens/dashboard_screen.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/data/models/user.dart' as app_user;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Dashboard shows supervisor view', (tester) async {
    final user = app_user.User(
      id: 'sup1',
      email: 'sup@example.com',
      displayName: 'Supervisor',
      houseId: 'h0',
      role: app_user.UserRole.supervisor,
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
    );

    // Provide a test AuthNotifier that exposes the desired user
    class _TestAuthNotifier extends StateNotifier<riverpod.AsyncValue<app_user.User?>> {
      _TestAuthNotifier(app_user.User u) : super(riverpod.AsyncValue.data(u));
    }

    await tester.pumpWidget(ProviderScope(overrides: [
      authNotifierProvider.overrideWith((ref) => _TestAuthNotifier(user)),
    ], child: const MaterialApp(home: DashboardScreen())));

    await tester.pumpAndSettle();
    expect(find.text('Supervisor Dashboard'), findsOneWidget);
  });
}
