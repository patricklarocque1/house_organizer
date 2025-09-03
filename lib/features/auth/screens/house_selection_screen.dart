import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/auth/screens/create_house_screen.dart';
import 'package:house_organizer/features/auth/screens/join_house_screen.dart';
import 'package:house_organizer/features/auth/screens/login_screen.dart';
import 'package:house_organizer/data/models/user.dart';

class HouseSelectionScreen extends ConsumerStatefulWidget {
  final String email;
  final String password;
  final String displayName;

  const HouseSelectionScreen({
    super.key,
    required this.email,
    required this.password,
    required this.displayName,
  });

  @override
  ConsumerState<HouseSelectionScreen> createState() =>
      _HouseSelectionScreenState();
}

class _HouseSelectionScreenState extends ConsumerState<HouseSelectionScreen> {
  bool _isLoading = false;

  Future<void> _createAccount(UserRole role, String houseId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await ref
          .read(authNotifierProvider.notifier)
          .createUserWithEmailAndPassword(
            email: widget.email,
            password: widget.password,
            displayName: widget.displayName,
            houseId: houseId,
            role: role,
          );

      if (mounted) {
        // Navigate to main app or show success message
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Please sign in.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account creation failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Role'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                'Welcome, ${widget.displayName}!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Are you joining an existing group home or creating a new one?',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Join existing house option
              Card(
                child: InkWell(
                  onTap: _isLoading
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => JoinHouseScreen(
                                email: widget.email,
                                password: widget.password,
                                displayName: widget.displayName,
                                onAccountCreated: _createAccount,
                              ),
                            ),
                          );
                        },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Join Existing House',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'I have a join code from a supervisor',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Create new house option
              Card(
                child: InkWell(
                  onTap: _isLoading
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreateHouseScreen(
                                email: widget.email,
                                password: widget.password,
                                displayName: widget.displayName,
                                onAccountCreated: _createAccount,
                              ),
                            ),
                          );
                        },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_home_outlined,
                          size: 48,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Create New House',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'I am a supervisor creating a new group home',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Loading indicator
              if (_isLoading) const Center(child: CircularProgressIndicator()),

              const Spacer(),

              // Back button
              TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
