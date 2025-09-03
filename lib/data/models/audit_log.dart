import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

@freezed
@HiveType(typeId: 10)
class AuditLog with _$AuditLog {
  const factory AuditLog({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String houseId,
    @HiveField(3) required AuditAction action,
    @HiveField(4) required String targetType,
    @HiveField(5) required String targetId,
    @HiveField(6) required DateTime timestamp,
    @HiveField(7) Map<String, dynamic>? metadata,
    @HiveField(8) String? description,
    @HiveField(9) String? userDisplayName,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);
}

@HiveType(typeId: 11)
enum AuditAction {
  @HiveField(0)
  create,
  @HiveField(1)
  update,
  @HiveField(2)
  delete,
  @HiveField(3)
  complete,
  @HiveField(4)
  assign,
  @HiveField(5)
  unassign,
  @HiveField(6)
  login,
  @HiveField(7)
  logout,
  @HiveField(8)
  joinHouse,
  @HiveField(9)
  leaveHouse,
}

extension AuditActionExtension on AuditAction {
  String get displayName {
    switch (this) {
      case AuditAction.create:
        return 'Created';
      case AuditAction.update:
        return 'Updated';
      case AuditAction.delete:
        return 'Deleted';
      case AuditAction.complete:
        return 'Completed';
      case AuditAction.assign:
        return 'Assigned';
      case AuditAction.unassign:
        return 'Unassigned';
      case AuditAction.login:
        return 'Logged In';
      case AuditAction.logout:
        return 'Logged Out';
      case AuditAction.joinHouse:
        return 'Joined House';
      case AuditAction.leaveHouse:
        return 'Left House';
    }
  }
}
