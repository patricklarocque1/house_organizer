import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_data_connect/firebase_data_connect.dart' as fdc;
// import 'package:house_organizer/dataconnect_generated/example.dart';

// Temporary mock implementation until Firebase Data Connect is properly configured
class Timestamp {
  final int nanos;
  final int seconds;
  Timestamp(this.nanos, this.seconds);
}
import 'package:house_organizer/features/settings/providers/dev_settings_provider.dart';

/// Thin wrapper around the generated Data Connect SDK.
class DataConnectService {
  DataConnectService();

  // final ExampleConnector _connector = ExampleConnector.instance;

  /// Optionally point to the Data Connect emulator.
  void useEmulator({String host = 'localhost', int port = 9399}) {
    // _connector.dataConnect.useDataConnectEmulator(host, port);
    print('🔗 DataConnect emulator would be configured at $host:$port');
  }

  /// Create a task and return its generated id.
  static Timestamp tsFromDateTime(DateTime dt) {
    final utc = dt.toUtc();
    final seconds = utc.millisecondsSinceEpoch ~/ 1000;
    final nanos = utc.millisecond * 1000000 + utc.microsecond * 1000;
    return Timestamp(nanos, seconds);
  }

  Future<String> createTask({
    required String groupHomeId,
    required String assignedToUserId,
    required String title,
    required String description,
    required Timestamp dueDate,
    required String type,
    required Timestamp createdAt,
  }) async {
    // TODO: Implement with Firestore directly until Data Connect is properly configured
    print('🔗 DataConnect createTask called - using Firestore fallback');
    throw UnimplementedError('DataConnect not available - use TaskService instead');
  }

  /// Fetch tasks using the generated query.
  Future<List<dynamic>> getTasks() async {
    // TODO: Implement with Firestore directly
    print('🔗 DataConnect getTasks called - using Firestore fallback');
    return [];
  }

  /// Update a task and return its id if updated.
  Future<String?> updateTask(
    String id, {
    String? title,
    String? description,
    String? status,
  }) async {
    // TODO: Implement with Firestore directly
    print('🔗 DataConnect updateTask called - using Firestore fallback');
    return null;
  }

  /// Delete a task and return its id if deleted.
  Future<String?> deleteTask(String id) async {
    // TODO: Implement with Firestore directly
    print('🔗 DataConnect deleteTask called - using Firestore fallback');
    return null;
  }

  /// Ensure required relational rows exist in DC (User, GroupHome) and link them.
  Future<void> ensureUserAndGroupHome({
    required String userId,
    required String displayName,
    required String email,
    required String role,
    String? photoUrl,
    required String groupHomeId,
    required String groupHomeName,
    String? groupHomeAddress,
    String? groupHomeDescription,
  }) async {
    // TODO: Implement with Firestore directly until Data Connect is properly configured
    print('🔗 DataConnect ensureUserAndGroupHome called - using Firestore fallback');
    print('  User: $userId ($displayName) - $email [$role]');
    print('  GroupHome: $groupHomeId ($groupHomeName)');
  }
}

/// Riverpod provider for DataConnectService.
final dataConnectServiceProvider = Provider<DataConnectService>((ref) {
  final service = DataConnectService();
  final dev = ref.watch(devSettingsProvider);
  if (dev.useDataConnectEmulator) {
    service.useEmulator(host: dev.dataConnectHost, port: dev.dataConnectPort);
  }
  return service;
});
