import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rescue Center  XY",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Opacity(
                          opacity: 0.50,
                          child: Container(
                            width: 9.50,
                            height: 10.50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffbebebe),
                                width: 0.50,
                              ),
                              color: Color(0xffbebebe),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Example St.",
                        style: TextStyle(
                          color: Color(0xffbebebe),
                          fontSize: 12,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 82),
              Container(
                width: 87,
                height: 50,
              ),
            ],
          ),
          SizedBox(height: 19.50),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
            "Information",
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
              right: 60,
              top: 16,
              bottom: 14,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rescued:",
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: 0.50,
                          child: Container(
                            width: 11.62,
                            height: 14.69,
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
                          "47th Test Street",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 57),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Opacity(
                            opacity: 0.50,
                            child: Container(
                              width: 11.33,
                              height: 11.33,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.50,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "03/09/2020 - 04:30PM",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11.17),
                Text(
                  "Located:",
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
                          height: 10.62,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Rescue Center XY - Example St.",
                      style: TextStyle(
                        color: Colors.white,
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
          SizedBox(height: 19.50),
          Container(
            width: 369,
            height: 182,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 346,
                      height: 182,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 365,
                      height: 112,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                        style: TextStyle(
                          color: Color(0xff151515),
                          fontSize: 18,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
