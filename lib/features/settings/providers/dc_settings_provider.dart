import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/core/services/hive_service.dart';

class DcSettings {
  final bool mirrorEnabled;
  final bool mirrorOnlyWhenAssigned;
  const DcSettings({required this.mirrorEnabled, required this.mirrorOnlyWhenAssigned});

  DcSettings copyWith({bool? mirrorEnabled, bool? mirrorOnlyWhenAssigned}) => DcSettings(
        mirrorEnabled: mirrorEnabled ?? this.mirrorEnabled,
        mirrorOnlyWhenAssigned: mirrorOnlyWhenAssigned ?? this.mirrorOnlyWhenAssigned,
      );
}

class DcSettingsNotifier extends StateNotifier<DcSettings> {
  DcSettingsNotifier() : super(const DcSettings(mirrorEnabled: true, mirrorOnlyWhenAssigned: true)) {
    _load();
  }

  static const _keyMirrorEnabled = 'dc_mirror_enabled';
  static const _keyMirrorOnlyAssigned = 'dc_mirror_only_when_assigned';
  final _hive = HiveService.instance;

  void _load() {
    try {
      final box = _hive.settingsBox;
      final enabled = box.get(_keyMirrorEnabled) as bool?;
      final onlyAssigned = box.get(_keyMirrorOnlyAssigned) as bool?;
      state = DcSettings(
        mirrorEnabled: enabled ?? true,
        mirrorOnlyWhenAssigned: onlyAssigned ?? true,
      );
      box.put(_keyMirrorEnabled, state.mirrorEnabled);
      box.put(_keyMirrorOnlyAssigned, state.mirrorOnlyWhenAssigned);
    } catch (_) {
      // ignore loading errors; defaults apply
    }
  }

  void setMirrorEnabled(bool value) {
    state = state.copyWith(mirrorEnabled: value);
    _hive.settingsBox.put(_keyMirrorEnabled, value);
  }

  void setMirrorOnlyWhenAssigned(bool value) {
    state = state.copyWith(mirrorOnlyWhenAssigned: value);
    _hive.settingsBox.put(_keyMirrorOnlyAssigned, value);
  }
}

final dcSettingsProvider = StateNotifierProvider<DcSettingsNotifier, DcSettings>((ref) {
  return DcSettingsNotifier();
});

