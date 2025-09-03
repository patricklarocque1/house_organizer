import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

@freezed
class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    required String userId,
    required String houseId,
    required AuditAction action,
    required String targetType,
    required String targetId,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
    String? description,
    String? userDisplayName,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);
}

enum AuditAction {
  create,
  update,
  delete,
  complete,
  assign,
  unassign,
  login,
  logout,
  joinHouse,
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
