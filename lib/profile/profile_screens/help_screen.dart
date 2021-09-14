
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
        title: Text('Chúng tôi đã nhận được tin của bạn!'),
        content: Text(
            "Chúng tôi sẽ gửi phản hồi cho bạn sớm nhất có thể."
        ),
        actions: [
          MaterialButton(onPressed: (){
            Navigator.pop(context,false);
          },elevation: 5,
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
          'Trợ giúp',
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
                child: Text('Gửi', style: TextStyle(fontSize: 18),),
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
                      'Tiêu đề',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Đặt tiêu đề'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Mô tả',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Nội dung'),
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