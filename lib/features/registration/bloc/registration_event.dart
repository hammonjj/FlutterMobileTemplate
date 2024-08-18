part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

final class LoginRequested extends RegistrationEvent {}

final class RegisterRequested extends RegistrationEvent {}
