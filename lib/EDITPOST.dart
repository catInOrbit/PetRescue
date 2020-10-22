import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/Post2.dart';
import 'package:image_picker/image_picker.dart';
import 'globals.dart' as globals;

// File file;
class EditPost extends StatefulWidget {
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  void pickImage() async {
    PickedFile pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    globals.file = File(pickedFile.path);
    setState(() {});
  }

  String strBtnSelectGender;
  static const genderItems = <String>['Male', 'Female', 'Bê đê'];
  final List<DropdownMenuItem<String>> _dropDownGenderItems = genderItems
      .map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ))
      .toList();

  String strBtnSelectMonthAge;
  static const monthsItems = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  final List<DropdownMenuItem<String>> _dropDownMonthAgeItems = monthsItems
      .map((String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor('#FFB9AC'),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: HexColor('#FFB9AC'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: GestureDetector(
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostSecond(),
                      ));
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[

            Container(
            height: 200,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: HexColor('EBF3FA'),
            child: globals.file == null ? Center(
              child: Container(
                height: 100,
                width: 100,
                //color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: IconButton(
                        iconSize: 50,
                        onPressed: pickImage,
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
            )
                :
            FittedBox(
              child: Image.file(globals.file),
              fit: BoxFit.fill,
            )
          //  Image.file(globals.file),
      ),

      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Details',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Container(
                  height: 45,
                  color: HexColor('#EBF3FA'),
                  child: TextField(
                    decoration: InputDecoration(
                      //labelText: 'Name',
                      hintText: 'Stranded Kitten',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                  child: Text(
                    'Animal Type',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Container(
                  height: 45,
                  color: HexColor('#EBF3FA'),
                  child: TextField(
                    decoration: InputDecoration(
                      //labelText: 'Name',
                      hintText: 'House Cat',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                  child: Text(
                    'Location',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Container(
                  height: 45,
                  color: HexColor('#EBF3FA'),
                  child: TextField(
                    decoration: InputDecoration(
                      //labelText: 'Name',
                        hintText: 'Choose Location...',
                        // border: OutlineInputBorder(
                        //     borderSide:
                        //         BorderSide(color: Colors.transparent)),
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(Icons.gps_not_fixed),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5, 15, 0),
                child: Row(

                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Gender',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 90,
                            height: 40,
                            color: HexColor('#EBF3FA'),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Choose'),
                                value: strBtnSelectGender,
                                onChanged: ((String newValue) {
                                  setState(() {
                                    strBtnSelectGender = newValue;
                                  });
                                }),
                                items: _dropDownGenderItems,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Age',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              color: HexColor('#EBF3FA'),
                              width: 54,
                              height: 40,
                              child: TextField(
                                keyboardType:
                                TextInputType.numberWithOptions(),
                                decoration: InputDecoration.collapsed(
                                    hintText: '6-8'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              color: HexColor('E5E5E5'),
                              width: 90,
                              height: 40,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text('Months'),
                                  value: strBtnSelectMonthAge,
                                  onChanged: ((String newValue) {
                                    setState(() {
                                      strBtnSelectMonthAge = newValue;
                                    });
                                  }),
                                  items: _dropDownMonthAgeItems,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Center(
      //   child: RaisedButton(
      //     onPressed: () {},
      //     color: HexColor('#FF8068'),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         Text('Proceed',
      //           style: TextStyle(color: Colors.white, fontSize: 24),),
      //         SizedBox(width: 12,),
      //         Icon(Icons.arrow_forward,color: Colors.white,)
      //       ],
      //     ),
      //   ),
      // )
      ],
    ),)
    ,
    );
  }
}
