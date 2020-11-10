import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/timeline.dart';

class PageTimelines extends StatefulWidget {
  final Post postModel;

  const PageTimelines({Key key, this.postModel}) : super(key: key);

  @override
  _PageTimelinesState createState() => _PageTimelinesState();
}

class _PageTimelinesState extends State<PageTimelines> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 420,
              padding: EdgeInsets.fromLTRB(10.0, 10, 10, 5),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cam",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Giống chó Lạp xưởng - Xúc xích",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Roboto",
                            // fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "lib/assets/female_gender_icon.jpeg",
                          height: 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Người đăng kí nhận nuôi:",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                widget.postModel.adoptUserRequests[0].imageURL),
                            radius: 30,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // height: 100,
                            // width: 245,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Nguyễn Đỗ Cát Tường",
                                    style: TextStyle(
                                      color: Color(0xff4b8669),
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Ngày nhận nuôi: 14/10/2020 5:30 PM",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w300,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Ngày cập nhật lần cuối: 15/10/2020 5:30PM",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w300,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            color: PetRescueTheme.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Xem cập nhật",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              padding: EdgeInsets.fromLTRB(10.0, 10, 10, 5),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              widget.postModel.adoptUserRequests[1].imageURL),
                          radius: 30,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 245,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Tín Võ",
                                  style: TextStyle(
                                    color: Color(0xff4b8669),
                                    fontSize: 18,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Ngày nhận nuôi: 13/9/2020 5:30 PM",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Ngày cập nhật lần cuối: 13/10/2020 5:30PM",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w300,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.warning,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  Text(
                                    "Người dùng chưa cập nhật tình trạng thú nuôi.",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
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
    );
  }
}
