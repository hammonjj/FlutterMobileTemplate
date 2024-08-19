import 'package:equatable/equatable.dart';
import 'package:flutter_guid/flutter_guid.dart';

class User extends Equatable {
  User(Guid guid, String s, {Guid? id, this.name})
      : id = id ?? Guid.defaultValue;

  const User.empty()
      : id = null,
        name = null;

  final Guid? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];

  static const defaultUser = User.empty();
}
