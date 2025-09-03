import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart' as fdc;
import 'package:house_organizer/dataconnect_generated/example.dart';
import 'package:house_organizer/features/settings/providers/dev_settings_provider.dart';

/// Thin wrapper around the generated Data Connect SDK.
class DataConnectService {
  DataConnectService();

  final ExampleConnector _connector = ExampleConnector.instance;

  /// Optionally point to the Data Connect emulator.
  void useEmulator({String host = 'localhost', int port = 9399}) {
    _connector.dataConnect.useDataConnectEmulator(host, port);
  }

  /// Create a task and return its generated id.
  static fdc.Timestamp tsFromDateTime(DateTime dt) {
    final utc = dt.toUtc();
    final seconds = utc.millisecondsSinceEpoch ~/ 1000;
    final nanos = utc.millisecond * 1000000 + utc.microsecond * 1000;
    return fdc.Timestamp(nanos, seconds);
  }

  Future<String> createTask({
    required String groupHomeId,
    required String assignedToUserId,
    required String title,
    required String description,
    required fdc.Timestamp dueDate,
    required String type,
    required fdc.Timestamp createdAt,
  }) async {
    final result = await _connector
        .createTask(
          groupHomeId: groupHomeId,
          assignedToUserId: assignedToUserId,
          title: title,
          description: description,
          dueDate: dueDate,
          type: type,
          createdAt: createdAt,
        )
        .execute();
    return result.data.task_insert.id;
  }

  /// Fetch tasks using the generated query.
  Future<List<GetTasksTasks>> getTasks() async {
    final result = await _connector.getTasks().execute();
    return result.data.tasks;
  }

  /// Update a task and return its id if updated.
  Future<String?> updateTask(
    String id, {
    String? title,
    String? description,
    String? status,
  }) async {
    var builder = _connector.updateTask(id: id);
    if (title != null) builder = builder.title(title);
    if (description != null) builder = builder.description(description);
    if (status != null) builder = builder.status(status);
    final result = await builder.execute();
    return result.data.task_update?.id;
  }

  /// Delete a task and return its id if deleted.
  Future<String?> deleteTask(String id) async {
    final result = await _connector.deleteTask(id: id).execute();
    return result.data.task_delete?.id;
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
    final now = DateTime.now();

    // Upsert user
    await _connector
        .upsertUser(
          id: userId,
          displayName: displayName,
          email: email,
          role: role,
          createdAt: tsFromDateTime(now),
        )
        .photoUrl(photoUrl)
        .execute();

    // Upsert group home with current user as admin
    final gh = _connector
        .upsertGroupHome(
          id: groupHomeId,
          name: groupHomeName,
          adminUserId: userId,
          createdAt: tsFromDateTime(now),
        );
    if (groupHomeAddress != null && groupHomeAddress.isNotEmpty) {
      gh.address(groupHomeAddress);
    }
    if (groupHomeDescription != null && groupHomeDescription.isNotEmpty) {
      gh.description(groupHomeDescription);
    }
    await gh.execute();

    // Link user to group home (optional if you want backref)
    await _connector
        .updateUserGroupHome(
          id: userId,
          groupHomeId: groupHomeId,
        )
        .execute();
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
