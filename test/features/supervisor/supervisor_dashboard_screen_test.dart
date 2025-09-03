import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_organizer/data/models/user.dart' as app_user;
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/supervisor/models/supervisor_stats.dart';
import 'package:house_organizer/features/supervisor/providers/supervisor_providers.dart';
import 'package:house_organizer/features/supervisor/screens/supervisor_dashboard_screen.dart';
import 'package:house_organizer/data/models/house.dart';

void main() {
  testWidgets('Supervisor dashboard shows overview stats and houses', (tester) async {
    final user = app_user.User(
      id: 'sup1',
      email: 'sup@example.com',
      displayName: 'Supervisor',
      houseId: 'h0',
      role: app_user.UserRole.supervisor,
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
    );

    final stats = const SupervisorStats(
      houseCount: 2,
      residentCount: 6,
      listCount: 5,
      tasksPending: 3,
      tasksInProgress: 2,
      tasksCompleted: 10,
      tasksOverdue: 1,
    );

    final houses = [
      House(
        id: 'h1',
        name: 'Elm House',
        address: '1 Elm St',
        joinCode: 'ABC123',
        createdBy: 'admin',
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        residentIds: ['a', 'b', 'c'],
        supervisorIds: ['sup1'],
      ),
      House(
        id: 'h2',
        name: 'Oak House',
        address: '2 Oak Ave',
        joinCode: 'DEF456',
        createdBy: 'admin',
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
        residentIds: ['d', 'e', 'f'],
        supervisorIds: ['sup1'],
      ),
    ];

    await tester.pumpWidget(ProviderScope(overrides: [
      currentUserProvider.overrideWith((ref) async => user),
      supervisorStatsProvider.overrideWith((ref) async => stats),
      supervisorHousesProvider.overrideWith((ref) async => houses),
    ], child: const MaterialApp(home: SupervisorDashboardScreen())));

    await tester.pumpAndSettle();

    expect(find.text('Supervisor Dashboard'), findsOneWidget);
    expect(find.text('Houses'), findsOneWidget);
    expect(find.text('2'), findsWidgets);
    expect(find.text('Elm House'), findsOneWidget);
    expect(find.text('Oak House'), findsOneWidget);
  });
}
