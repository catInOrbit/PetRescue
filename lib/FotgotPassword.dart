import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/Colors.dart';
class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
        // body: Center(
        //   child: Container(
        //     alignment: Alignment.center,
        //     height: 256,
        //     width: 387,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/petfamily.png'),
        //             fit: BoxFit.none)),
        //   ),
        // ),
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
                        style: TextStyle(fontSize: 40),
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
                      height: 120,
                      width: 300,
                      //color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Your Email',
                              border: OutlineInputBorder(),
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
                              onPressed: () {},
                              color: Colors.green,
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