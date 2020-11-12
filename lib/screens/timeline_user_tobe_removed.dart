import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/widgets/postFeed/post_empty.dart';
import 'package:petrescue/bloc/app_general/global.dart' as globals;

class TimelineUpdateUserPage extends StatefulWidget {
  final Post postModel;
  final bool hasNotBeenRescued;

  const TimelineUpdateUserPage({Key key, this.postModel, this.hasNotBeenRescued}) : super(key: key);
  @override
  _TimelineUpdatePageState createState() => _TimelineUpdatePageState();
}

class _TimelineUpdatePageState extends State<TimelineUpdateUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/tracking_page.png"))),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          CircleAvatar(backgroundImage:
                          NetworkImage(userList[1].imageURL)
                            ,
                            radius: 25,),
                          Text(
                            userList[1].fullName
                            ,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("lib/assets/Cat3.png"),
                          fit: BoxFit.cover
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 275,
                      top: 16,
                      bottom: 217,
                    ),
                    child: Text(
                      "Chó bun",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.50),
                  Text(
                    "Thông tin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 19.50),
                  Container(
                    width: 343,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: widget.postModel.postType == PostType.RequestPost && widget.hasNotBeenRescued ? Color(0xffff8068) : PetRescueTheme.darkGreen,
                    ),
                    padding: const EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16,
                      bottom: 14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                            children: [
                              Text(
                                "Cập nhật mới nhất vào",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]
                        ),
                        SizedBox(height: 11.17),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Opacity(
                                  opacity: 0.50,
                                  child: Container(
                                    width: 11.62,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.20,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6.58),
                                Text(
                                  "12:45PM 20/12/2020",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 11.17),

                        if(currentUser.isVerifyRescueCenter || widget.postModel.postType == PostType.RequestPost)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            ],
                          )
                      ],
                    ),
                  ),
                  SizedBox(height: 19.50),
                  PostEmptyUpdateRescued(postModel: widget.postModel,),
                  SizedBox(height: 19.50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
