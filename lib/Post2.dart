import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';

class PostSecond extends StatefulWidget {
  @override
  _PostSecondState createState() => _PostSecondState();
}

class _PostSecondState extends State<PostSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#FFB9AC'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
        elevation: 0,
        // actions: <Widget>[
        //   RaisedButton(
        //
        //   )
        // ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Text('Story'),
          Container(
            width: 365,
            height: 125,
            color: HexColor('EBF3FA'),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'I found the kitten...'),
            ),
          ),
          Text('Tags'),
          Container(
            width: 365,
            height: 45,
            color: HexColor('EBF3FA'),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Start Typing'),
            ),
          ),
          Row(
            children: <Widget>[
              Text(''),
              Container(
                color: HexColor('F99746'),
                child: Text(
                  'Male',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: HexColor('F99746'),
                child: Text(
                  'Male',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: HexColor('F99746'),
                child: Text(
                  'Male',
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                //color: HexColor('#FF8088'),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Skip',
                      style:
                      TextStyle(color: Colors.black26, fontSize: 24),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: HexColor('#FF8088'),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Proceed',
                      style:
                      TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
