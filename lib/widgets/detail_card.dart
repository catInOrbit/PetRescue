import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/widgets/common.dart';

class DetailCard extends StatelessWidget {
  final Post postModel;
  final bool isEditing;

  const DetailCard({Key key, @required this.postModel, this.isEditing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pictureContainersHeight = 272;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text("Chi tiết", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,

        ),
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                // width: 230,
                                height: pictureContainersHeight,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage("lib/assets/cat3.png"),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 147,
                                  height: 132,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                          AssetImage("lib/assets/cat4.png"),
                                          fit: BoxFit.fill)),
                                ),
                                Container(
                                  width: 147,
                                  height: 140,
                                  color: Colors.blueGrey,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 61,
                                        top: 64,
                                        child: SizedBox(
                                          width: 21,
                                          child: Text(
                                            "+3 ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.50,
                                        child: Container(
                                          width: 147,
                                          height: 140,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    UserInfoRibon(postModel: postModel, isDetailRibbon: true,),
                    showResponsibleUserRibon(postModel),
                  ],
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 390.30,
                          padding: const EdgeInsets.only(
                            right: 9,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(
                                      bottom: 4,
                                    ),
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          postModel.title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  IntrinsicHeight(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Động vật:",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontStyle:  FontStyle.normal,
                                              ),
                                            ),

                                            SizedBox(width: 20,),

                                            Text(
                                              postModel.petType,
                                              style: TextStyle(
                                                  color: Colors.black,

                                                  fontSize: 20,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(width: 20,),

                                            VerticalDivider(width: 1, thickness: 2, color: Colors.black,),

                                          ],

                                        ),

                                        SizedBox(height: 10,),

                                        if(postModel.postType == PostType.AdoptPost)
                                          Column(
                                            children: [
                                              Row(

                                                children: [

                                                  Text(
                                                    "Giống:",
                                                    style: TextStyle(
                                                      color: Colors.black,

                                                      fontSize: 20,
                                                      fontFamily: "Lato",
                                                      fontStyle:  FontStyle.normal,
                                                    ),
                                                  ),

                                                  SizedBox(width: 20,),

                                                  Text(
                                                    postModel.breed,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily: "Lato",
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),

                                                ],

                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [

                                                  Text(
                                                    "Giới tính:",
                                                    style: TextStyle(
                                                      color: Colors.black,

                                                      fontSize: 20,
                                                      fontFamily: "Lato",
                                                      fontStyle:  FontStyle.normal,
                                                    ),
                                                  ),

                                                  SizedBox(width: 20,),

                                                  if(postModel.gender == "Female")
                                                    Image.asset("lib/assets/female_gender_icon.jpeg", height: 25,)
                                                  else
                                                    Image.asset("lib/assets/male_gender_icon.png", height: 25,)
                                                ],

                                              ),
                                            ],
                                          )

                                      ],
                                    ),
                                  ),
                                  Text("20 phút trước", style: TextStyle(color: Colors.black),)
                                ],
                              ),
                              SizedBox(height: 10),
                              StoryDetail(),
                              SizedBox(height: 10),

                              Container(
                                  child: Row(
                                      children:
                                      getAllStatuses(postModel)

                                  )),
                              SizedBox(height: 22),

                              if(postModel.postType == PostType.AdoptPost && postModel.currentUser == currentUser)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Người dùng muốn nhận nuôi:", style: TextStyle(fontSize: 18), ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(postModel.currentUser == currentUser)
                                    buildUserTiles(postModel),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [


                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 22),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    if(postModel.postType != PostType.FinishedPost)
                                      InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ProfileTab(postModel: postModel, ),
                                        ));
                                      },
                                      child: Container(
                                        height: 53,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(26.50),
                                          color: Color(0xffebf3fa),
                                        ),
                                        padding: const EdgeInsets.only(
                                          left: 23,
                                          right: 31,
                                          top: 11,
                                          bottom: 13,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                child: Container(
                                                  height: 53,
                                                  child: Text(
                                                    "Liên hệ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 25.07),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    //TODO: Find way to expand children

                                    if(postModel.postType != PostType.InRescuePost && postModel.postType != PostType.FinishedPost)
                                      DetailCardButton(postModel: postModel,isTimeline: false,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(
                              //
                              // ))
                            },
                            child: TimelineDetail()
                        ),

                        SizedBox(height: 20,),
                        DetailCardButton(postModel: postModel, isTimeline: true,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserTiles(Post postModel)
  {
    final returnList = List<Widget>();
    switch(postModel.postType)
    {
      case PostType.RequestPost:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(postModel.acceptedRequestUser != null)
              UserInfoTile(user: postModel.acceptedRequestUser,)
            else
              NoRequestWarning()
          ],
        );
        break;

      case PostType.AdoptPost:
   
        postModel.adoptUserRequests.forEach((element) {returnList.add(UserInfoTile(user: element,));});
        return Column(
            children: returnList
        );

      case PostType.InRescuePost:
        postModel.adoptUserRequests.forEach((element) {returnList.add(UserInfoTile(user: element,));});
        return Column(
            children: returnList
        );
        break;
      default:
        return NoRequestWarning();
        break;
    }

    // return Column(
    //   children: postModel.adoptUserRequests.map((user) => UserInfoTile(user: user,)).toList()
    // );
  }
}

class StoryDetail extends StatelessWidget {
  const StoryDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mô tả",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 7),
        SizedBox(
          width: 352,
          child: Text(
            "Tìm thấy mèo con bị thất lạc gần đường XYZ, mèo bị thương ở chân và cần cấp cứu gắp, nhờ trung tâm gần nhất mau đến cứu",
            style: TextStyle(
              color: Color(0xff555555),
              fontSize: 16,
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Timeline",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),

            ],
          ),
          SizedBox(height: 8.50),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wednesday, 5th Oct ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 14,
                        child: Text(
                          "12:57 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tim.grover thông báo ở đường XYZ",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 9.33),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 15,
                        child: Text(
                          "12:57 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tim.grover thông báo ở đường XYZ",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 9.33),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 14,
                        child: Text(
                          "12:57 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tim.grover thông báo ở đường XYZ",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 9.33),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 14,
                        child: Text(
                          "12:57 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tim.grover thông báo ở đường XYZ",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
