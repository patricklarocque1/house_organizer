import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:house_organizer/main.dart';

void main() {
  testWidgets('App initializes and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: HouseOrganizerApp()));

    // Verify that our splash screen shows the app name
    expect(find.text('House Organizer'), findsOneWidget);
    expect(find.text('Group-Home Task Organizer'), findsOneWidget);
    expect(find.byIcon(Icons.home_work), findsOneWidget);
    
    // Clean up any pending timers
    await tester.pumpAndSettle();
  });

  testWidgets('Splash screen transitions to home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: HouseOrganizerApp()));

    // Wait for splash screen to complete
    await tester.pumpAndSettle();

    // Verify that we're now on the home screen
    expect(find.text('Project initialized successfully!'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
}