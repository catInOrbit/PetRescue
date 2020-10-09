import 'package:flutter/cupertino.dart';
import 'package:petrescue/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/FotgotPassword.dart';
import 'package:petrescue/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool _showPassword = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: HexColor('#FFB9AC'),
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 256,
                width: 387,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/petfamily.png'),
                        fit: BoxFit.none)),
              ),
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
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                          decoration: InputDecoration(
                              //hintText: "Input yor Email",
                              labelText: 'Email',
                              border: OutlineInputBorder()),
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
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
                        )),
                    ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Sign in',
                        ),
                        onPressed: () {},
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
                          SignUpScreen()),
                );
              },
              child: Text(
                "Forgot Password?",
                
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
                              ForgotScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up'
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
