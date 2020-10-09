
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/SignIn.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: HexColor('#FFB9AC'),
          body: Center(
            child: Container(
              height: 320,
              width: 390,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 256,
                      width: 387,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/petfamily.png'),
                              fit: BoxFit.none)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Text(
                      'PET EMERGENCY RESCUE',
                      style: TextStyle(color: Colors.indigoAccent, fontSize: 26),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}







