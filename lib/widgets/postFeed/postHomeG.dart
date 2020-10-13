import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/bloc/app_general/global.dart' as global;
import 'package:petrescue/widgets/detail_model_bottom.dart';

class PostHomeG extends StatelessWidget {
  final Post postModel;

  const PostHomeG({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailCard()));
        },
        child: Container(
          width: 380,
          height: 500,
          child: Stack(
            children: [
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
                              Positioned(
                                child: SizedBox(
                                  width: 81,
                                  height: 24,
                                  child: Text(
                                    "tim.grover",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffebf3fa),
                                      fontSize: 16,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    width: 81,
                                    height: 24,
                                    child: Text(
                                      "2 mi away",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffe5e5e5),
                                        fontSize: 9,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: SizedBox(
                                  width: 57,
                                  height: 17,
                                  child: Text(
                                    "Church St. ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffebf3fa),
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
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
                top: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                        Container(
                                          height: 38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(0xffff8068),
                                          ),
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
                                                width: 51,
                                                child: InkWell(
                                                  onTap: () {
                                                    print("agag");
                                                  },
                                                  child: Container(
                                                    child: Text(
                                                      "Adopt",
                                                      style: TextStyle(
                                                        color: Colors.white,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Wrap(
                                                      direction:
                                                          Axis.horizontal,
                                                      children: <Widget>[
                                                        DateTimeTitle(
                                                            "12dawdwa"),
                                                        DateTimeTitle("12dawd"),
                                                        DateTimeTitle("12dawd"),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                                isScrollControlled: true
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 9,
                                      height: 9,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffff8068),
                                      ),
                                    ),
                                    SizedBox(width: 14.67),
                                    SizedBox(width: 14.67),
                                    Text(
                                      "XYZRescue centre responded",
                                      style: TextStyle(
                                        color: Color(0xff5e5d5d),
                                        fontSize: 12,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 14.67),
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
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 9,
                                      height: 9,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffff8068),
                                      ),
                                    ),
                                    SizedBox(width: 13),
                                    Text(
                                      "XYZRescue posted: Found cat at  location ...",
                                      style: TextStyle(
                                        color: Color(0xff5e5d5d),
                                        fontSize: 12,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 13),
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
    );
  }

  Widget UserInfo() {
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

  Widget DateTimeTitle(String textData) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                color: HexColor("#F6CC9F")),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              child: Text(
                textData,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget BodyCard() {
    return Card(
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Column(
              children: [
                ListTile(
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  title: Row(
                    children: [
                      new Text(
                        postModel.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(postModel.gender,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(postModel.ages,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15))
                    ],
                  ),
                  subtitle: Text(postModel.petType,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                DateTimeTitle("12dawdwa"),
                                DateTimeTitle("12dawdwa"),
                                DateTimeTitle("dead"),
                                DateTimeTitle("12dawd"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Flat Button",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            FlatButton(
                              color: Colors.blueGrey,
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.grey,
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Flat Button",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
