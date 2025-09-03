# Compliance Overview

This app uses Firebase for authentication, storage, and messaging.

Privacy:
- Personal data: name, email, optional profile image.
- Operational data: tasks, lists, audit logs associated with a house.
- Data residency: Firestore configured with Canadian region (`northamerica-northeast1` intended; verify in Firebase console).

Security:
- Enforce Firestore Security Rules with least privilege. Supervisors can only access houses where their UID is in `supervisorIds` and derived resources (tasks/lists) scoped by `houseId`.
- Authentication: Firebase Auth (password-based). Consider MFA for admins.
- Audit logs: Use `audit_logs` collection to track sensitive actions.

Accessibility:
- WCAG 2.2 AA guidance implemented; see `docs/accessibility.md`.

Notifications:
- Provide opt-in user controls; configurable quiet hours; avoid sensitive content in notifications.

Data retention:
- Define retention periods for logs and inactive users.

Incident response:
- Document support contact, incident management flow, and data export/deletion process.

