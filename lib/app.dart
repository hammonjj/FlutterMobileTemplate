import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_template/features/authentication/authentication_repository.dart';
import 'package:flutter_mobile_template/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_template/features/authentication/user_repository.dart';
import 'package:flutter_mobile_template/features/home/home_screen.dart';
import 'package:flutter_mobile_template/features/localization/bloc/localization_bloc.dart';
import 'package:flutter_mobile_template/features/localization/bloc/localization_state.dart';
import 'package:flutter_mobile_template/features/registration/registration_screen.dart';
import 'package:flutter_mobile_template/features/settings/settings_landing_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();

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

    FlutterNativeSplash.remove();
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
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _router.go('/');
                break;
              case AuthenticationStatus.unauthenticated:
                _router.go('/registration');
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
              );
            },
          ),
        ),
      ),
    );
  }
}
