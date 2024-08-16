import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationState {
  final String username;
  final bool isRegistered;

  RegistrationState({required this.username, required this.isRegistered});
}

final registrationProvider = StateProvider<RegistrationState>((ref) {
  return RegistrationState(username: '', isRegistered: false);
});
