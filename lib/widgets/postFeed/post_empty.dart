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
    (!currentUser.isVerifyRescueCenter && postModel.postType != PostType.RequestPost)
                              ?
                          NetworkImage("https://www.trendingbreeds.com/wp-content/uploads/2019/06/How-Much-Exercise-Does-a-Shiba-Inu-Puppy-Need-large.jpg")
                              :
                          NetworkImage("https://lh3.googleusercontent.com/proxy/aH9fL0EKpzFLwDnUVDm9C_JYCzUwO-XYbNguJP8zvN2h2MHTg4D-6EyYlfgXJFIC15TFGS8C5LslVE-vKhXfr83Z_-tV")
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
                  (!currentUser.isVerifyRescueCenter && postModel.postType != PostType.RequestPost) ?"Bun cực kì hăng sức và thích chơi" :  "Trung tâm đang thực hiện kiểm tra y tế",
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
                          (!currentUser.isVerifyRescueCenter && postModel.postType != PostType.RequestPost)
                              ?
                          NetworkImage("https://resc-files-prod.s3.us-west-1.amazonaws.com/s3fs-public/styles/large/public/2018-12/dogs-benson_1.jpg?itok=GY5qtAXm")
                              :
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
                  (!currentUser.isVerifyRescueCenter && postModel.postType != PostType.RequestPost) ? "Chó Bun được cho ăn hằng ngày" : "Trung tâm đã tìm thấy chó ở góc đường" ,
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
