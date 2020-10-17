import 'package:flutter/material.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
class StatusTag extends StatelessWidget
{
  final textData;
  final Post postModel;
  const StatusTag({Key key, @required this.textData, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    if(postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if(postModel.postType == PostType.RequestPost)
      colorScheme = PetRescueTheme.statusTagsRescueTheme;

    return Chip(
      backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
      label: Text(textData),
      labelStyle: TextStyle(color: Colors.white, fontSize: 13),
    );

    // return Wrap(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(top: 4, right: 4),
    //       child: Container(
    //         decoration: BoxDecoration(
    //             borderRadius: const BorderRadius.all(Radius.circular(26)),
    //             color: colorScheme[PetRescueThemeColorType.Accent.index]),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
    //           child: Text(
    //             textData,
    //             style: TextStyle(color: Colors.white, fontSize: 13),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

class UserInfoRibon extends StatelessWidget {

  final Post postModel;

  const UserInfoRibon({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorScheme;
    if(postModel.postType == PostType.AdoptPost)
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
      padding: const EdgeInsets.all(4
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('lib/assets/profile_icon.png'),
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
    if(postModel.postType == PostType.AdoptPost)
      {
         text = "Adopt";
         colorScheme = PetRescueTheme.revertAdoptPostTheme;
      }
    else if(postModel.postType == PostType.RequestPost)
      {
        text = "Rescue";
        colorScheme = PetRescueTheme.revertRescuePostTheme;
      }

    return Container(
      height: 38,
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
            width: 60,
            child: InkWell(
              onTap: () {
                print("agag");
              },
              child: Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: colorScheme[PetRescueThemeColorType.KeyWord.index],
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight:
                    FontWeight.w700,
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


class UserInfo extends StatelessWidget
{
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
            backgroundImage: NetworkImage(postModel.imageString),
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

  const DetailCardButton({Key key, this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    String text;
    List<Color> colorScheme;

    if(postModel.postType == PostType.AdoptPost)
    {
      text = "Adopt";
      colorScheme = PetRescueTheme.adoptPostTheme;
    }

    else if (postModel.postType == PostType.RequestPost)
    {
      text = "Rescue";
      colorScheme = PetRescueTheme.revertRescuePostTheme;
    }


    return  Flexible(
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(26.50),
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
    );
  }
}

class CommonTool
{
   Color ColorStatePicker(PostType postType)
   {
      // switch(postType)
      // {
      //   case PostType.RequestPost:
      //     return PetRescueTheme.
      // }
   }

}

class UserInfoTile extends StatelessWidget {
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
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
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
                      "tim.grover",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Lato",
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Poster",
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





