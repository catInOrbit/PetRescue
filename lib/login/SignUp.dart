    import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:petrescue/login/SignIn.dart';
import 'package:petrescue/bloc/app_general/global.dart' as globals;
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  bool _showPassword = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: HexColor('#FFB9AC'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          elevation: 0,
        ),
        backgroundColor: HexColor('#FFB9AC'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Register a new account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Họ',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 45,
                    child: TextField(
                      obscureText: !this._showPassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.security),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: this._showPassword
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() =>
                                  this._showPassword = !this._showPassword);
                            },
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    child: RaisedButton(
                      onPressed: () {
                        saveUserAccount;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpComplete()),
                        );
                      },
                      child: Text('Register'),
                      color: Colors.red,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                //   child: Container(
                //     height: 45,
                //     child: Text("Already have an account? Sign in"),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveUserAccount()
  {

  }
}


class SignUpComplete extends StatefulWidget {
  @override
  _SignUpCompleteState createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        backgroundColor: HexColor('#FFB9AC'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: Column(
                  children: <Widget>[
                    Text('Verify your account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Form(
                        autovalidate: true,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),

                          ),
                            controller: TextEditingController()..text = 'Your email.'
                        ),
                      ),
                    ),
                    Text(
                      "We will send you a verification email"
                    ),
                    Text(
                        "Click on the link to verify your account "
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Select resend if you haven't received an email"),
                    ),
                    RaisedButton(
                      child: Text('Resend verification email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage()),
                          );
                        },
                        child: Text('Back to login'),color: Colors.indigoAccent,
                      ),
                    ),

                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
