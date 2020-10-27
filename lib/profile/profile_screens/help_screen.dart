
import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/colors.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  createAlertDialog(BuildContext context){

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Thank you for contacting us!'),
        content: Text(
            "Your inquiry has been successfully sent to our support"
        ),
        actions: [
          MaterialButton(onPressed: (){},elevation: 5,
            child: Text('OK'),)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor('#FFB9AC'),
      appBar: AppBar(
        backgroundColor: HexColor('#FFB9AC'),
        elevation: 0,
        title: Text(
          'Help',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  createAlertDialog(context);
                },
                child: Text('Send', style: TextStyle(fontSize: 18),),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 200,
              //  color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'SUBJECT',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Issue subject'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ISSUE DESCRIPTION',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Add an issue description'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}