import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/screens/TrackingPageImrpoved.dart';
import 'package:petrescue/screens/timeline.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/widgets/process_page.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'detail_model_bottom.dart';

class StatusTag extends StatelessWidget {
  final textData;
  final Post postModel;
  const StatusTag({Key key, @required this.textData, @required this.postModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    String textData;
    switch(postModel.postType)
    {
      case PostType.InRescuePost:
        colorScheme = PetRescueTheme.statusTagsInRescuePostTheme;
        textData = "Tai nạn";
        break;
      case PostType.RequestPost:
        colorScheme = PetRescueTheme.revertRescuePostTheme;
        textData = "Tai nạn";
        break;
      case PostType.AdoptPost:
        colorScheme = PetRescueTheme.revertAdoptPostTheme;
        textData = "Mèo";
        break;

      default:
        colorScheme = PetRescueTheme.statusTagsRescueTheme;
        break;

    }

    return Chip(
      backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
      label: Text(textData, style: TextStyle(fontSize: 16),),
      labelStyle: TextStyle(color: colorScheme[PetRescueThemeColorType.KeyWord.index], fontSize: 13),
    );
  }
}

class CategoryTag extends StatelessWidget {
  final textData;
  final Post postModel;
  const CategoryTag({Key key, @required this.textData, @required this.postModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    switch(postModel.postType)
    {
      case PostType.InRescuePost:
        colorScheme = PetRescueTheme.statusTagsRescueTheme;
        break;
      case PostType.RequestPost:
        colorScheme = PetRescueTheme.statusTagsRescueTheme;
        break;
      case PostType.AdoptPost:
        colorScheme = PetRescueTheme.statusTagsAdoptPostTheme;
        break;

      default:
        colorScheme = PetRescueTheme.statusTagsRescueTheme;
        break;

    }

    return Chip(
      backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
      label: Text(textData, style: TextStyle(fontSize: 16),),
      labelStyle: TextStyle(color: colorScheme[PetRescueThemeColorType.KeyWord.index], fontSize: 13),
    );
  }
}

List<Widget> getAllStatuses(Post postModel) {
  return List<Widget>.generate(postModel.category.length, (index) {
    return CategoryTag(
      postModel: postModel,
      // textData: postModel.statuses[index].toString().split('.').last,
      textData: postModel.category[index],
    );
  });
}

class UserInfoRibon extends StatelessWidget {
  final Post postModel;
  final bool isDetailRibbon;
  const UserInfoRibon({Key key, @required this.postModel, this.isDetailRibbon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    if(!isDetailRibbon)
      {
        if (postModel.postType == PostType.AdoptPost)
           colorScheme = PetRescueTheme.userRibbonRescuePostTheme;
        else
          colorScheme = PetRescueTheme.userRibbonRescuePostTheme;
      }

    else
      {

        if (postModel.postType == PostType.AdoptPost)
          colorScheme = PetRescueTheme.userRibbonDetailAdoptPostTheme;
        else
          colorScheme = PetRescueTheme.userRibbonDetailRescuePostTheme;

      }

    return Container(
      // margin: const EdgeInsets.only(left: 16.9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(27.50),
            bottomRight: Radius.circular(27.50)),
        color: colorScheme[PetRescueThemeColorType.Accent.index],
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(postModel.currentUser.imageURL),
          ),
          SizedBox(width: 12),
          SizedBox(
            width: 81,
            height: 24,
            child: Text(
              postModel.currentUser.fullNanme,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme[PetRescueThemeColorType.KeyWord.index],
                fontSize: 16,
                fontFamily: "Lato",
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(width: 12),
          Opacity(
            opacity: 0.50,
            child: Container(
              width: 16.11,
              height: 16,
              color: colorScheme[PetRescueThemeColorType.Accent.index],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionKeyword extends StatelessWidget {
  final Post postModel;
  final bool isHomepagePost;
  const ActionKeyword({Key key, @required this.postModel, this.isHomepagePost}) : super(key: key);

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("Có"),
      onPressed: () {
        postModel.acceptedRequestUser = currentUser;

        PostEvent postEvent = PostEvent();
        postEvent.affectedPost =  postModel;
        postEvent.acceptedRequest = true;

        bloc.inputSink.add(postEvent);
      // SnackBar snackBar = acceptRequest(context);
      //
      // Scaffold.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrackingPageImproved(postModel: postModel,)));

      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Không"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Chấp nhận giải cứu ?"),
      content: Text("Bạn có muốn thực hiện quá trình giải cứu"),
      actions: [
        cancelButton,
        okButton,
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

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    String text;
    Widget icon;

    if(!isHomepagePost)
      switch(postModel.postType)
      {
        case PostType.AdoptPost:
          text = "Tiếp nhận";
          colorScheme = PetRescueTheme.actionWordAdoptPostTheme;
          icon = Icon(Icons.home, color: Colors.white,);
          break;
        case PostType.RequestPost:
          text = "Tiếp nhận";
          postModel.priority == Priority.High ? colorScheme = PetRescueTheme.actionWordRescuePostHighPriorityTheme : colorScheme = PetRescueTheme.actionWordRescuePostTheme;
          icon = Icon(Icons.local_hospital, color: Colors.white,);

          break;
        case PostType.InRescuePost:
          text = "Đang giải cứu";
          colorScheme = PetRescueTheme.actionWordInRescuePostTheme;
          icon = Container();
          break;
      }

    else
      {
        text = "Xem diễn biến";
        colorScheme = PetRescueTheme.actionWordViewOnlyPostTheme;
        icon = Container();
      }

    return Container(
      height: 50,
      //TODO: Inkwell won't show ripple effeect
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 130,
            child: InkWell(
              onTap: ()
               {
                 if(!isHomepagePost)
                   {
                     showAlertDialog(context);

                   }

                 else
                   Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage(),));


               },
              child: Container(
                height: 45,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: colorScheme[PetRescueThemeColorType.Accent.index]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: colorScheme[PetRescueThemeColorType.KeyWord.index],
                        fontSize: 20,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    icon
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 2),
        ],
      ),
    );
  }

  SnackBar acceptRequest(BuildContext context) {
      PostEvent postEvent = PostEvent();
    postEvent.affectedPost =  postModel;
    postEvent.acceptedRequest = true;
    
    bloc.inputSink.add(postEvent);
    
    final snackBar = SnackBar(
      content: Text('Yêu cầu của bạn đã được chấp nhận'),
      action: SnackBarAction(
        label: 'Theo dõi',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage(),));
          // Some code to undo the change.
        },
      ),
    );
    return snackBar;
  }
}
class ActionKeywordAccepted extends StatelessWidget {

  const ActionKeywordAccepted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme = [PetRescueTheme.darkGreen, Colors.white];
    String text = "Theo dõi";

    return Container(
      height: 50,
      //TODO: Inkwell won't show ripple effeect
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            child: InkWell(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TrackingPage(),
                ));
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: colorScheme[PetRescueThemeColorType.Accent.index]
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: colorScheme[PetRescueThemeColorType.KeyWord.index],
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 2),
          Container(
            width: 21,
            height: 18,
          ),
        ],
      ),
    );
  }
}


class UserInfo extends StatelessWidget {
  final Post postModel;

  const UserInfo({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //visualDensity: VisualDensity.compact,
      //contentPadding: EdgeInsets.only(top: 10),
      leading: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black.withAlpha(40),
                spreadRadius: 1)
          ]),
          child: CircleAvatar(
            backgroundImage: NetworkImage(postModel.imageThumbnail),
            radius: 20,
          )),
      title: Text(
        "user.name",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: [
          Text("location",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15)),
          SizedBox(
            width: 5,
          ),
          Text("mi. away",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 13)),
        ],
      ),
    );
  }
}

class DetailCardButton extends StatelessWidget {
  final Post postModel;
  final bool isTimeline;

  const DetailCardButton({Key key, this.postModel, this.isTimeline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {

      // set up the button
      Widget okButton = FlatButton(
        child: Text("Có"),
        onPressed: () {

          SnackBar snackBar = acceptRequest(context);

          Scaffold.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TrackingPage();
          }));


        },
      );

      Widget cancelButton = FlatButton(
        child: Text("Không"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Chấp nhận giải cứu ?"),
        content: Text("Bạn có muốn thực hiện quá trình giải cứu"),
        actions: [
          cancelButton,
          okButton,
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

    String text;
    List<Color> colorScheme;

    if (isTimeline) {
      text = "Xem timeline";
      colorScheme = [PetRescueTheme.orange, Colors.white];
    } else if (postModel.postType == PostType.AdoptPost) {
      text = "Nhận nuôi";
      colorScheme = [PetRescueTheme.darkGreen, Colors.white];
    } else if (postModel.postType == PostType.RequestPost) {
      text = "Giải cứu";
      colorScheme = PetRescueTheme.revertRescuePostTheme;
    }
    else if (postModel.postType == PostType.InRescuePost) {
      text = "Hủy yêu cầu";
      colorScheme = [Colors.grey, Colors.white];
    }

    return InkWell(
      onTap: () {

        if (!isTimeline && postModel.postType != PostType.InRescuePost)
          {
              showAlertDialog(context);
              postModel.acceptedRequestUser = currentUser;

              PostEvent postEvent = PostEvent();
              postEvent.affectedPost =  postModel;
              postEvent.acceptedRequest = true;

              bloc.inputSink.add(postEvent);
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPageImproved(postModel: postModel,),));
          }
        //
        // else if(postModel.postType == PostType.InRescuePost)
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage()));
        //
        // else
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => TimelineBottomCard(postModel: postModel,),));


      },
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.50),
          color: colorScheme[PetRescueThemeColorType.Accent.index],

        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  SnackBar acceptRequest(BuildContext context) {
     postModel.acceptedRequestUser = currentUser;
    
    PostEvent postEvent = PostEvent();
    postEvent.affectedPost =  postModel;
    postEvent.acceptedRequest = true;
    
    bloc.inputSink.add(postEvent);
    
    final snackBar = SnackBar(
      content: Text('Yêu cầu của bạn đã được chấp nhận'),
      action: SnackBarAction(
        label: 'Theo dõi',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage(),));
          // Some code to undo the change.
        },
      ),
    );
    return snackBar;
  }
}

class CommonTool {
  Color ColorStatePicker(PostType postType) {
    // switch(postType)
    // {
    //   case PostType.RequestPost:
    //     return PetRescueTheme.
    // }
  }
}

class NoRequestWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffff8068),
                ),
              ),
              Positioned(
                left: 15,
                top: 4,
                child: Text(
                  "!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 13),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hãy là người giải cứu đầu tiên!",
                style: TextStyle(
                  color: Color(0xffffb9ac),
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  final User user;

  const UserInfoTile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(user.imageURL))),
        ),
        SizedBox(width: 5),
        Column(
          children: [
            SizedBox(
              height: 24,
              width: 100,
              child: Text(
                user.fullNanme,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 24,
              width: 100,
              child: Text(
                user.job,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProfileTab(postModel: listOfPosts[2], ),
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
        )
      ],
    );
  }
}

class PriorityRibbon extends StatelessWidget {
  final Post postModel;

  const PriorityRibbon({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    Color textColor;
    postModel.priority == Priority.Normal ? text = "Thấp" : text = "Cao" ;
    postModel.priority == Priority.Normal ? textColor = Colors.black : textColor = Colors.white ;
    postModel.priority == Priority.Normal ? backgroundColor = Colors.white : backgroundColor = HexColor("#ffb196");
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Chip(
        label: Text("Ưu tiên: " + text, style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),) ,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(8),
      ),
    );

  }
}


class OngoingRescuerRibbon extends StatelessWidget {
  final Post postModel;

  const OngoingRescuerRibbon({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: PetRescueTheme.lime,
        ),
        padding: const EdgeInsets.only(
          left: 7,
          right: 28,
          top: 6,
          bottom: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:
                          DecorationImage(image: NetworkImage(postModel.acceptedRequestUser.imageURL,)),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 60,
              child: Text(
                "Đang giải cứu!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePagePost extends StatefulWidget {

  HomePagePost({Key key}) : super(key: key);

  @override
  _HomePagePostState createState() => _HomePagePostState();
}


class PostHeaderRibbon extends StatelessWidget {
  final Post postModel;

  const PostHeaderRibbon({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    Color ribbonColor;
    switch(postModel.postType)
    {
      case PostType.RequestPost:
        ribbonColor = PetRescueTheme.lightPink;
        break;
      case PostType.AdoptPost:
        ribbonColor = PetRescueTheme.darkGreen;
        break;
      case PostType.InRescuePost:
        ribbonColor = PetRescueTheme.lime;
        break;
      case PostType.FinishedPost:
        ribbonColor = Colors.grey;
        break;
    }

    return Container(
      width: 500,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: ribbonColor
      ),
    );
  }
}




class _HomePagePostState extends State<HomePagePost> {
  List<Color> colorScheme;

  List<Widget> postList = [];

  Widget statusTitle(Post postModel)
  {
    List<Color> colorScheme;
    String label = "";

    switch(postModel.postType)
    {
      case PostType.InRescuePost:
        colorScheme = PetRescueTheme.homePageInRescue;
        label = "Đang cứu hộ";
        break;
      case PostType.AdoptPost:
        colorScheme = PetRescueTheme.homePageAdoptPost;
        label = "Đăng nhận nuôi";
        break;
      case PostType.RequestPost:
        colorScheme = PetRescueTheme.homePageRescuePost;
        label = "Yêu cầu cứu hộ";
        break;
      case PostType.FinishedPost:
        colorScheme = PetRescueTheme.rescuedPost;
        label = "Đã an toàn";
        break;
    }

    return Row(
      children: [
        Chip(
          label: Text(label),
          backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
          labelStyle: TextStyle(color: colorScheme[PetRescueThemeColorType.KeyWord.index], fontSize: 18),
        ),

        if(postModel.postType == PostType.FinishedPost)
          Icon(Icons.verified_user, size: 30, color: Colors.green,)
      ],
    );
  }

  // Widget createTimelinePost(BuildContext context, Post postModel) {
  //
  //   if (postModel.postType == PostType.AdoptPost)
  //     colorScheme = PetRescueTheme.adoptPostTheme;
  //   else if (postModel.postType == PostType.RequestPost)
  //     postModel.priority == Priority.Normal
  //         ? colorScheme = PetRescueTheme.rescuePostTheme : colorScheme = PetRescueTheme.rescuePostPrioritizedTheme ;
  //   else if (postModel.postType == PostType.InRescuePost)
  //     colorScheme = PetRescueTheme.inRescuePostTheme;
  //   else if (postModel.postType == PostType.FinishedPost)
  //     colorScheme = PetRescueTheme.finishedPostTheme;
  //   return Padding(
  //
  //
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       child: Center(
  //         child: InkWell(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) =>
  //                         DetailCard(
  //                           postModel: postModel,
  //                           isEditing: false,
  //                         )));
  //           },
  //           child: Container(
  //
  //             width: 380,
  //             child: Column(
  //               children: [
  //                 Container(),
  //                 Column(
  //                   children: [
  //                     Container(
  //                       width: 380,
  //                       decoration: BoxDecoration(
  //                         image: DecorationImage(
  //                             image: NetworkImage(
  //                                 postModel.imageThumbnail), fit: BoxFit.cover),
  //                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //                         gradient: LinearGradient(
  //                           begin: Alignment.topCenter,
  //                           end: Alignment.bottomCenter,
  //                           colors: [Color(0x00ffffff), Colors.black],
  //                         ),
  //                       ),
  //                       padding: const EdgeInsets.only(
  //                         top: 11,
  //                         bottom: 42,
  //                       ),
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.max,
  //                         crossAxisAlignment: CrossAxisAlignment.end,
  //                         children: [
  //                           Container(
  //                             width: 700,
  //                             height: 44,
  //                             child: Stack(
  //                               children: [
  //
  //                                 Positioned(
  //                                     left: 20,
  //
  //                                     child: Text("20 phút trước", style: TextStyle(color: Colors.white),)
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(height: 92),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     color:
  //                     colorScheme[PetRescueThemeColorType.Accent.index],
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(10),
  //                         topRight: Radius.circular(10),
  //                         bottomLeft: Radius.circular(10),
  //                         bottomRight: Radius.circular(10)),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.grey.withOpacity(0.5),
  //                         spreadRadius: 5,
  //                         blurRadius: 7,
  //                         offset: Offset(0, 3), // changes position of shadow
  //                       ),
  //                     ],
  //                   ),
  //
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Stack(
  //                           children: [
  //
  //                             PostHeaderRibbon(postModel: postModel,),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 5),
  //                                   child: UserInfoRibon(
  //                                     isDetailRibbon: false,
  //                                     postModel: postModel,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ]
  //                       ),
  //
  //                       Padding(
  //                         padding: const EdgeInsets.all(12),
  //                         child: Text(
  //                           postModel.title,
  //                           style: TextStyle(
  //                             color: colorScheme[PetRescueThemeColorType
  //                                 .Text.index],
  //                             fontSize: 20,
  //                             fontFamily: "Lato",
  //                             fontWeight: FontWeight.w900,
  //                           ),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(12),
  //                         child: Text(
  //                           "Thời gian nhận: " + postModel.timeCreated.toString(),
  //                           style: TextStyle(
  //                             color: colorScheme[PetRescueThemeColorType
  //                                 .Text.index],
  //                             fontSize: 15,
  //                             fontFamily: "Lato",
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ),
  //
  //                       if(postModel.postType == PostType.FinishedPost)
  //                         Padding(
  //                           padding: const EdgeInsets.all(12),
  //                           child: Text(
  //                             "Thời gian xử lí thành công: 6/10/2020",
  //                             style: TextStyle(
  //                               color: colorScheme[PetRescueThemeColorType
  //                                   .Text.index],
  //                               fontSize: 15,
  //                               fontFamily: "Lato",
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ),
  //
  //                       SizedBox(height: 10,),
  //
  //                       if(postModel.postType == PostType.AdoptPost )
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 20, top: 10),
  //                           child: Row(
  //                             children: [
  //                               Text("Yêu cầu nhận nuôi:", style: TextStyle(
  //                                   fontWeight: FontWeight.w800,
  //                                   color: colorScheme[PetRescueThemeColorType.Text.index]
  //
  //                               ),),
  //                               CustomAvatars(postModel: postModel,),
  //                             ],
  //                           ),
  //                         ),
  //                       //Contact button and action keyword
  //                       Padding(
  //                         padding: const EdgeInsets.all(12),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             // InkWell(
  //                             //   onTap: (){
  //                             //     Navigator.push(context, MaterialPageRoute(
  //                             //       builder: (context) => ProfileTab(postModel: listOfPosts[0],),
  //                             //     ));
  //                             //   },
  //                             //   // child: Container(
  //                             //   //   height: 45,
  //                             //   //   decoration: BoxDecoration(
  //                             //   //     borderRadius:
  //                             //   //     BorderRadius.circular(20),
  //                             //   //     color: Color(0xffebf3fa),
  //                             //   //   ),
  //                             //   //   padding: const EdgeInsets.only(
  //                             //   //     left: 8,
  //                             //   //     right: 14,
  //                             //   //     top: 9,
  //                             //   //     bottom: 4,
  //                             //   //   ),
  //                             //   //   child: Row(
  //                             //   //     mainAxisSize: MainAxisSize.min,
  //                             //   //     crossAxisAlignment: CrossAxisAlignment.center,
  //                             //   //     children: [
  //                             //   //       SizedBox(
  //                             //   //         width: 70,
  //                             //   //         child: Text(
  //                             //   //           "Liên hệ",
  //                             //   //           style: TextStyle(
  //                             //   //             color: Colors.black,
  //                             //   //             fontSize: 18,
  //                             //   //             fontFamily: "Lato",
  //                             //   //             fontWeight:
  //                             //   //             FontWeight.w700,
  //                             //   //           ),
  //                             //   //         ),
  //                             //   //       ),
  //                             //   //       SizedBox(width: 4),
  //                             //   //       Container(
  //                             //   //         width: 22,
  //                             //   //         height: 20,
  //                             //   //         child: Icon(
  //                             //   //             Icons.call
  //                             //   //         ),
  //                             //   //       ),
  //                             //   //     ],
  //                             //   //   ),
  //                             //   // ),
  //                             // ),
  //                               ActionKeyword(
  //                                 postModel: postModel,
  //                               isHomepagePost: true,),
  //                           ],
  //                         ),
  //                       ),
  //
  //
  //                       // Padding(
  //                       //   padding: const EdgeInsets.only(left: 8.0, bottom: 30),
  //                       //   child: Wrap(
  //                       //     children: [
  //                       //       Container(
  //                       //         child: Wrap(
  //                       //           spacing: 10,
  //                       //           direction: Axis.horizontal,
  //                       //           alignment: WrapAlignment.start,
  //                       //           children: getAllStatuses(postModel),
  //                       //         ),
  //                       //       ),
  //                       //     ],
  //                       //   ),
  //                       // ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //
  // }


  Widget createTimelinePost(BuildContext context, Post postModel) {

    _showPopupMenu(context) {
      showMenu<String>(
        context: context,
        position: RelativeRect.fromLTRB(25.0, 25.0, 0.0,
            0.0), //position where you want to show the menu on screen
        items: [
          PopupMenuItem<String>(child: const Text('Điều chỉnh post'), value: '1'),
          PopupMenuItem<String>(child: const Text('Ẩn Post'), value: '2'),
          PopupMenuItem<String>(child: const Text('Follow Post'), value: '3'),
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
          postEvent.selectedPost = postModel;
          bloc.inputSink.add(postEvent);
          setState(() {
            listOfPosts.remove(postModel);
          });
        } else {
          //code here
        }
      });
    }


    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (postModel.postType == PostType.RequestPost)
      postModel.priority == Priority.Normal
          ? colorScheme = PetRescueTheme.rescuePostTheme : colorScheme = PetRescueTheme.rescuePostPrioritizedTheme ;
    else if (postModel.postType == PostType.InRescuePost)
      colorScheme = PetRescueTheme.inRescuePostTheme;
    else if (postModel.postType == PostType.FinishedPost)
      colorScheme = PetRescueTheme.finishedPostTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailCard(
                            postModel: postModel,
                            isEditing: false,
                            defaultTabIndex: 1,
                          )));
            },
            child: Container(
              width: 380,
              child: Column(
                children: [
                  Container(),
                  // Column(
                  //   children: [
                  //     // Container(
                  //     //   width: 380,
                  //     //   decoration: BoxDecoration(
                  //     //     image: DecorationImage(
                  //     //         image: NetworkImage(
                  //     //             postModel.imageThumbnail), fit: BoxFit.cover),
                  //     //     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  //     //     gradient: LinearGradient(
                  //     //       begin: Alignment.topCenter,
                  //     //       end: Alignment.bottomCenter,
                  //     //       colors: [Color(0x00ffffff), Colors.black],
                  //     //     ),
                  //     //   ),
                  //     //   padding: const EdgeInsets.only(
                  //     //     top: 11,
                  //     //     bottom: 42,
                  //     //   ),
                  //     //   child: Column(
                  //     //     mainAxisSize: MainAxisSize.max,
                  //     //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     //     children: [
                  //     //       Container(
                  //     //         width: 700,
                  //     //         height: 44,
                  //     //         child: Stack(
                  //     //           children: [
                  //     //
                  //     //             Positioned(
                  //     //                 left: 20,
                  //     //
                  //     //                 child: Text("20 phút trước", style: TextStyle(color: Colors.white),)
                  //     //             ),
                  //     //           ],
                  //     //         ),
                  //     //       ),
                  //     //       SizedBox(height: 92),
                  //     //     ],
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color:
                      colorScheme[PetRescueThemeColorType.Accent.index],
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
                        Stack(
                            children: [

                              PostHeaderRibbon(postModel: postModel,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: UserInfoRibon(
                                      isDetailRibbon: false,
                                      postModel: postModel,
                                    ),
                                  ),
                                      InkWell(
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
                                      )
                                ],
                              ),
                            ]
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: statusTitle(postModel),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            postModel.title,
                            style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType
                                  .Text.index],
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "Thời gian nhận: " + "5/11/2020 12:45PM",
                            style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType
                                  .Text.index],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        if(postModel.postType == PostType.FinishedPost)
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Thời gian xử lí thành công: 6/10/2020",
                              style: TextStyle(
                                color: colorScheme[PetRescueThemeColorType
                                    .Text.index],
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                        SizedBox(height: 10,),

                        if(postModel.postType == PostType.AdoptPost )
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Text("Yêu cầu nhận nuôi:", style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme[PetRescueThemeColorType.Text.index]

                                ),),
                                CustomAvatars(postModel: postModel,),
                              ],
                            ),
                          ),
                        //Contact button and action keyword
                        // Padding(
                        //   padding: const EdgeInsets.all(12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       // InkWell(
                        //       //   onTap: (){
                        //       //     Navigator.push(context, MaterialPageRoute(
                        //       //       builder: (context) => ProfileTab(postModel: listOfPosts[0],),
                        //       //     ));
                        //       //   },
                        //       //   // child: Container(
                        //       //   //   height: 45,
                        //       //   //   decoration: BoxDecoration(
                        //       //   //     borderRadius:
                        //       //   //     BorderRadius.circular(20),
                        //       //   //     color: Color(0xffebf3fa),
                        //       //   //   ),
                        //       //   //   padding: const EdgeInsets.only(
                        //       //   //     left: 8,
                        //       //   //     right: 14,
                        //       //   //     top: 9,
                        //       //   //     bottom: 4,
                        //       //   //   ),
                        //       //   //   child: Row(
                        //       //   //     mainAxisSize: MainAxisSize.min,
                        //       //   //     crossAxisAlignment: CrossAxisAlignment.center,
                        //       //   //     children: [
                        //       //   //       SizedBox(
                        //       //   //         width: 70,
                        //       //   //         child: Text(
                        //       //   //           "Liên hệ",
                        //       //   //           style: TextStyle(
                        //       //   //             color: Colors.black,
                        //       //   //             fontSize: 18,
                        //       //   //             fontFamily: "Lato",
                        //       //   //             fontWeight:
                        //       //   //             FontWeight.w700,
                        //       //   //           ),
                        //       //   //         ),
                        //       //   //       ),
                        //       //   //       SizedBox(width: 4),
                        //       //   //       Container(
                        //       //   //         width: 22,
                        //       //   //         height: 20,
                        //       //   //         child: Icon(
                        //       //   //             Icons.call
                        //       //   //         ),
                        //       //   //       ),
                        //       //   //     ],
                        //       //   //   ),
                        //       //   // ),
                        //       // ),
                        //       ActionKeyword(
                        //         postModel: postModel,
                        //         isHomepagePost: true,),
                        //     ],
                        //   ),
                        // ),


                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                        //   child: Wrap(
                        //     children: [
                        //       Container(
                        //         child: Wrap(
                        //           spacing: 10,
                        //           direction: Axis.horizontal,
                        //           alignment: WrapAlignment.start,
                        //           children: getAllStatuses(postModel),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
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

  bool getIsActive(int currentIndex, int index){
    if(currentIndex<=index){
      return true;
    }else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> items = [];

    bool getReturnListCondition(Post post)
    {
          if(currentUser.isVerifyRescueCenter)
          {
                if(post.currentUser.id == currentUser.id && post.postType != PostType.RequestPost)
                  return true;
                return false;
          }

          else
            {
                  if(post.postType != PostType.RequestPost)
                    return true;
                  return false;
            }
    }

    listOfPosts.where((element) => getReturnListCondition(element)).forEach((e) =>
      items.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Row(
                  //   children: [
                  //     // CircleAvatar(
                  //     //   backgroundImage: NetworkImage(
                  //     //       e.currentUser.imageURL), maxRadius: 30,),
                  //     statusTitle(e)
                  //   ],
                  // ),
                  createTimelinePost(context, e),
                ],
              ),
            ),
          ),
      ),
      );

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
              decoration:
              BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/tracking_page.png"),
                ),
              ),
              child:
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
                return items[index];
            },
          )
          // Timeline(children: items, position: TimelinePosition.Left)
          //     LayoutBuilder(
          //       builder: (_, constraints) =>
          //           Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //               SingleChildScrollView(
          //                 child: ConstrainedBox(
          //                   constraints: BoxConstraints(
          //                     maxHeight: constraints.maxHeight - 48,),
          //                   child: Theme(
          //                     data:
          //                     ThemeData(primaryColor: PetRescueTheme.lightPink,
          //                         fontFamily: 'Montserrat'),
          //                     child: Stepper(
          //                       steps: [
          //                         ...listOfPosts
          //                             .map(
          //                               (post) =>
          //                               Step(
          //                                 isActive: true,
          //                                 // isActive: location.isHere || location.passed,
          //                                 title:
          //                                    Row(
          //                                      children: [
          //                                        CircleAvatar(
          //                                         backgroundImage: NetworkImage(
          //                                             post.currentUser.imageURL), maxRadius: 30,),
          //                                         SizedBox(width: 20,),
          //                                        statusTitle(post)
          //                                      ],
          //                                    ),
          //                                 subtitle: Text(post.timeCreated.toString(), style: TextStyle(fontSize: 15),),
          //                                 content: createTimelinePost(context, post),
          //                               ),
          //                         ).toList()
          //                       ],
          //
          //
          //                       controlsBuilder: (BuildContext context,
          //                           {VoidCallback onStepContinue,
          //                             VoidCallback onStepCancel}) {
          //                         return Container();
          //                       },
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //     )
      ),
    );


  }
}

class CustomAvatars extends StatelessWidget {
  final Post postModel;

  const CustomAvatars({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    List<Widget> list = [
      if(postModel.adoptUserRequests.length >= 1)
      Align(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            backgroundImage:
            NetworkImage(postModel.adoptUserRequests[postModel.adoptUserRequests.length-1].imageURL)

            // Image.network(postModel.adoptUserRequests[0].imageURL), // Provide your custom image
          ),
        ),
      ),

      if(postModel.adoptUserRequests.length >= 2)
        Align(
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(postModel.adoptUserRequests[postModel.adoptUserRequests.length-2].imageURL)
          ),
        ),
      ),
      if(postModel.adoptUserRequests.length >= 3)

        Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
              backgroundImage: NetworkImage(postModel.adoptUserRequests[postModel.adoptUserRequests.length-3].imageURL)
          ),
        ),
      ),
    ];
    return Container(
      width: 80,
      height: 40,
      child: Stack(
        children: list
      ),
    );
  }
}

Widget showResponsibleUserRibon(Post postModel)
{
  if(postModel.postType == PostType.AdoptPost)
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(backgroundImage: NetworkImage(postModel.acceptedRequestUser.imageURL),maxRadius: 25,),
    );
  else if((postModel.postType == PostType.InRescuePost && postModel.acceptedRequestUser != null))
    return OngoingRescuerRibbon(postModel: postModel,);
  else
    return PriorityRibbon(postModel: postModel,);
}
