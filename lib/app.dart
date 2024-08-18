import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_template/core/custom_colors.dart';
import 'package:flutter_mobile_template/core/enums.dart';
import 'package:flutter_mobile_template/core/theme.dart';
import 'package:flutter_mobile_template/features/home/home_screen.dart';
import 'package:flutter_mobile_template/features/registration/registration_navigator.dart';
import 'package:flutter_mobile_template/features/settings/settings_landing_screen.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/repositories/authentication_repository.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/repositories/user_repository.dart';
import 'package:flutter_mobile_template/global_blocs/localization/bloc/localization_bloc.dart';
import 'package:flutter_mobile_template/global_blocs/localization/bloc/localization_state.dart';
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
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  GoRouter _initializeRouter(BuildContext context) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        RegistrationNavigator.getRoute(
          BlocProvider.of<AuthenticationBloc>(context),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsLandingScreen(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository,
            userRepository: _userRepository,
          )..add(AuthenticationSubscriptionRequested()),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc(),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.authenticated ||
              state.status == AuthenticationStatus.unauthenticated ||
              state.status == AuthenticationStatus.failedAuthentication) {
            FlutterNativeSplash.remove();

            if (state.status == AuthenticationStatus.authenticated) {
              _router.go('/');
            } else if (state.status == AuthenticationStatus.unauthenticated) {
              _router.go('/registration');
            } else if (state.status ==
                AuthenticationStatus.failedAuthentication) {
              _router.go('/registration/failed');
            }
          }
        },
        child: Builder(
          builder: (context) {
            _router = _initializeRouter(context);

            return BlocBuilder<LocalizationBloc, LocalizationState>(
              builder: (context, localizationState) {
                return MaterialApp.router(
                  theme: theme,
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
                    return Container(
                      decoration: const BoxDecoration(
                          gradient: CustomColors.backgroundGradient),
                      child: child,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
