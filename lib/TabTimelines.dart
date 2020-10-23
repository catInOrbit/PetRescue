import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';

class PageTimelines extends StatefulWidget {
  @override
  _PageTimelinesState createState() => _PageTimelinesState();
}

class _PageTimelinesState extends State<PageTimelines> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0,10,10,0),
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(5.0),

            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Title is here'
                    ,style: TextStyle(fontSize: 20),),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                  //  color: Colors.red,
                    child: FittedBox(
                      //child: Image.file(globals.file),
                      child: Image.asset('lib/assets/Cat2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}
