import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_template/features/registration/screens/registration_failed_screen.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/bloc/authentication_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/registration_bloc.dart';
import 'screens/registration_screen.dart';

class RegistrationNavigator {
  static GoRoute getRoute(AuthenticationBloc authenticationBloc) {
    return GoRoute(
      path: '/registration',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => RegistrationBloc(authenticationBloc),
          child: const RegistrationScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'failed',
          builder: (context, state) {
            return BlocProvider.value(
              value: BlocProvider.of<RegistrationBloc>(context),
              child: const RegistrationFailedScreen(),
            );
          },
        ),
      ],
    );
  }
}
