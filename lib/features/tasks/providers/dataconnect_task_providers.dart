import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/core/services/dataconnect_service.dart';
import 'package:house_organizer/dataconnect_generated/example.dart';

final dcTasksProvider = FutureProvider<List<GetTasksTasks>>((ref) async {
  final dc = ref.read(dataConnectServiceProvider);
  return dc.getTasks();
});

