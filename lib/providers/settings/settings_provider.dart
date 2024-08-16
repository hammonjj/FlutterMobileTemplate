import 'package:riverpod/riverpod.dart';

class SettingsState {
  final bool notificationsEnabled;

  SettingsState({required this.notificationsEnabled});
}

final settingsProvider = StateProvider<SettingsState>((ref) {
  return SettingsState(notificationsEnabled: true);
});
