import 'package:hive_flutter/hive_flutter.dart';
import 'package:house_organizer/data/models/user.dart';
import 'package:house_organizer/data/models/house.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/audit_log.dart';
import 'package:house_organizer/core/constants/app_constants.dart';

class HiveService {
  static HiveService? _instance;
  static HiveService get instance => _instance ??= HiveService._();

  HiveService._();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(UserRoleAdapter());
    Hive.registerAdapter(HouseAdapter());
    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(TaskStatusAdapter());
    Hive.registerAdapter(TaskCategoryAdapter());
    Hive.registerAdapter(RepeatIntervalAdapter());
    Hive.registerAdapter(ListModelAdapter());
    Hive.registerAdapter(ListItemAdapter());
    Hive.registerAdapter(ListTypeAdapter());
    Hive.registerAdapter(AuditLogAdapter());
    Hive.registerAdapter(AuditActionAdapter());

    // Open boxes
    await Future.wait([
      Hive.openBox<User>(AppConstants.usersBox),
      Hive.openBox<House>(AppConstants.housesBox),
      Hive.openBox<Task>(AppConstants.tasksBox),
      Hive.openBox<ListModel>(AppConstants.listsBox),
      Hive.openBox<AuditLog>(AppConstants.auditLogsBox),
      Hive.openBox(AppConstants.settingsBox),
    ]);

    _isInitialized = true;
  }

  Box<User> get usersBox => Hive.box<User>(AppConstants.usersBox);
  Box<House> get housesBox => Hive.box<House>(AppConstants.housesBox);
  Box<Task> get tasksBox => Hive.box<Task>(AppConstants.tasksBox);
  Box<ListModel> get listsBox => Hive.box<ListModel>(AppConstants.listsBox);
  Box<AuditLog> get auditLogsBox =>
      Hive.box<AuditLog>(AppConstants.auditLogsBox);
  Box get settingsBox => Hive.box(AppConstants.settingsBox);

  Future<void> clearAllData() async {
    await Future.wait([
      usersBox.clear(),
      housesBox.clear(),
      tasksBox.clear(),
      listsBox.clear(),
      auditLogsBox.clear(),
      settingsBox.clear(),
    ]);
  }

  Future<void> close() async {
    await Hive.close();
    _isInitialized = false;
  }
}
