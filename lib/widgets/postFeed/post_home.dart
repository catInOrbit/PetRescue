import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/bloc/app_general/global.dart' as global;
import 'package:petrescue/widgets/detail_model_bottom.dart';

class PostHomePage extends StatefulWidget {
  final List<Post> listOfPost;

  const PostHomePage({Key key, @required this.listOfPost}) : super(key: key);

  @override
  _PostHomePageState createState() => _PostHomePageState();
}

class _PostHomePageState extends State<PostHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          itemCount: listOfPosts.length,
          itemBuilder: (BuildContext buildContext, int i) {
            return buildCard(context, listOfPosts[i]);
          }),
    );
  }

  Widget buildCard(BuildContext context, Post postModel) {
    List<Color> colorScheme;

    if(postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if(postModel.postType == PostType.RequestPost)
      colorScheme = PetRescueTheme.requestRescuePostTheme;

    return Container( //TODO: Fix constraint
      height: 600,
      child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DetailCard(postModel: postModel,)));
            },
            child: Container(
              width: 380,
              child: Stack(
                children: [
                  Container(),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  fontSize: 11,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 80,
                    child: Align(
                      alignment: Alignment.center,
                      //NOTE: Main Card BOdy
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme[PetRescueThemeColorType.KeyWord.index],
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserInfoRibon(postModel: postModel,),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
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
                                                      color: Colors.black,
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
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    SizedBox(
                                                      width: 31,
                                                      child: Text(
                                                        "Male",
                                                        style: TextStyle(
                                                          color: Color(0xff5e5d5d),
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
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    SizedBox(
                                                      width: 99,
                                                      child: Text(
                                                        "6-8  Months",
                                                        style: TextStyle(
                                                          color: Color(0xff5e5d5d),
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
                                                  color: Colors.black,
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
                                                        fontWeight: FontWeight.w700,
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
                                            ActionKeyword(colorScheme: PetRescueTheme.adoptPostTheme)
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
                                              width: 245,
                                              height: 63,
                                              child: Text(
                                                "Kitten was found stranded in a drain. I have brought it home and the kitten is being taken....",
                                                style: TextStyle(
                                                  color: Color(0xff555555),
                                                  fontSize: 16,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            //TODO: Row won't wrap
                                            Container(
                                              width: 245,
                                              child: Wrap(
                                                direction: Axis.horizontal,
                                                alignment: WrapAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: postModel.statuses.length,
                                                        itemBuilder: (BuildContext buildContext, int i) {
                                                          return StatusTag(
                                                            textData: postModel.statuses[i].toString(),
                                                            postModel: postModel,
                                                          );
                                                        }),

                                                    height: 30,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 27),
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
                                  children: [
                                    Timeline(
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            children: [ Text(
                                              "XYZRescued aw daw aw dwa  dwadw centre d dwdaw awdaw d ad wadwa wresponded",
                                              style: TextStyle(
                                                color: Color(0xff5e5d5d),
                                                fontSize: 12,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                              Container(
                                                height: 20,
                                                child: Text(
                                                  "10min ago",
                                                  style: TextStyle(
                                                    color: Color(0xffc4c4c4),
                                                    fontSize: 10,
                                                    fontFamily: "Lato",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 50),

                                      ],
                                      indicators: [
                                        Icon(Icons.access_time),
                                        Icon(Icons.access_time),
                                      ],
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
                ],
              ),
            ),
          ),
        ),
    );
  }
}
