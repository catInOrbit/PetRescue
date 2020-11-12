import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';

class PostEmpty extends StatelessWidget
{
  final Post postModel;
  const PostEmpty({Key key, @required this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),

          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cravenherald.co.uk%2Fnews%2F10757397.injured-dog-rescued-from-buckden-pike-showing-signs-of-recovery%2F&psig=AOvVaw31VJt-aoNSGQKwpxXsjrD8&ust=1605238058942000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjRxv2H_OwCFQAAAAAdAAAAABB8")
                          ,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00ffffff), Colors.black],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 11,
                      bottom: 42,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 700,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      print("Tap");
                                      // _showPopupMenu(context);
                                    },
                                    child: Ink(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "lib/assets/setting_icon.png")),
                                    ),
                                  )),
                              Positioned(
                                  left: 20,
                                  child: Text(
                                    "20 phút trước",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 92),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trung tâm đang thực hiện kiểm tra y tế",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 19.50),
        Container(
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),

          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          NetworkImage("https://baltimore.cbslocal.com/wp-content/uploads/sites/15910056/2020/03/89638645_10158671183159869_1049985264669163520_n.jpg")
                          ,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00ffffff), Colors.black],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 11,
                      bottom: 42,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 700,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      print("Tap");
                                      // _showPopupMenu(context);
                                    },
                                    child: Ink(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "lib/assets/setting_icon.png")),
                                    ),
                                  )),
                              Positioned(
                                  left: 20,
                                  child: Text(
                                    "20 phút trước",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 92),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trung tâm đã tìm thấy chó ở góc đường",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

class PostEmptyUpdateRescued extends StatelessWidget
{
  final Post postModel;
  const PostEmptyUpdateRescued({Key key, @required this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),

          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          NetworkImage("https://www.advantagepetcare.com.au/sites/g/files/adhwdz311/files/styles/paragraph_image/public/2020-07/istock-802799294_unrestricted_1110x800.jpg?itok=R51kcQGy")
                          ,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00ffffff), Colors.black],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 11,
                      bottom: 42,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 700,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      print("Tap");
                                      // _showPopupMenu(context);
                                    },
                                    child: Ink(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "lib/assets/setting_icon.png")),
                                    ),
                                  )),
                              Positioned(
                                  left: 20,
                                  child: Text(
                                    "20 phút trước",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 92),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bun cực kì hăng sức và thích chơi",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 19.50),
        Container(
          width: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),

          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          NetworkImage("https://resc-files-prod.s3.us-west-1.amazonaws.com/s3fs-public/styles/large/public/2018-12/dogs-benson_1.jpg?itok=GY5qtAXm")
                          ,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00ffffff), Colors.black],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 11,
                      bottom: 42,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 700,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {
                                      print("Tap");
                                      // _showPopupMenu(context);
                                    },
                                    child: Ink(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.asset(
                                              "lib/assets/setting_icon.png")),
                                    ),
                                  )),
                              Positioned(
                                  left: 20,
                                  child: Text(
                                    "20 phút trước",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 92),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Chó Bun được cho ăn hằng ngày",
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
