import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/user.dart';

class JoinHouseScreen extends ConsumerStatefulWidget {
  final String email;
  final String password;
  final String displayName;
  final Future<void> Function(UserRole role, String houseId) onAccountCreated;

  const JoinHouseScreen({
    super.key,
    required this.email,
    required this.password,
    required this.displayName,
    required this.onAccountCreated,
  });

  @override
  ConsumerState<JoinHouseScreen> createState() => _JoinHouseScreenState();
}

class _JoinHouseScreenState extends ConsumerState<JoinHouseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _joinCodeController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _joinCodeController.dispose();
    super.dispose();
  }

  Future<void> _joinHouse() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // For now, we'll create the account as a resident
      // In a real implementation, you would validate the join code
      // and get the house ID from the server
      await widget.onAccountCreated(
        UserRole.resident,
        'temp_house_id', // This would be the actual house ID from the join code
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to join house: ${e.toString()}'),
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
        title: const Text('Join House'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  'Join a Group Home',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter the join code provided by your supervisor',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Join code field
                TextFormField(
                  controller: _joinCodeController,
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _joinHouse(),
                  decoration: const InputDecoration(
                    labelText: 'Join Code',
                    hintText: 'Enter 6-character code',
                    prefixIcon: Icon(Icons.key_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the join code';
                    }
                    if (value.length != 6) {
                      return 'Join code must be 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Info card
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Ask your supervisor for the join code if you don\'t have it',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Join button
                ElevatedButton(
                  onPressed: _isLoading ? null : _joinHouse,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Join House'),
                ),
                const SizedBox(height: 24),

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
      ),
    );
  }
}
