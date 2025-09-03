# Verify Android 16KB Page-Size Compatibility

This checklist helps you verify that your Android artifacts package native libraries
uncompressed and page-aligned, which is required for reliable loading on devices
with a 16KB OS page size.

Prerequisites:
- Java (JDK 11+)
- `bundletool` (1.15+ recommended)
- `zipinfo`/`unzip` or similar zip inspection tools
- Optional: `aapt` or `aapt2` for APK inspection

## 1) Build your release bundle

```bash
cd house_organizer
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

## 2) Convert AAB to APKs with bundletool

Use universal mode for quick inspection, or build device-specific splits.

```bash
cd build/app/outputs/bundle/release

# Universal APKs (single APK containing all ABIs)
java -jar /path/to/bundletool.jar build-apks \
  --bundle=app-release.aab \
  --output=app-release_universal.apks \
  --mode=universal \
  --overwrite

unzip -l app-release_universal.apks
unzip -p app-release_universal.apks universal.apk > universal.apk
```

Alternatively, generate device-specific splits:

```bash
java -jar /path/to/bundletool.jar build-apks \
  --bundle=app-release.aab \
  --output=app-release_splits.apks \
  --connected-device \
  --overwrite

unzip -l app-release_splits.apks
```

## 3) Verify native libs are uncompressed

Inspect the APK’s `lib/` directory. `.so` entries should be stored with compression method `0` (stored), not `8` (deflated).

```bash
# Using zipinfo
zipinfo -v universal.apk | sed -n "/^Central directory .* follows:/,$p" | grep " lib/" | head

# Or list and check method column (should be 'stor' for .so files)
zipinfo universal.apk | grep " lib/"
```

Expected: All `.so` files in `lib/<abi>/` show as stored (uncompressed).

If using `aapt`:

```bash
aapt list -a universal.apk | grep lib/
```

## 4) Verify manifest disables legacy extraction

Confirm `android:extractNativeLibs="false"` in the app manifest inside the APK:

```bash
unzip -p universal.apk AndroidManifest.xml > AndroidManifest.binary.xml
# Use aapt to dump or a binary XML viewer, e.g.:
aapt dump xmltree universal.apk AndroidManifest.xml | grep extractNativeLibs
```

Expected: `android:extractNativeLibs=(type 0x12)0x0` (false).

## 5) Notes and troubleshooting

- Ensure the project sets:
  - `android.bundle.enableUncompressedNativeLibs=true` (gradle.properties)
  - `<application android:extractNativeLibs="false" .../>` (AndroidManifest.xml)
- Use a recent Android Gradle Plugin and bundletool to get page-aligned uncompressed `.so` files.
- Avoid legacy JNI packaging (`jniLibs.useLegacyPackaging=true`) or forcing compression for `.so` files.

