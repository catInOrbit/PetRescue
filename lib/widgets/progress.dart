import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/widgets/common.dart';

class Progress extends StatelessWidget {
  final Post postModel;

  const Progress({Key key, this.postModel}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    List<Color> colorScheme;

    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (postModel.postType == PostType.RequestPost)
      colorScheme = PetRescueTheme.requestRescuePostTheme;

    return Container(
      //TODO: Fix constraint
      height: 420,
      padding: EdgeInsets.only(top: 20),
     // color:Colors.black,
      child: Center(
        child: InkWell(
          onTap: () {
          },
          child: Container(
            width: 380,
            child: Stack(
              children: [
                Container(),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Container(
                          width: 380,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg")),
                            borderRadius: BorderRadius.circular(35),
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
                                  ],
                                ),
                              ),
                              SizedBox(height: 92),
                              SizedBox(
                                width: 81,
                                height: 24,
                                child: Text(
                                  "25min ago",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffebf3fa),
                                    fontSize: 12,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 160,
                  child: Align(
                    alignment: Alignment.topCenter,
                    //NOTE: Main Card BOdy
                    child: Container(
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

                          UserInfoRibon(
                            postModel: postModel,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 500,
                              height: 144,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                height: 29,
                                                child: Text(
                                                  "Rescued Kitten",
                                                  style: TextStyle(
                                                    color: colorScheme[PetRescueThemeColorType
                                                        .Accent.index],
                                                    fontSize: 20,
                                                    fontFamily: "Lato",
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 13),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 5,
                                                    height: 4.80,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: colorScheme[PetRescueThemeColorType
                                                          .Accent.index],
                                                    ),
                                                  ),
                                                  SizedBox(width: 7),
                                                  SizedBox(
                                                    width: 31,
                                                    child: Text(
                                                      "Male",
                                                      style: TextStyle(
                                                        color:
                                                        colorScheme[PetRescueThemeColorType
                                                            .Accent.index],
                                                        fontSize: 14,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 7),
                                                  Container(
                                                    width: 5,
                                                    height: 4.80,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: colorScheme[PetRescueThemeColorType
                                                          .Accent.index],
                                                    ),
                                                  ),
                                                  SizedBox(width: 7),
                                                  SizedBox(
                                                    width: 99,
                                                    child: Text(
                                                      "6-8  Months",
                                                      style: TextStyle(
                                                        color:
                                                        colorScheme[PetRescueThemeColorType
                                                            .Accent.index],
                                                        fontSize: 14,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 57,
                                            height: 15,
                                            child: Text(
                                              "House cat",
                                              style: TextStyle(
                                                color: colorScheme[PetRescueThemeColorType
                                                    .Accent.index],
                                                fontSize: 12,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 33,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
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
                                              children: [
                                                SizedBox(
                                                  width: 47,
                                                  child: Text(
                                                    "Contact",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                          ActionKeyword(
                                            postModel: postModel,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            height: 80,
                                            child: Text(
                                              "Kitten was found strad wa  daw awd  dwadnde wda wa d dwqdad d in a drain. I have brought it home and the kitten is being taken....",
                                              style: TextStyle(
                                                color: colorScheme[PetRescueThemeColorType
                                                    .Accent.index],
                                                fontSize: 16,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
