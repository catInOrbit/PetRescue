import 'package:flutter/material.dart';
import 'package:petrescue/_routing/routes.dart';
import 'package:petrescue/login/SignIn.dart';
import 'package:petrescue/login/SignUp.dart';
import 'package:petrescue/login/forgot_password.dart';
import 'package:petrescue/widgets/postFeed/post_home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => PostHomePage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => ForgotScreen());
      break;
    default:
      return MaterialPageRoute(builder: (context) => PostHomePage());
  }
}
