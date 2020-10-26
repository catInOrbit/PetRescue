import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close, color: Colors.white,),
        onPressed: () {
          Navigator.pop(context,false);
        },),
        backgroundColor: HexColor('FFC494'),
        elevation: 0,
        title: Text('About', style: TextStyle(
          color: Colors.white
        ),),
      ),
      backgroundColor: HexColor('FFC494'),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 200,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                  //color: Colors.white,
//backgroundBlendMode: BlendMode.color,
                  image:  DecorationImage(
                  image: AssetImage('lib/assets/WomanHoldingDog.png',),
                  fit: BoxFit.fill,
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
