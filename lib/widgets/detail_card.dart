import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
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
          title: Text("Detail", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,

        ),
        body: SingleChildScrollView(
          child: Container(
            height:
            MediaQuery.of(context).size.height + pictureContainersHeight,
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
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
                  Container(
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
                                    height: 35,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(
                                      right: 40,
                                      bottom: 4,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 166,
                                          height: 29,
                                          child: Text(
                                            "Stranded Kitten",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 32),
                                        Container(
                                          width: 5,
                                          height: 4.80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        SizedBox(
                                          width: 31,
                                          child: Text(
                                            "Male",
                                            style: TextStyle(
                                              color: Color(0xff5e5d5d),
                                              fontSize: 14,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Container(
                                          width: 5,
                                          height: 4.80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Expanded(
                                          child: SizedBox(
                                            width: 120,
                                            height: 50,
                                            child: Text(
                                              "6-8 Months",
                                              style: TextStyle(
                                                color: Color(0xff5e5d5d),
                                                fontSize: 14,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 57,
                                    height: 15,
                                    child: Text(
                                      "House cat",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                  child: Row(
                                    children:
                                      getAllStatuses(postModel)

                                  )),
                              SizedBox(height: 22),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    Container(
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
                                                  "Contact",
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
                                    SizedBox(width: 3),
                                    //TODO: Find way to expand children

                                    if(postModel.postType != PostType.InRescuePost)
                                    DetailCardButton(postModel: postModel,isTimeline: false,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        StoryDetail(),
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
                          DetailCardButton(postModel: postModel, isTimeline: true,)
                      ],
                    ),
                  )
                ],
              ),
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
                UserInfoTile(user: postModel.currentUser,),
                if(postModel.acceptedRequestUser != null)
                  UserInfoTile(user: postModel.acceptedRequestUser,)
                else
                    NoRequestWarning()
              ],
          );
          break;

        case PostType.AdoptPost:
          returnList.add(UserInfoTile(user: postModel.currentUser,));
          returnList.add(SizedBox(height: 10,));
          postModel.adoptUserRequests.forEach((element) {returnList.add(UserInfoTile(user: element,));});
          return Column(
              children: returnList
          );

        case PostType.InRescuePost:
          returnList.add(UserInfoTile(user: postModel.currentUser,));
          returnList.add(SizedBox(height: 10,));
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
          "Story",
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
            "Kitten was found stranded in a drain. I found it severly injured and it’s leg stuck in a hole. ",
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
          Text(
            "Timeline",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
            ),
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
                  fontSize: 11,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "tim.grover reported at Church st.",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 59),
                          Text(
                            "10min ago",
                            style: TextStyle(
                              color: Color(0xffc4c4c4),
                              fontSize: 10,
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
                          "1:05 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 11),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "XYZ Rescue Centre responded",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 70),
                          Text(
                            "10min ago",
                            style: TextStyle(
                              color: Color(0xffc4c4c4),
                              fontSize: 10,
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
                          "1:25 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 9),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "XYZ Rescue Centre  arrived at the scene",
                            style: TextStyle(
                              color: Color(0xff5e5d5d),
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 23),
                          Text(
                            "10min ago",
                            style: TextStyle(
                              color: Color(0xffc4c4c4),
                              fontSize: 10,
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
                          "1:35 p.m",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 9),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 232,
                            child: Text(
                              "Stranded Kitten rescued and is housed at XYZRescue Home",
                              style: TextStyle(
                                color: Color(0xff5e5d5d),
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            "10min ago",
                            style: TextStyle(
                              color: Color(0xffc4c4c4),
                              fontSize: 10,
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
