# CI/CD

GitHub Actions workflow (`.github/workflows/ci.yml`) provides:

- Analyze and run tests on Ubuntu for pushes/PRs.
- Build Android App Bundle on pushes.
- Build iOS on macOS (requires codesigning setup and may be non-blocking).

App store deployment (Fastlane):

- Android: `android/fastlane/Fastfile` with lanes:
  - `build`: produce AAB
  - `deploy_internal`: upload to Play internal track (requires service account)

- iOS: `ios/fastlane/Fastfile` with lanes:
  - `build`: build IPA
  - `beta`: upload to TestFlight

Secrets to configure:

- Google Play service account JSON (`FASTLANE_JSON_KEY` or checked-in path configured in Appfile)
- iOS App Store Connect API Key or Apple ID credentials (use App Store Connect API keys)
- Keystore for Android signing (Gradle config) and Apple signing certificates/profiles

Example GitHub Secrets:

- `FASTLANE_JSON_KEY` (Android)
- `APP_STORE_CONNECT_API_KEY` (iOS; or use `fastlane match` with repo secrets)

