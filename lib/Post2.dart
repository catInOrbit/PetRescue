import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/flutter_tagging.dart';

//library flutter_tagging;

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
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            color: HexColor('EBF3FA'),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                //color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ),
                    Text(
                      'Add Photos',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                child: Text('Story', style: TextStyle(fontSize: 18)),
              )),
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
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                child: Text('Tags', style: TextStyle(fontSize: 18)),
              )),
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
                      style: TextStyle(color: Colors.black26, fontSize: 24),
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
                      style: TextStyle(color: Colors.white, fontSize: 24),
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
              //  FlutterTa
            ],
          ),
          FlutterTagging(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.green.withAlpha(30),
                hintText: 'Search Tags',
                labelText: 'Select Tags',
              ),
            ),
            findSuggestions: (String) {},
            initialItems: <Taggable>[],
            configureSuggestion: (Taggable) {},
            configureChip: (Taggable) {},
          )
        ],
      ),
    );
  }
}