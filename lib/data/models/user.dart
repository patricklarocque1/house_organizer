import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String displayName,
    required String houseId,
    required UserRole role,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? profileImageUrl,
    bool? isActive,
    DateTime? lastLoginAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserRole { resident, supervisor, admin }

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
