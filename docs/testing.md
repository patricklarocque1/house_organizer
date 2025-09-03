# Testing Strategy

Test layers:

- Unit: Pure logic, parsing, helpers. Keep Firebase-dependent logic behind repository interfaces.
- Widget: UI widgets with provider overrides to inject test data.
- Integration: App flows that don’t require real network by overriding providers.

What was added:
- Widget test for Supervisor Dashboard with overridden providers.
- Widget tests for accessibility of list item card and add item dialog.
- Integration smoke test asserting supervisor dashboard renders.

Run locally:

```
flutter test
```

Integration tests:

```
flutter test integration_test
```

CI runs `flutter analyze` and `flutter test` on pushes/PRs.

