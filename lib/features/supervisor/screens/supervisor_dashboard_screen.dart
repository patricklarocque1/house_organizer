import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/user.dart' as app_user;
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/supervisor/providers/supervisor_providers.dart';

class SupervisorDashboardScreen extends ConsumerWidget {
  const SupervisorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(currentUserProvider);
    final statsAsync = ref.watch(supervisorStatsProvider);
    final housesAsync = ref.watch(supervisorHousesProvider);

    return authState.when(
      data: (user) {
        if (user == null ||
            (user.role != app_user.UserRole.supervisor &&
                user.role != app_user.UserRole.admin)) {
          return Scaffold(
            appBar: AppBar(title: const Text('Supervisor Dashboard')),
            body: const Center(
              child: Text('You do not have access to this dashboard.'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Supervisor Dashboard'),
            actions: const [
              // Provide an accessible skip-to-content action for screen readers
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: 'Overview statistics',
                    child: _Overview(statsAsync: statsAsync),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Houses you supervise',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  housesAsync.when(
                    data: (houses) {
                      if (houses.isEmpty) {
                        return _InfoCard(
                          icon: Icons.home_outlined,
                          title: 'No houses assigned',
                          message:
                              'Ask an admin to add you as a supervisor.',
                        );
                      }
                      return Column(
                        children: [
                          for (final h in houses)
                            Semantics(
                              label:
                                  'House ${h.name}, ${h.residentIds?.length ?? 0} residents',
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(Icons.home),
                                  title: Text(h.name),
                                  subtitle: Text(h.address),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.group, size: 18),
                                      const SizedBox(width: 4),
                                      Text('${h.residentIds?.length ?? 0}'),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (e, _) => _ErrorText(error: e.toString()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(body: _ErrorText(error: e.toString())),
    );
  }
}

class _Overview extends ConsumerWidget {
  const _Overview({required this.statsAsync});
  final AsyncValue statsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return statsAsync.when(
      data: (stats) {
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _SummaryCard(
              color: Colors.indigo,
              icon: Icons.home_work_outlined,
              label: 'Houses',
              value: '${stats.houseCount}',
            ),
            _SummaryCard(
              color: Colors.teal,
              icon: Icons.group_outlined,
              label: 'Residents',
              value: '${stats.residentCount}',
            ),
            _SummaryCard(
              color: Colors.orange,
              icon: Icons.pending_actions_outlined,
              label: 'Pending',
              value: '${stats.tasksPending}',
            ),
            _SummaryCard(
              color: Colors.blue,
              icon: Icons.playlist_add_check_circle_outlined,
              label: 'In Progress',
              value: '${stats.tasksInProgress}',
            ),
            _SummaryCard(
              color: Colors.green,
              icon: Icons.check_circle_outline,
              label: 'Completed',
              value: '${stats.tasksCompleted}',
            ),
            _SummaryCard(
              color: Colors.red,
              icon: Icons.warning_amber,
              label: 'Overdue',
              value: '${stats.tasksOverdue}',
            ),
            _SummaryCard(
              color: Colors.purple,
              icon: Icons.list_alt_outlined,
              label: 'Lists',
              value: '${stats.listCount}',
            ),
          ],
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, _) => _ErrorText(error: e.toString()),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
  });

  final Color color;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label: $value',
      button: false,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 160, minHeight: 100),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.12),
                  foregroundColor: color,
                  radius: 24,
                  child: Icon(icon, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.7),
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.icon, required this.title, required this.message});
  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(message),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText({required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Error: $error',
        style:
            Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
      ),
    );
  }
}
