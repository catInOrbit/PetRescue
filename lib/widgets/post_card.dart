import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/EditPost/colors.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/Profile/UserProfile_Screen.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/constants.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/adopt_process_introduction.dart';
import 'package:petrescue/screens/list_adoption_request.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/utils/flappy_search_bar.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/widgets/detail_model_bottom.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petrescue/widgets/map.dart';
import 'card_setting_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostCard extends StatefulWidget {
  final Post postModel;
  final User user;

  const PostCard({Key key, @required this.postModel, @required this.user})
      : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with AutomaticKeepAliveClientMixin {
  GoogleMapController mapController;

  showConfirmationDialog(BuildContext context, Post post){
    Widget cancelButton = FlatButton(
      child: Text("Hủy"),
      onPressed:  () {
        Navigator.pop(context, false);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Đồng ý"),
      onPressed:  () {

        var postEvent = PostEvent();
        postEvent.adopted = true;
        postEvent.affectedPost = post;
        bloc.inputSink.add(postEvent);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AdoptProcessIntroduction(
                    postModel: post,
                  ),
            )
        ).then((result) {
          Navigator.of(context).pop();
        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Gửi yêu cầu nhận nuôi"),
      content: Text("Bạn có đồng ý gửi yêu cầu nhận nuôi không ? "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final LatLng _center = const LatLng(10.828056, 106.703324);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;

    if (widget.postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (widget.postModel.postType == PostType.RequestPost)
      widget.postModel.priority == Priority.Normal
          ? colorScheme = PetRescueTheme.rescuePostTheme
          : colorScheme = PetRescueTheme.rescuePostTheme;
    else if (widget.postModel.postType == PostType.InRescuePost)
      colorScheme = PetRescueTheme.inRescuePostTheme;



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //TODO: Fix constraint
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailCard(
                            postModel: widget.postModel,
                            isEditing: false,
                            defaultTabIndex: 1,
                          )));
            },
            child: Container(
              width: 380,
              child: Column(
                children: [
                  Container(),
                  Column(
                    children: [
                      Container(
                        width: 380,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(widget.postModel.imageThumbnail),
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
                                          _showPopupMenu(context);
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
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme[PetRescueThemeColorType.Accent.index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(children: [
                          PostHeaderRibbon(
                            postModel: widget.postModel,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: UserInfoRibon(
                                  isDetailRibbon: false,
                                  postModel: widget.postModel,
                                ),
                              ),
                            ],
                          ),
                        ]),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            widget.postModel.title,
                            style: TextStyle(
                              color: colorScheme[
                                  PetRescueThemeColorType.Text.index],
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        if(widget.postModel.postType != PostType.AdoptPost)
                          Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Phân loại",
                                  style: TextStyle(
                                      color: colorScheme[
                                          PetRescueThemeColorType.Text.index],
                                      fontSize: 20,
                                      fontFamily: "Lato",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Wrap(
                                  children: getAllCategory(widget.postModel),
                                )
                              ],
                            ),
                          ),
                        ) ,

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Động vật:",
                                      style: TextStyle(
                                          color: colorScheme[
                                              PetRescueThemeColorType
                                                  .Text.index],
                                          fontSize: 20,
                                          fontFamily: "Lato",
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      widget.postModel.petType,
                                      style: TextStyle(
                                          color: colorScheme[
                                              PetRescueThemeColorType
                                                  .Text.index],
                                          fontSize: 20,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    VerticalDivider(
                                      width: 1,
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if (widget.postModel.postType ==
                                    PostType.AdoptPost)
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Giống:",
                                            style: TextStyle(
                                                color: colorScheme[
                                                    PetRescueThemeColorType
                                                        .Text.index],
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            widget.postModel.breed,
                                            style: TextStyle(
                                                color: colorScheme[
                                                    PetRescueThemeColorType
                                                        .Text.index],
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Giới tính:",
                                            style: TextStyle(
                                                color: colorScheme[
                                                    PetRescueThemeColorType
                                                        .Text.index],
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          if (widget.postModel.gender ==
                                              "Female")
                                            Image.asset(
                                              "lib/assets/female_gender_icon.jpeg",
                                              height: 25,
                                            )
                                          else
                                            Image.asset(
                                              "lib/assets/male_gender_icon.png",
                                              height: 25,
                                            )
                                        ],
                                      ),
                                    ],
                                  ),

                                SizedBox(
                                  height: 10,
                                ),

                                //TODO:HERE
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tình trạng",
                                    style: TextStyle(
                                        color: colorScheme[
                                            PetRescueThemeColorType.Text.index],
                                        fontSize: 20,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.centerLeft,
                                //   child: Wrap(
                                //     direction: Axis.vertical,
                                //     children: widget.postModel.statuses
                                //         .map(
                                //           (text) => Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //             child: Text(
                                //               "-" + text,
                                //               overflow: TextOverflow.ellipsis,
                                //               style: TextStyle(
                                //                 fontSize: 16,
                                //               ),
                                //             ),
                                //           ),
                                //         )
                                //         .toList(),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),

                        Container(
                          width: 600,
                          decoration: BoxDecoration(
                              color: widget.postModel.postType ==
                                      PostType.RequestPost
                                  ? HexColor("#FFDFDF")
                                  : HexColor("#E0F0E8")),
                          child: SingleChildScrollView(
                            child: TimelineBuilder(
                              indicatorColor: widget.postModel.postType ==
                                      PostType.RequestPost
                                  ? PetRescueTheme.lightPink
                                  : PetRescueTheme.darkGreen,
                              lineColor: widget.postModel.postType ==
                                      PostType.RequestPost
                                  ? PetRescueTheme.lightPink
                                  : PetRescueTheme.darkGreen,
                              children: buildStatusCard(widget.postModel),
                              indicators: buildIndicator(widget.postModel),
                              indicatorSize: 10,
                            ),
                          ),
                        ),
                        if (widget.postModel.postType != PostType.AdoptPost)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Địa chỉ",
                              style: TextStyle(
                                  color: colorScheme[
                                      PetRescueThemeColorType.Text.index],
                                  fontSize: 20,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (widget.postModel.postType != PostType.AdoptPost)
                          Column(
                            children: [
                              Divider(
                                color: colorScheme[
                                    PetRescueThemeColorType.Icon.index],
                                thickness: 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: colorScheme[
                                          PetRescueThemeColorType.Icon.index],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Cách bạn 2.7km",
                                        style: TextStyle(
                                            color: colorScheme[
                                                PetRescueThemeColorType
                                                    .Text.index],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MapPage(),
                                            ));
                                      },
                                      child: Text("Xem bản đồ",
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 10, top: 10),
                                child: Text(
                                  widget.postModel.location,
                                  style: TextStyle(
                                      color: colorScheme[
                                          PetRescueThemeColorType.Text.index],
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Divider(
                                color: colorScheme[
                                    PetRescueThemeColorType.Icon.index],
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        if (widget.postModel.postType != PostType.AdoptPost)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 400,
                              child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: _center,
                                  zoom: 16,
                                ),
                                scrollGesturesEnabled: false,
                                zoomControlsEnabled: true,
                                zoomGesturesEnabled: true,
                                mapType: MapType.normal,
                                tiltGesturesEnabled: true,
                                compassEnabled: true,
                                rotateGesturesEnabled: true,
                                myLocationEnabled: true,
                              ),
                            ),
                          ),

                        //Contact button and action keyword
                        if (widget.postModel.postType != PostType.AdoptPost && currentUser.isVerifyRescueCenter)
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfileTab(
                                        postModel: listOfPosts[1],
                                        isViewMode: true,
                                        defaultIndex: 1,
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xffebf3fa),
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 14,
                                      top: 9,
                                      bottom: 4,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            "Liên hệ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Container(
                                          width: 22,
                                          height: 20,
                                          child: Icon(Icons.call),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 0),
                                buildActionKeyword(widget.postModel)
                              ],
                            ),
                          ),

                        if (widget.postModel.postType == PostType.AdoptPost &&
                            currentUser.isVerifyRescueCenter == true)
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Yêu cầu nhận nuôi:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: colorScheme[
                                          PetRescueThemeColorType.Text.index]),
                                ),
                                CustomAvatars(
                                  postModel: widget.postModel,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ListAdoptionRequest(
                                            postModel: widget.postModel,
                                          ),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: colorScheme[
                                                    PetRescueThemeColorType
                                                        .Text.index]),
                                          ),
                                          Text(
                                            "Người yêu cầu",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (widget.postModel.postType == PostType.AdoptPost &&
                            currentUser.isVerifyRescueCenter == false)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     // Navigator.push(
                                //     //     context,
                                //     //     MaterialPageRoute(
                                //     //       builder: (context) =>
                                //     //           UserProfileScreen(
                                //     //         postModel: listOfPosts[0],
                                //     //       ),
                                //     //     ));
                                //   },
                                //   child: Container(
                                //     height: 35,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(20),
                                //       color: Color(0xffebf3fa),
                                //     ),
                                //     padding: const EdgeInsets.only(
                                //       left: 8,
                                //       right: 14,
                                //       top: 9,
                                //       bottom: 4,
                                //     ),
                                //     child: SizedBox(
                                //       width: 60,
                                //       child: Center(
                                //         child: Text(
                                //           "Chi tiết",
                                //           style: TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 18,
                                //             fontFamily: "Lato",
                                //             fontWeight: FontWeight.w700,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(width: 5,),
                                InkWell(
                                  onTap: () {
                                    showConfirmationDialog(context, widget.postModel);

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           AdoptProcessIntroduction(
                                    //         postModel: widget.postModel,
                                    //       ),
                                    //     ));
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: PetRescueTheme.darkGreen,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 14,
                                      top: 9,
                                      bottom: 4,
                                    ),
                                    child: SizedBox(
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          "Gửi yêu cầu",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         child: Wrap(
                        //           spacing: 2,
                        //           direction: Axis.horizontal,
                        //           alignment: WrapAlignment.start,
                        //           children: getAllStatuses(widget.postModel),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     showModalBottomSheet(
                        //         context: context,
                        //         builder: (context) => TimelineBottomSheet(
                        //               postModel: widget.postModel,
                        //             ),
                        //         isScrollControlled: true);
                        //   },
                        //   child: Column(
                        //       mainAxisSize: MainAxisSize.max,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [widget.postModel.timelineBuilder]),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActionKeyword(Post postModel) {
    if (postModel.postType == PostType.RequestPost &&
        !postModel.acceptedRequest &&
        currentUser.isVerifyRescueCenter)
      return ActionKeyword(
        postModel: postModel,
        isAdoptPost: false,
      );
    else if (postModel.postType == PostType.AdoptPost &&
        !postModel.acceptedRequest)
      return ActionKeyword(
        postModel: postModel,
        isAdoptPost: true,
      );
    else if (postModel.postType == PostType.RequestPost &&
        !postModel.acceptedRequest &&
        !currentUser.isVerifyRescueCenter) return Container();
  }

  List<Widget> buildIndicator(Post post) {
    List<Widget> returnList = [];
    post.statuses.forEach((e) => returnList.add(Icon(
          Icons.arrow_drop_down_circle,
          color: PetRescueTheme.lightPink,
        )));
  }

  List<Widget> buildStatusCard(Post post) {
    List<Widget> returnList = [];
    post.statuses.forEach((e) {
      returnList.add(Row(
        children: [
          Flexible(
            child: Container(
                // decoration: BoxDecoration(color: widget.postModel.postType== PostType.RequestPost ? PetRescueTheme.lightPink : PetRescueTheme.darkGreen, borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text(e, style: TextStyle(color: Colors.black, fontSize: 17)),
            )),
          ),
        ],
      ));
    });

    return returnList;
  }

  _showPopupMenu(context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
         PopupMenuItem<String>(
                child: const Text('Điều chỉnh post'), value: '1'),
        PopupMenuItem<String>(child: const Text('Ẩn Post'), value: '2'),
        PopupMenuItem<String>(child: const Text('Theo dõi post'), value: '3'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditPost(),
        ));
      } else if (itemSelected == "2") {
        PostEvent postEvent = PostEvent();
        postEvent.hasSortRquest = false;
        postEvent.hasDeleteRequest = true;
        postEvent.selectedPost = widget.postModel;
        bloc.inputSink.add(postEvent);
        setState(() {
          listOfPosts.remove(widget.postModel);
        });
      } else {
        //code here
      }
    });
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


