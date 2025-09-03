# Supervisor Dashboard

The Supervisor Dashboard provides cross-house visibility for users with the `supervisor` or `admin` role.

Key features:
- Overview metrics: houses, residents, lists, task status breakdown, overdue count
- List of houses supervised with quick metrics

Code entry points:
- UI: `lib/features/supervisor/screens/supervisor_dashboard_screen.dart`
- Providers: `lib/features/supervisor/providers/supervisor_providers.dart`
- Repository: `lib/features/supervisor/repositories/supervisor_repository.dart`

Data model assumptions:
- Houses have `supervisorIds: string[]` to grant visibility
- Tasks and lists include `houseId` for scoping

Security rules:
- Full example rules are provided at `house_organizer/firebase/firestore.rules:1`.
- Highlights:
  - Supervisors: access to entities in houses where their UID is in `supervisorIds`.
  - Residents: access scoped to their house membership.
  - Admins: full access.
  - Writes to `audit_logs`: disabled from client; use server-side only.

Navigation:
- `DashboardScreen` detects role and shows this dashboard for supervisors/admins
