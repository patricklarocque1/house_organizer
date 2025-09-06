# Integration Tests - Temporarily Disabled

## Why Disabled?
The integration test was temporarily disabled to resolve CI build conflicts. The `integration_test` package, when included as a dev_dependency, gets registered in production Android builds causing compilation failures.

## How to Re-enable?
1. Add `integration_test:` back to `pubspec.yaml` dev_dependencies:
   ```yaml
   dev_dependencies:
     integration_test:
       sdk: flutter
   ```
2. Rename `smoke_test.dart.disabled` back to `smoke_test.dart`
3. Run: `flutter pub get`
4. Run integration tests with: `flutter test integration_test/`

## Files:
- `smoke_test.dart.disabled` - The disabled integration test (rename to `.dart` to re-enable)

## Alternative Solutions:
- Use a separate Flutter project structure for integration tests
- Configure build scripts to exclude integration_test from production builds
- Use widget tests instead of integration tests where possible