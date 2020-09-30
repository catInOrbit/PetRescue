import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../authentication/domain/authentication_repository.dart';
import '../../core/widgets/google_sign_in_button.dart';
import '../bloc/login_cubit.dart';

class LogInPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LogInPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          context.repository<AuthenticationRepository>(),
        ),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == FormzStatus.submissionFailure) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Authentication Failure",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              if (state.error.trim().length > 0) {
                switch (state.error.trim()) {
                  case "wrong-password":
                    context.bloc<LoginCubit>().passwordChanged("");
                    break;
                  case "user-not-found":
                    context.bloc<LoginCubit>().emailChanged("");
                    break;
                }
              }
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please log in with your email and password\nor continue with your google account!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    _EmailField(),
                    SizedBox(
                      height: 16.0,
                    ),
                    _PasswordField(),
                    SizedBox(
                      height: 16.0,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.rememberMe != current.rememberMe,
                      builder: (context, state) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    _LogInButton(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 0.5,
                          width: 100.0,
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 0.5,
                          width: 100.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return GoogleSignInButton(
                          text: "Log in with Google",
                          onPressed: () =>
                              context.bloc<LoginCubit>().logInWithGoogle(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        Text(
                          "Sign Up.",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => context.bloc<LoginCubit>().emailChanged(email),
          decoration: InputDecoration(
            errorText: state.email.invalid ? 'Invalid email' : null,
            suffixIcon: Icon(Icons.mail_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            hintText: "Enter your email",
            labelText: "E-Mail",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.all(20.0),
          ),
          style: TextStyle(
            fontSize: 18.0,
          ),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            errorText: state.password.invalid ? 'Invalid password' : null,
            suffixIcon: Icon(Icons.lock_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            hintText: "Enter your password",
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.all(20.0),
          ),
          style: TextStyle(
            fontSize: 18.0,
          ),
        );
      },
    );
  }
}

class _LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MaterialButton(
          height: 50.0,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.blue,
          child: state.status.isSubmissionInProgress
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
          onPressed: () {
            if (state.status == FormzStatus.valid) {
              context.bloc<LoginCubit>().logInWithCredentials();
            } else if (state.status == FormzStatus.pure) {
              context.bloc<LoginCubit>().emailChanged("");
              context.bloc<LoginCubit>().passwordChanged("");
            }
          },
        );
      },
    );
  }
}
