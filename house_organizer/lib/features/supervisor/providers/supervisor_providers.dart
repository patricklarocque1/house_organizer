import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/house.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/supervisor/models/supervisor_stats.dart';
import 'package:house_organizer/features/supervisor/repositories/supervisor_repository.dart';

final supervisorRepositoryProvider = Provider<SupervisorRepository>((ref) {
  return SupervisorRepository();
});

final supervisorHousesProvider = FutureProvider<List<House>>((ref) async {
  final user = await ref.watch(currentUserProvider.future);
  if (user == null) return [];
  final repo = ref.watch(supervisorRepositoryProvider);
  return repo.getHousesForSupervisor(user.id);
});

final supervisorStatsProvider = FutureProvider<SupervisorStats>((ref) async {
  final user = await ref.watch(currentUserProvider.future);
  final repo = ref.watch(supervisorRepositoryProvider);
  if (user == null) {
    return const SupervisorStats(
      houseCount: 0,
      residentCount: 0,
      listCount: 0,
      tasksPending: 0,
      tasksInProgress: 0,
      tasksCompleted: 0,
      tasksOverdue: 0,
    );
  }
  return repo.getSupervisorStats(user.id);
});

