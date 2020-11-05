import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/widgets/postFeed/post_empty.dart';
import 'package:petrescue/bloc/app_general/global.dart' as globals;

class TimelineBottomCard extends StatefulWidget {
  final Post postModel;

  const TimelineBottomCard({Key key, this.postModel}) : super(key: key);
  @override
  _TimelineBottomCardState createState() => _TimelineBottomCardState();
}

class _TimelineBottomCardState extends State<TimelineBottomCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: PetRescueTheme.lightPink,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/tracking_page.png"))),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          CircleAvatar(backgroundImage: NetworkImage(widget.postModel.currentUser.imageURL), radius: 25,),
                          Text(
                            globals.currentUser.centerName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.postModel.imageThumbnail),
                        fit: BoxFit.cover
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 275,
                      top: 16,
                      bottom: 217,
                    ),
                    child: Text(
                      "Moo Cat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 19.50),
                  Text(
                    "Thông tin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 19.50),
                  Container(
                    width: 343,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Color(0xffff8068),
                    ),
                    padding: const EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16,
                      bottom: 14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "Cập nhật mới nhất vào",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]
                        ),
                        SizedBox(height: 11.17),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Opacity(
                                  opacity: 0.50,
                                  child: Container(
                                    width: 11.62,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.20,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6.58),
                                Text(
                                  "12:45PM 20/12/2020",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 11.17),
                        Text(
                          " Địa điểm giải cứu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 11.17),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                                bottom: 3,
                              ),
                              child: Opacity(
                                opacity: 0.50,
                                child: Container(
                                  width: 12.50,
                                  height: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              width: 250,
                              child: Text(
                                widget.postModel.location,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.50),
                  PostEmpty(postModel: widget.postModel),
                  SizedBox(height: 19.50),
                  PostEmpty(postModel: widget.postModel,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
