import 'dart:async';

import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_mobile_template/features/authentication/user_model.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(Guid.generate(), 'John Doe'),
    );
  }
}
