class EmulatorConfig {
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

  const EmulatorConfig({
    this.useFirebaseEmulators = false,
    this.hostDesktop = 'localhost',
    this.hostAndroidEmulator = '10.0.2.2',
    this.hostIOSSimulator = 'localhost',
    this.firestorePort = 8080,
    this.authPort = 9099,
    this.storagePort = 9199,
    this.useDataConnectEmulator = false,
    this.dataConnectHost = 'localhost',
    this.dataConnectPort = 9399,
  });
}

