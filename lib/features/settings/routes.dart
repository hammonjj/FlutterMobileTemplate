import 'package:go_router/go_router.dart';

List<GoRoute> settingsRoutes() {
  return [
    GoRoute(
      path: 'account',
      builder: (context, state) => AccountScreen(),
    ),
    GoRoute(
      path: 'preferences',
      builder: (context, state) => PreferencesScreen(),
    ),
  ];
}
