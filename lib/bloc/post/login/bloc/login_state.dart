part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.rememberMe = false,
    this.error = "",
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final bool rememberMe;
  final String error;

  @override
  List<Object> get props => [email, password, status, rememberMe, error];

  LoginState copyWith({
    Email email,
    Password password,
    FormzStatus status,
    bool rememberMe,
    String error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      rememberMe: rememberMe ?? this.rememberMe,
      error: error ?? "",
    );
  }
}
