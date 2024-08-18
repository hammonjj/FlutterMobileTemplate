part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = const User.empty(),
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.failedAuthentication()
      : this._(status: AuthenticationStatus.failedAuthentication);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
