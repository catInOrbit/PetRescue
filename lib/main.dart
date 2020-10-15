import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/SilverAppBar.dart';

void main() {
  runApp(MaterialApp(
    home: profildsab(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

