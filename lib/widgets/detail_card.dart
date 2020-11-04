import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petrescue/EditPost/colors.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/screens/timeline.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailCard extends StatelessWidget {
  final Post postModel;
  final bool isEditing;

  const DetailCard({Key key, @required this.postModel, this.isEditing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pictureContainersHeight = 272;

    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: PetRescueTheme.lightPink,
              indicatorColor: PetRescueTheme.lightPink,
              tabs: [
                Tab(icon: Icon(Icons.directions)),
                Tab(icon: Icon(Icons.settings_overscan)),
                Tab(icon: Icon(Icons.check)),
                Tab(icon: Icon(MaterialIcons.timeline)),

              ],
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
              onPressed: () => Navigator.pop(context, false),
            ),
            title: Text("Chi tiết", style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
          ),
          body:
          TabBarView(
            children: [
              buildMapTab(),
              SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                                            fit: BoxFit.cover)),
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

                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text("20 phút trước", style: TextStyle(color: Colors.black),),
                              ),


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
                                                  fontSize: 21,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 20,),
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
                                              Container(
                                                  child: Row(
                                                      children:
                                                      getAllStatuses(postModel)

                                                  )),

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
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    StoryDetail(postModel: postModel,),
                                    SizedBox(height: 10),


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
                                    if(postModel.postType != PostType.FinishedPost)
                                      Center(
                                        child: InkWell(
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
                                            child: InkWell(
                                              child: Container(
                                                height: 53,
                                                child: Center(
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
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              TimelineDetail(postModel: postModel,),
                              SizedBox(height: 20,),
                              Flexible(
                                child: Container(height: 30,),
                              )

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              buildConfirmationTab(),
              TimelineBottomCard(postModel: postModel,),
            ],
          )
        ),
      ),
    );
  }

  Widget buildConfirmationTab()
  {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(color: HexColor("#f5f1f0")),
        child: Column(
          children: [

            Stack(
              children: [
                Positioned(
                  child: Align(
                    child: Container(height: 400,
                      decoration: BoxDecoration(image: DecorationImage( image: AssetImage( "lib/assets/health_image.jpg"))),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  child: Align(
                    child: SizedBox(
                      width: 350,
                      child: Text("Chap nhan yeu cau cuu ho de bat dau quy trinh giai cuu",textAlign: TextAlign.center, style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 24,
                        color: Colors.black.withOpacity(0.6)
                      ),),
                    ),
                  ),
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: DetailCardButton(postModel: postModel, isTimeline: false,
              ),
            ),

          ],
        ),
      );
  }

  Widget buildMapTab()
  {
    GoogleMapController mapController;

    final LatLng _center = const LatLng(37.7338, -122.4419);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }
      return Container(
         child: GoogleMap(
           onMapCreated: _onMapCreated,
           initialCameraPosition: CameraPosition(
             target: _center,
             zoom: 4,
           ),

           mapType: MapType.normal,
           tiltGesturesEnabled: true,
           compassEnabled: true,
           rotateGesturesEnabled: true,
           myLocationEnabled: true,
         ) ,
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
  final Post postModel;
  const StoryDetail({
    Key key, this.postModel,
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

        SizedBox(height: 20),

        Text(
          "Tinh trang",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 7),
        Column(
          children: postModel.statuses.map((text) { return SizedBox(
            width: 352,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "- " + text,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ); } ).toList(),
        )
        // SizedBox(
        //   width: 352,
        //   child:  Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       "- Lorem ipsum dolor sit amet, consectetur adipiscing elit dwa wa dwa ",
        //       style: TextStyle(
        //         fontSize: 16,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class TimelineDetail extends StatelessWidget {
  final Post postModel;

  const TimelineDetail({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Flexible(child: Container(width: 300,))

            ],
          ),


          SizedBox(height: 8.50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Thứ tư, 5 Tháng 10",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    DetailCardButton(postModel: postModel, isTimeline: true,)
                  ],
                ),
                SizedBox(height: 8),
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
    );
  }
}
