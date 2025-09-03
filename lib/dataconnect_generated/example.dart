library;

import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'create_task.dart';

part 'upsert_user.dart';

part 'upsert_group_home.dart';

part 'update_user_group_home.dart';

part 'get_tasks.dart';

part 'update_task.dart';

part 'delete_task.dart';

class ExampleConnector {
  CreateTaskVariablesBuilder createTask({
    required String groupHomeId,
    required String assignedToUserId,
    required String title,
    required String description,
    required Timestamp dueDate,
    required String type,
    required Timestamp createdAt,
  }) {
    return CreateTaskVariablesBuilder(
      dataConnect,
      groupHomeId: groupHomeId,
      assignedToUserId: assignedToUserId,
      title: title,
      description: description,
      dueDate: dueDate,
      type: type,
      createdAt: createdAt,
    );
  }

  UpsertUserVariablesBuilder upsertUser({
    required String id,
    required String displayName,
    required String email,
    required String role,
    required Timestamp createdAt,
  }) {
    return UpsertUserVariablesBuilder(
      dataConnect,
      id: id,
      displayName: displayName,
      email: email,
      role: role,
      createdAt: createdAt,
    );
  }

  UpsertGroupHomeVariablesBuilder upsertGroupHome({
    required String id,
    required String name,
    required String adminUserId,
    required Timestamp createdAt,
  }) {
    return UpsertGroupHomeVariablesBuilder(
      dataConnect,
      id: id,
      name: name,
      adminUserId: adminUserId,
      createdAt: createdAt,
    );
  }

  UpdateUserGroupHomeVariablesBuilder updateUserGroupHome({
    required String id,
    required String groupHomeId,
  }) {
    return UpdateUserGroupHomeVariablesBuilder(
      dataConnect,
      id: id,
      groupHomeId: groupHomeId,
    );
  }

  GetTasksVariablesBuilder getTasks() {
    return GetTasksVariablesBuilder(
      dataConnect,
    );
  }

  UpdateTaskVariablesBuilder updateTask({
    required String id,
  }) {
    return UpdateTaskVariablesBuilder(
      dataConnect,
      id: id,
    );
  }

  DeleteTaskVariablesBuilder deleteTask({
    required String id,
  }) {
    return DeleteTaskVariablesBuilder(
      dataConnect,
      id: id,
    );
  }

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'example',
    'app',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
