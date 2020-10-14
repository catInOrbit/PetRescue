import 'package:flutter/cupertino.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/login/FotgotPassword.dart';
import 'package:petrescue/login/SignUp.dart';
import 'package:email_validator/email_validator.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool _showPassword = false;
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 256,
              width: 387,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/petfamily.png'),
                      fit: BoxFit.none)),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'PET EMERGENCY RESCUE',
                style: TextStyle(color: Colors.indigoAccent, fontSize: 26),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 300,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Form(
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    //hintText: "Input yor Email",
                                      labelText: 'Email',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.account_circle)),
                                  validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email"
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Pleas input your password';
                                  }
                                  return null;
                                },
                                obscureText: !this._showPassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.security),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        color: this._showPassword ? Colors.blue : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() => this._showPassword = !this._showPassword);
                                      } ,
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 300,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          color: Colors.white,
                          child: Text(
                            'Sign in',
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ForgotScreen()),
                );
              },
              child: Text(
                "Forgot Password?", style: TextStyle(color: Colors.indigoAccent),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OR",
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign in with Google",
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "New to App? ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up', style: TextStyle(
                      color: Colors.indigoAccent
                  ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
    ;
  }
}
