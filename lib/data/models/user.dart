import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'UserAdapter')
abstract class User with _$User {
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String displayName,
    @HiveField(3) required String houseId, // Keep for backward compatibility
    @HiveField(4) required UserRole role,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) String? profileImageUrl,
    @HiveField(8) bool? isActive,
    @HiveField(9) DateTime? lastLoginAt,
    @HiveField(10) String? groupHomeId, // Aligned with Data Connect
    @HiveField(11) String? photoUrl, // Aligned with Data Connect
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@HiveType(typeId: 2, adapterName: 'UserRoleAdapter')
enum UserRole {
  @HiveField(0)
  resident,
  @HiveField(1)
  supervisor,
  @HiveField(2)
  admin
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

// Extension for backward compatibility and Data Connect alignment
extension UserCompatibility on User {
  // For backward compatibility with existing code
  String get groupHomeId => this.groupHomeId ?? houseId;
  String get photoUrl => this.photoUrl ?? profileImageUrl ?? '';
  
  // Create a User with backward-compatible field names
  factory User.fromLegacyJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      houseId: json['houseId'] as String? ?? json['groupHomeId'] as String,
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.resident,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      profileImageUrl: json['profileImageUrl'] as String?,
      isActive: json['isActive'] as bool?,
      lastLoginAt: json['lastLoginAt'] != null ? DateTime.parse(json['lastLoginAt'] as String) : null,
      groupHomeId: json['groupHomeId'] as String? ?? json['houseId'] as String?,
      photoUrl: json['photoUrl'] as String? ?? json['profileImageUrl'] as String?,
    );
  }
}
