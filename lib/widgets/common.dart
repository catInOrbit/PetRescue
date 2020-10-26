import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/screens/timeline.dart';
import 'package:petrescue/widgets/process_page.dart';

class StatusTag extends StatelessWidget {
  final textData;
  final Post postModel;
  const StatusTag({Key key, @required this.textData, @required this.postModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (postModel.postType == PostType.RequestPost)
      colorScheme = PetRescueTheme.statusTagsRescueTheme;

    return Chip(
      backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
      label: Text(textData),
      labelStyle: TextStyle(color: Colors.white, fontSize: 13),
    );
  }
}

List<Widget> getAllStatuses(Post postModel) {
  return List<Widget>.generate(postModel.statuses.length, (index) {
    return StatusTag(
      postModel: postModel,
      textData: postModel.statuses[index].toString().split('.').last,
    );
  });
}

class UserInfoRibon extends StatelessWidget {
  final Post postModel;

  const UserInfoRibon({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else
      colorScheme = PetRescueTheme.requestRescuePostTheme;
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
              "tim.grover",
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

  const ActionKeyword({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    String text;
    if (postModel.postType == PostType.AdoptPost) {
      text = "Adopt";
      colorScheme = PetRescueTheme.revertAdoptPostTheme;
    } else if (postModel.postType == PostType.RequestPost) {
      text = "Rescue";
      colorScheme = PetRescueTheme.revertRescuePostTheme;
    }

    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        left: 12,
        right: 19,
        top: 7,
        bottom: 9,
      ),

      //TODO: Inkwell won't show ripple effeect
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80,
            child: InkWell(
              onTap: () {
                print("agag");
              },
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
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
    String text;
    List<Color> colorScheme;

    if (isTimeline) {
      text = "View timeline";
      colorScheme = [PetRescueTheme.orange, Colors.white];
    } else if (postModel.postType == PostType.AdoptPost) {
      text = "Adopt";
      colorScheme = PetRescueTheme.adoptPostTheme;
    } else if (postModel.postType == PostType.RequestPost) {
      text = "Rescue";
      colorScheme = PetRescueTheme.revertRescuePostTheme;
    }

    return Flexible(
      child: InkWell(
        onTap: () {
          postModel.acceptedRequestUser = currentUser;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (!isTimeline)
              return TrackingPage();
            else
              return Timeline(postModel: postModel,);
          }));
        },
        child: Container(
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.50),
            color: colorScheme[PetRescueThemeColorType.Accent.index],
          ),
          padding: const EdgeInsets.only(
            left: 58,
            right: 54,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
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
                "Be the first to rescue!",
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
      children: [
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(user.imageURL))),
        ),
        SizedBox(width: 5),
        Container(
          width: 97.17,
          height: 32,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 24,
                    child: Text(
                      user.fullNanme,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    user.job,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400,
                    ),
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

class OngoingRescuerRibbon extends StatelessWidget {
  final Post postModel;

  const OngoingRescuerRibbon({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color(0xff4b8669),
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

                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0x3f000000),
                        //     blurRadius: 4,
                        //     offset: Offset(0, 4),
                        //   ),
                        // ],
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
              "Rescue in progress! ",
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
    );
  }
}
