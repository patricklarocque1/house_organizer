import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: 0)
class User with _$User {
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String displayName,
    @HiveField(3) required String houseId,
    @HiveField(4) required UserRole role,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) String? profileImageUrl,
    @HiveField(8) bool? isActive,
    @HiveField(9) DateTime? lastLoginAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  resident,
  @HiveField(1)
  supervisor,
  @HiveField(2)
  admin,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.supervisor:
        return 'Supervisor';
      case UserRole.admin:
        return 'Admin';
    }
  }

  bool get canManageTasks => this != UserRole.resident;
  bool get canManageUsers =>
      this == UserRole.supervisor || this == UserRole.admin;
  bool get canAccessDashboard =>
      this == UserRole.supervisor || this == UserRole.admin;
}
