import 'package:equatable/equatable.dart';
import '../data/user_entity.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserEntity user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = UserEntity.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(UserEntity user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  @override
  List<Object> get props => [status, user];
}
