import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_template/core/enums.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/bloc/authentication_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthenticationBloc authenticationBloc;
  late final StreamSubscription authenticationSubscription;

  RegistrationBloc(this.authenticationBloc) : super(RegistrationInitial()) {
    on<LoginRequested>(_onLoginReqested);

    authenticationSubscription = authenticationBloc.stream.listen((authState) {
      if (authState.status != AuthenticationStatus.failedAuthentication) {
        return;
      }

      // Handle failed authentication by navigating to a different screen
    });
  }

  @override
  Future<void> close() {
    authenticationSubscription.cancel();
    return super.close();
  }

  Future<void> _onLoginReqested(
    LoginRequested event,
    Emitter<RegistrationState> emit,
  ) async {
    authenticationBloc.add(AuthenticationLoginEvent(provider: event.provider));
  }
}
