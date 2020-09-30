import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petrescue/authentication/bloc/authentication_bloc.dart';
import 'package:petrescue/authentication/bloc/authentication_event.dart';
import 'package:petrescue/authentication/bloc/authentication_state.dart';
import 'package:petrescue/authentication/data/user_entity.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        UserEntity currentUser = state.user;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentUser.name ?? "",
                ),
                Text(
                  currentUser.email ?? "",
                ),
                SizedBox(height: 75),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    context
                        .bloc<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested());
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
