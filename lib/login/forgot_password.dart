import 'package:flutter/material.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:email_validator/email_validator.dart';
class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {

  bool viewVisible=false;

  void showWidget(){
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#FFB9AC'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          elevation: 0,
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: HexColor('#FFB9AC'),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Forgot your',
                        style: TextStyle(fontSize: 40,),
                      ),
                      Text(
                        'password?',
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          "No problem! Just fill in the email below and we'll"),
                      Text("send you pasword reset instructions!")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 390,
                      width: 300,
                      //color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Form(
                            autovalidate: true,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Your Email',
                                border: OutlineInputBorder(),
                              ),
                                validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email"
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: RaisedButton(
                              child: Text(
                                'Reset Password',
                              ),
                              onPressed: () {
                                  showWidget();
                              },
                              color: Colors.green,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,10),
                            child: Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: viewVisible,
                              child: Container(
                                height: 150,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                        "We've just sent you an email with instructions on how to reset password."

                                    ),
                                    // Container(
                                    //   alignment: Alignment.centerLeft,
                                    //   child: RaisedButton(
                                    //     onPressed: () {
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 LoginPage()),
                                    //       );
                                    //     },
                                    //     child: Text('Back to Login Page!'),color: Colors.indigoAccent,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
