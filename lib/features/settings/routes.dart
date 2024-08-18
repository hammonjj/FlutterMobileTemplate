import 'package:flutter_mobile_template/features/settings/preferences_screen.dart';
import 'package:flutter_mobile_template/features/settings/profile_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> settingsRoutes() {
  return [
    GoRoute(
      path: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: 'profile',
      builder: (context, state) => const PreferencesScreen(),
    ),
  ];
}
