import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_template/providers/authentication/authentication_repository.dart';
import 'package:flutter_mobile_template/providers/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_template/providers/localization/bloc/localization_bloc.dart';
import 'package:flutter_mobile_template/providers/localization/bloc/localization_state.dart';
import 'package:flutter_mobile_template/providers/user/user_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import 'features/home/home_screen.dart';
import 'features/registration/registration_screen.dart';
import 'features/settings/settings_landing_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize the app

  FlutterNativeSplash.remove();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            )..add(AuthenticationSubscriptionRequested()),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => LocalizationBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/registration',
          builder: (context, state) => const RegistrationScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsLandingScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            _router.go('/');
            break;
          case AuthenticationStatus.unauthenticated:
            _router.go('/login');
            break;
          case AuthenticationStatus.unknown:
            break;
        }
      },
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localizationState) {
          return MaterialApp.router(
            routerConfig: _router,
            locale: localizationState.locale,
            supportedLocales: const [Locale('en'), Locale('es')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return child!;
            },
          );
        },
      ),
    );
  }
}
