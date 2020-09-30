import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photo;

  const UserEntity({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.photo,
  })  : assert(id != null),
        assert(email != null);

  static const UserEntity empty = UserEntity(
    id: "",
    name: "",
    email: "",
    photo: "",
  );

  @override
  List<Object> get props => [id, name, email, photo];
}
