part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {}

final class AuthenticationLogoutPressed extends AuthenticationEvent {}

final class AuthenticationLoginEvent extends AuthenticationEvent {
  final AuthenticationProviders provider;

  const AuthenticationLoginEvent({required this.provider});
}
