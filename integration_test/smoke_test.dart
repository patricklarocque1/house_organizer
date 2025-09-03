import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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

    await tester.pumpWidget(ProviderScope(overrides: [
      currentUserProvider.overrideWith((ref) async => user),
    ], child: const MaterialApp(home: DashboardScreen())));

    await tester.pumpAndSettle();
    expect(find.text('Supervisor Dashboard'), findsOneWidget);
  });
}
