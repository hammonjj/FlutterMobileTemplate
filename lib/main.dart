import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/features/home/home_screen.dart';
import 'package:flutter_mobile_template/features/registration/registration_screen.dart';
import 'package:flutter_mobile_template/features/settings/routes.dart';
import 'package:flutter_mobile_template/features/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) => RegistrationScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => SettingsScreen(),
        routes: settingsRoutes(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final supportedLocales = ref.watch(supportedLocalesProvider);
    final localizationsDelegates = ref.watch(localizationsDelegatesProvider);

    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
    );
  }
}
