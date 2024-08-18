import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<LoginRequested>(_onLoginReqested);
  }

  Future<void> _onLoginReqested(
    LoginRequested event,
    Emitter<RegistrationState> emit,
  ) async {
    return emit(RegistrationInitial());
  }
}
