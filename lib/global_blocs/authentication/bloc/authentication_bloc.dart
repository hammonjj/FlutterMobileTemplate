import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_template/core/enums.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/models/user_model.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/repositories/authentication_repository.dart';
import 'package:flutter_mobile_template/global_blocs/authentication/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
    on<AuthenticationLoginEvent>(_onLoginEvent);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> _onLoginEvent(
    AuthenticationLoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authenticationRepository.logIn(provider: event.provider);
    } catch (_) {
      emit(const AuthenticationState.failedAuthentication());
    }
  }

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.status,
      onData: (status) async {
        switch (status) {
          case AuthenticationStatus.unauthenticated:
            return emit(const AuthenticationState.unauthenticated());
          case AuthenticationStatus.authenticated:
            final user = await _tryGetUser();
            return emit(
              user != null
                  ? AuthenticationState.authenticated(user)
                  : const AuthenticationState.unauthenticated(),
            );
          case AuthenticationStatus.unknown:
            return emit(const AuthenticationState.unknown());
          case AuthenticationStatus.failedAuthentication:
            return emit(const AuthenticationState.failedAuthentication());
        }
      },
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
