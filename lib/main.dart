import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/notification_service.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/auth/screens/login_screen.dart';
import 'package:house_organizer/features/dashboard/screens/home_screen.dart';
import 'package:house_organizer/features/notifications/widgets/notification_banner.dart';
import 'package:house_organizer/data/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await HiveService.instance.init();
  await FirebaseService.instance.initialize();
  await NotificationService().initialize();

  runApp(const ProviderScope(child: HouseOrganizerApp()));
}

class HouseOrganizerApp extends StatelessWidget {
  const HouseOrganizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        // Accessibility improvements
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodySmall: TextStyle(fontSize: 12),
        ),
        // High contrast support
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodySmall: TextStyle(fontSize: 12),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NotificationBanner(child: SplashScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to auth state changes
    ref.listen<AsyncValue<User?>>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (context.mounted) {
            if (user != null) {
              // User is authenticated, navigate to main app
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else {
              // User is not authenticated, navigate to login
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          }
        },
        error: (error, stackTrace) {
          // Handle error, navigate to login
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
      );
    });

    return _SplashScreenContent();
  }
}

class _SplashScreenContent extends StatefulWidget {
  @override
  State<_SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<_SplashScreenContent> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate initialization time
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_work,
              size: 100,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(height: 24),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Group-Home Task Organizer',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withValues(alpha: 0.8),
                  ),
            ),
            const SizedBox(height: 48),
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
