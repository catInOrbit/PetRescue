import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TimelineBottomSheet extends StatefulWidget {
  @override
  _TimelineBottomSheetState createState() => _TimelineBottomSheetState();
}

class _TimelineBottomSheetState extends State<TimelineBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 411,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xfffff9f8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 31,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff5e5d5d),
            ),
          ),
          SizedBox(height: 18),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Timeline",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Wednesday, 5th Oct ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "12:57 p.m",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 9),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "tim.grover reported at Church st.",
                                style: TextStyle(
                                  color: Color(0xff5e5d5d),
                                  fontSize: 14,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 26),
                              SizedBox(
                                width: 46,
                                height: 17.51,
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
                        ],
                      ),
                      SizedBox(height: 10.85),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "1:05 p.m",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 17),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 201,
                                height: 21,
                                child: Text(
                                  "XYZ Rescue Centre responded",
                                  style: TextStyle(
                                    color: Color(0xff5e5d5d),
                                    fontSize: 14,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(width: 26),
                              SizedBox(
                                width: 46,
                                height: 17.51,
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
                        ],
                      ),
                      SizedBox(height: 10.85),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 55,
                            height: 20.43,
                            child: Text(
                              "1:25 p.m",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 228,
                                child: Text(
                                  "XYZ Rescue Centre  arrived at the scene",
                                  style: TextStyle(
                                    color: Color(0xff5e5d5d),
                                    fontSize: 14,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 46,
                                height: 17.51,
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
                        ],
                      ),
                      SizedBox(height: 10.85),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 55,
                            height: 20.43,
                            child: Text(
                              "1:35 p.m",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 273,
                            height: 41.39,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: SizedBox(
                                      width: 232,
                                      height: 40.85,
                                      child: Text(
                                        "Stranded Kitten rescued and is housed at XYZRescue Home",
                                        style: TextStyle(
                                          color: Color(0xff5e5d5d),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 157,
                                  top: 181.51,
                                  child: SizedBox(
                                    width: 46,
                                    height: 17.51,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
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
                    width: 96,
                    height: 32,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 81,
                              height: 24,
                              child: Text(
                                "tim.grover",
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
              ),
              SizedBox(height: 8),
              Row(
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
                  SizedBox(width: 12),
                  Container(
                    width: 142,
                    height: 28,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "XYZRescue Centre",
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
                        Positioned(
                          left: 77,
                          top: 41,
                          child: Opacity(
                            opacity: 0.50,
                            child: Container(
                              width: 16,
                              height: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Responder",
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
