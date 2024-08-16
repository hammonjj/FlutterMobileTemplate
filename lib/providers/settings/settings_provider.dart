import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsState {
  final bool notificationsEnabled;
  final bool darkModeEnabled;

  SettingsState(
      {required this.notificationsEnabled, required this.darkModeEnabled});
}

final settingsProvider = StateProvider<SettingsState>((ref) {
  return SettingsState(notificationsEnabled: true, darkModeEnabled: false);
});
