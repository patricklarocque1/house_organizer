import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/settings/providers/dev_settings_provider.dart';

class DeveloperSettingsScreen extends ConsumerStatefulWidget {
  const DeveloperSettingsScreen({super.key});

  @override
  ConsumerState<DeveloperSettingsScreen> createState() => _DeveloperSettingsScreenState();
}

class _DeveloperSettingsScreenState extends ConsumerState<DeveloperSettingsScreen> {
  late final TextEditingController _desktopHost;
  late final TextEditingController _androidHost;
  late final TextEditingController _iosHost;
  late final TextEditingController _firestorePort;
  late final TextEditingController _authPort;
  late final TextEditingController _storagePort;
  late final TextEditingController _dcHost;
  late final TextEditingController _dcPort;

  bool _useFirebaseEmulators = true;
  bool _useDcEmulator = true;

  @override
  void initState() {
    super.initState();
    final s = ref.read(devSettingsProvider);
    _desktopHost = TextEditingController(text: s.hostDesktop);
    _androidHost = TextEditingController(text: s.hostAndroidEmulator);
    _iosHost = TextEditingController(text: s.hostIOSSimulator);
    _firestorePort = TextEditingController(text: s.firestorePort.toString());
    _authPort = TextEditingController(text: s.authPort.toString());
    _storagePort = TextEditingController(text: s.storagePort.toString());
    _dcHost = TextEditingController(text: s.dataConnectHost);
    _dcPort = TextEditingController(text: s.dataConnectPort.toString());
    _useFirebaseEmulators = s.useFirebaseEmulators;
    _useDcEmulator = s.useDataConnectEmulator;
  }

  @override
  void dispose() {
    _desktopHost.dispose();
    _androidHost.dispose();
    _iosHost.dispose();
    _firestorePort.dispose();
    _authPort.dispose();
    _storagePort.dispose();
    _dcHost.dispose();
    _dcPort.dispose();
    super.dispose();
  }

  void _save() {
    final notifier = ref.read(devSettingsProvider.notifier);

    int parsePort(TextEditingController c, int fallback) {
      final v = int.tryParse(c.text.trim());
      return (v != null && v > 0) ? v : fallback;
    }

    notifier.setUseFirebaseEmulators(_useFirebaseEmulators);
    notifier.setHostDesktop(_desktopHost.text.trim());
    notifier.setHostAndroidEmulator(_androidHost.text.trim());
    notifier.setHostIOSSimulator(_iosHost.text.trim());
    notifier.setFirestorePort(parsePort(_firestorePort, 8080));
    notifier.setAuthPort(parsePort(_authPort, 9099));
    notifier.setStoragePort(parsePort(_storagePort, 9199));

    notifier.setUseDataConnectEmulator(_useDcEmulator);
    notifier.setDataConnectHost(_dcHost.text.trim());
    notifier.setDataConnectPort(parsePort(_dcPort, 9399));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Developer settings saved'),
          action: SnackBarAction(
            label: 'Restart note',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  void _reset() {
    ref.read(devSettingsProvider.notifier).reset();
    final s = ref.read(devSettingsProvider);
    setState(() {
      _desktopHost.text = s.hostDesktop;
      _androidHost.text = s.hostAndroidEmulator;
      _iosHost.text = s.hostIOSSimulator;
      _firestorePort.text = s.firestorePort.toString();
      _authPort.text = s.authPort.toString();
      _storagePort.text = s.storagePort.toString();
      _dcHost.text = s.dataConnectHost;
      _dcPort.text = s.dataConnectPort.toString();
      _useFirebaseEmulators = s.useFirebaseEmulators;
      _useDcEmulator = s.useDataConnectEmulator;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Firebase Emulators', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Use Firebase Emulators'),
                    value: _useFirebaseEmulators,
                    onChanged: (v) => setState(() => _useFirebaseEmulators = v),
                    subtitle: const Text('Restart app required to apply'),
                  ),
                  const SizedBox(height: 8),
                  _hostField('Desktop host', _desktopHost),
                  const SizedBox(height: 8),
                  _hostField('Android emulator host', _androidHost),
                  const SizedBox(height: 8),
                  _hostField('iOS simulator host', _iosHost),
                  const SizedBox(height: 8),
                  _portField('Firestore port', _firestorePort),
                  const SizedBox(height: 8),
                  _portField('Auth port', _authPort),
                  const SizedBox(height: 8),
                  _portField('Storage port', _storagePort),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data Connect Emulator', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Use Data Connect Emulator'),
                    value: _useDcEmulator,
                    onChanged: (v) => setState(() => _useDcEmulator = v),
                  ),
                  const SizedBox(height: 8),
                  _hostField('Data Connect host', _dcHost),
                  const SizedBox(height: 8),
                  _portField('Data Connect port', _dcPort),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.restore),
                  label: const Text('Reset Defaults'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Note: Firebase emulator changes take effect on next app start. \n'
            'Data Connect emulator changes apply immediately.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _hostField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _portField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

