import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        backgroundColor: HexColor('FFC494'),
        elevation: 0,
        title: Text(
          'Giới thiệu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: HexColor('FFC494'),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height * 0.5,
             // color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'Về chúng tôi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 5,),
                  Text(
                      'Chúng tôi tạo ra nhằm mang đến sự giúp đỡ nhanh nhất đến chó mèo khi chúng gặp tai nạn, thất lạc, cần nhà ở,... thông qua việc liên kết với các trung tâm cứu hộ chó mèo',
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                  SizedBox(height: 5,),
                  Text('Nếu có gì sai sót, chúng tôi xin phép thứ lỗi',
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                  SizedBox(height: 5,),
                  Text('Chúng tôi sẽ cố gắng để mang lại app tốt nhất đến với người dùng.'
                  ,style: TextStyle(
                      fontSize: 15
                    ),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
