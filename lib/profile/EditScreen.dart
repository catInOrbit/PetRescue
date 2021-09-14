import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petrescue/profile/Colors.dart';
class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File file;
  void pickImage() async{
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(pickedFile.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFB9AC'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('#FFB9AC'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){},
          )
        ],
        title:Text("Edit account"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,

              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                 // color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: HexColor("#CCCA98"),
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: Icon(Icons.mode_edit, color: Colors.white, ),
                            onPressed: (){},
                            alignment:  Alignment.center,
                            iconSize: 18,
                          )
                          ,
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,

              child: Padding(
                padding: const EdgeInsets.fromLTRB(30,0,0,0),
                child: Column(
                  children: <Widget>[
                    Text("Profile page", style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Tên của bạn",
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Nghê nghiệp",
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Trung Tâm",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,

              child: Column(
                children: <Widget>[
                  Text("THÔNG TIN LIÊN HỆ",style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold
                  ),),
                  Row(children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(width: 15,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        labelText: "0123456789"
                      ),
                      keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.digitsOnly
                      // ], // Only numbers can be entered
                    ))
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.location_on),
                    SizedBox(width: 15,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        labelText: "Địa chỉ liên lạc"
                      ),
                    ))
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.email),
                    SizedBox(width: 15,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                          labelText: "lienhe@trangweb.com"
                      ),
                    ))
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.public),
                    SizedBox(width: 15,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        labelText: "https://www.trangwebcuaban.com"
                      ),
                    ))
                  ],),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
