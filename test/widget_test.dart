import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:house_organizer/main.dart';
import 'package:house_organizer/features/auth/screens/login_screen.dart';
import 'package:house_organizer/features/auth/screens/signup_screen.dart';

void main() {
  testWidgets('Login screen has required elements', (
    WidgetTester tester,
  ) async {
    // Build the login screen directly
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    // Verify that the login screen has the required elements
    expect(find.text('Sign in to your account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Sign up screen has required elements', (
    WidgetTester tester,
  ) async {
    // Build the sign up screen directly
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SignUpScreen(),
        ),
      ),
    );

    // Verify that the sign up screen has the required elements
    expect(find.text('Create your account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4)); // Name, email, password, confirm password fields
    expect(find.text('Continue'), findsOneWidget);
  });
}
