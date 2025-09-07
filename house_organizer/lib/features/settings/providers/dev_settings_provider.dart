import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/core/config/emulator_config.dart';

class DevSettings {
  final bool useFirebaseEmulators;
  final String hostDesktop;
  final String hostAndroidEmulator;
  final String hostIOSSimulator;
  final int firestorePort;
  final int authPort;
  final int storagePort;

  final bool useDataConnectEmulator;
  final String dataConnectHost;
  final int dataConnectPort;

  const DevSettings({
    required this.useFirebaseEmulators,
    required this.hostDesktop,
    required this.hostAndroidEmulator,
    required this.hostIOSSimulator,
    required this.firestorePort,
    required this.authPort,
    required this.storagePort,
    required this.useDataConnectEmulator,
    required this.dataConnectHost,
    required this.dataConnectPort,
  });

  factory DevSettings.defaults() => DevSettings(
        useFirebaseEmulators: false, // Changed from kDebugMode to false
        hostDesktop: 'localhost',
        hostAndroidEmulator: '10.0.2.2',
        hostIOSSimulator: 'localhost',
        firestorePort: 8080,
        authPort: 9099,
        storagePort: 9199,
        useDataConnectEmulator: false, // Changed from kDebugMode to false
        dataConnectHost: 'localhost',
        dataConnectPort: 9399,
      );

  DevSettings copyWith({
    bool? useFirebaseEmulators,
    String? hostDesktop,
    String? hostAndroidEmulator,
    String? hostIOSSimulator,
    int? firestorePort,
    int? authPort,
    int? storagePort,
    bool? useDataConnectEmulator,
    String? dataConnectHost,
    int? dataConnectPort,
  }) {
    return DevSettings(
      useFirebaseEmulators: useFirebaseEmulators ?? this.useFirebaseEmulators,
      hostDesktop: hostDesktop ?? this.hostDesktop,
      hostAndroidEmulator: hostAndroidEmulator ?? this.hostAndroidEmulator,
      hostIOSSimulator: hostIOSSimulator ?? this.hostIOSSimulator,
      firestorePort: firestorePort ?? this.firestorePort,
      authPort: authPort ?? this.authPort,
      storagePort: storagePort ?? this.storagePort,
      useDataConnectEmulator:
          useDataConnectEmulator ?? this.useDataConnectEmulator,
      dataConnectHost: dataConnectHost ?? this.dataConnectHost,
      dataConnectPort: dataConnectPort ?? this.dataConnectPort,
    );
  }

  EmulatorConfig toEmulatorConfig() => EmulatorConfig(
        useFirebaseEmulators: useFirebaseEmulators,
        hostDesktop: hostDesktop,
        hostAndroidEmulator: hostAndroidEmulator,
        hostIOSSimulator: hostIOSSimulator,
        firestorePort: firestorePort,
        authPort: authPort,
        storagePort: storagePort,
        useDataConnectEmulator: useDataConnectEmulator,
        dataConnectHost: dataConnectHost,
        dataConnectPort: dataConnectPort,
      );
}

class DevSettingsNotifier extends StateNotifier<DevSettings> {
  DevSettingsNotifier() : super(DevSettings.defaults());

  void reset() => state = DevSettings.defaults();

  void setUseFirebaseEmulators(bool enabled) =>
      state = state.copyWith(useFirebaseEmulators: enabled);
  void setHostDesktop(String host) => state = state.copyWith(hostDesktop: host);
  void setHostAndroidEmulator(String host) =>
      state = state.copyWith(hostAndroidEmulator: host);
  void setHostIOSSimulator(String host) =>
      state = state.copyWith(hostIOSSimulator: host);
  void setFirestorePort(int port) =>
      state = state.copyWith(firestorePort: port);
  void setAuthPort(int port) => state = state.copyWith(authPort: port);
  void setStoragePort(int port) => state = state.copyWith(storagePort: port);

  void setUseDataConnectEmulator(bool enabled) =>
      state = state.copyWith(useDataConnectEmulator: enabled);
  void setDataConnectHost(String host) =>
      state = state.copyWith(dataConnectHost: host);
  void setDataConnectPort(int port) =>
      state = state.copyWith(dataConnectPort: port);
}

final devSettingsProvider =
    StateNotifierProvider<DevSettingsNotifier, DevSettings>((ref) {
  return DevSettingsNotifier();
});
