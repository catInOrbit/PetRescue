import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/constants.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/utils/flappy_search_bar.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/widgets/detail_model_bottom.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'card_setting_dialog.dart';

class PostCard extends StatefulWidget {

  final Post postModel;
  final User user;

  const PostCard({Key key, @required this.postModel, @required this.user}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;

    if (widget.postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (widget.postModel.postType == PostType.RequestPost)
      colorScheme = PetRescueTheme.requestRescuePostTheme;
    else if (widget.postModel.postType == PostType.InRescuePost)
      colorScheme = PetRescueTheme.inRescuedPostTheme;


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
                      builder: (context) =>
                          DetailCard(
                            postModel: widget.postModel,
                            isEditing: false,
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
                              image: NetworkImage(
                                  widget.postModel.imageThumbnail), fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 181,
                              height: 44,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: 37,
                                      height: 37,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),

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
                                              child: Image.asset("lib/assets/setting_icon.png")
                                          ),
                                        ),
                                      )
                                  ),
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
                      color:
                      colorScheme[PetRescueThemeColorType.KeyWord.index],
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
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 12,
                    ),


                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Stack(
                          children: [
                            PostHeaderRibbon(postModel: widget.postModel,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UserInfoRibon(
                                  postModel: widget.postModel,
                                ),

                                showResponsibleUserRibon(widget.postModel)
                              ],
                            ),
                          ]
                        ),

                        Text(
                          widget.postModel.title,
                          style: TextStyle(
                            color: colorScheme[PetRescueThemeColorType
                                .Accent.index],
                            fontSize: 20,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w900,
                          ),
                        ),


                        //Contact button and action keyword
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProfileTab(postModel: listOfPosts[0],),
                                ));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: "Lato",
                                          fontWeight:
                                          FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      width: 22,
                                      height: 20,
                                      child: Icon(
                                          Icons.call
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 7),

                            if(widget.postModel.postType != PostType.InRescuePost)
                              Positioned(
                                left: 245,
                                top: 35,
                                child: ActionKeyword(
                                  postModel: widget.postModel,),
                              ),
                          ],
                        ),

                        Divider(
                          color: colorScheme[PetRescueThemeColorType.Accent
                              .index],
                          thickness: 1,
                        ),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, color: Colors.white,),
                            SizedBox(width: 20,),
                            Text("Distance from you: 2.7km", style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType.Accent.index],fontSize: 18
                            )),

                            SizedBox(width: 10,),

                            Text("View on map ", style: TextStyle(
                                color: Colors.cyanAccent,fontSize: 16,
                              decoration: TextDecoration.underline,

                            )),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                          child: Text("17/10, Nguyễn Phúc Chu, P. 15, Q. Tân Bình, Phường 15, Tân Bình, Thành phố Hồ Chí Minh, Vietnam",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Divider(
                          color: colorScheme[PetRescueThemeColorType.Accent
                              .index],
                          thickness: 1,
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 245,
                                child: Wrap(
                                  spacing: 1,
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  children: getAllStatuses(widget.postModel),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => TimelineBottomSheet(),
                                isScrollControlled: true);
                          },
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [widget.postModel.timelineBuilder]
                          ),
                        ),
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

  _showPopupMenu(context){
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Edit post'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Delete Post'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('Follow Post'), value: '3'),
      ],
      elevation: 8.0,
    )
        .then<void>((String itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCard(postModel: widget.postModel, isEditing: true,),));
      }else if(itemSelected == "2"){
        PostEvent postEvent = PostEvent();
        postEvent.hasSortRquest = false;
        postEvent.hasDeleteRequest = true;
        postEvent.selectedPost = widget.postModel;
        bloc.inputSink.add(postEvent);
        setState(() {
          listOfPosts.remove(widget.postModel);
        });
      }else{
        //code here
      }

    });
  }

  void choiceAction(String choice){
    if(choice == Constants.Settings){
      print('Settings');
    }else if(choice == Constants.Subscribe){
      print('Subscribe');
    }else if(choice == Constants.SignOut){
      print('SignOut');
    }
  }

  Widget showResponsibleUserRibon(Post postModel)
  {
    if(postModel.postType == PostType.AdoptPost)
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(backgroundImage: NetworkImage(postModel.acceptedRequestUser.imageURL),maxRadius: 25,),
      );
    else if((postModel.postType == PostType.RequestPost && postModel.acceptedRequestUser != null))
      return OngoingRescuerRibbon(postModel: postModel,);
    else
      return Container();
  }
}

