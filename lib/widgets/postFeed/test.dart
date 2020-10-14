import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      child: Stack(
        children: [
          Container(
            width: 380,
            color: Colors.white,
            padding: const EdgeInsets.only(
              right: 19,
              top: 11,
              bottom: 106,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(27.50),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(27.50)),
                        color: Color(0xff4b8669),
                      ),
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 35,
                      ),
                      child: Row(
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
                          SizedBox(
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
                          SizedBox(width: 12),
                          Opacity(
                            opacity: 0.50,
                            child: Container(
                              width: 16.11,
                              height: 16,
                              color: Color(0xffebf3fa),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 91),
                    Container(
                      width: 62,
                      height: 63,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(51),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 184),
                Container(
                  width: 195,
                  height: 45,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 88,
                        top: 25,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xff4b8669),
                          ),
                          padding: const EdgeInsets.only(
                            left: 7,
                            right: 5,
                            top: 2,
                            bottom: 3,
                          ),
                          child: Text(
                            "Injured Leg",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xff4b8669),
                            ),
                            padding: const EdgeInsets.only(
                              top: 2,
                              bottom: 3,
                            ),
                            child: Text(
                              "Vet Checked",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xff4b8669),
                          ),
                          padding: const EdgeInsets.only(
                            top: 2,
                            bottom: 4,
                          ),
                          child: Text(
                            "12 Kgs",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 89,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xff4b8669),
                          ),
                          padding: const EdgeInsets.only(
                            left: 4,
                            right: 3,
                            top: 2,
                            bottom: 4,
                          ),
                          child: Text(
                            "6-8 Months",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xff4b8669),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 3,
                            ),
                            child: SizedBox(
                              width: 25,
                              child: Text(
                                "Male",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xff4b8669),
                            ),
                            padding: const EdgeInsets.only(
                              top: 2,
                              bottom: 4,
                            ),
                            child: SizedBox(
                              width: 25,
                              child: Text(
                                "Tag",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 35,
                            height: 18,
                            child: Text(
                              "+3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff4b8669),
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
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
          ),
          Positioned(
            left: 11,
            top: 84,
            child: Container(
              width: 366,
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    top: 57,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: 0.50,
                          child: Container(
                            width: 21.50,
                            height: 24.50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 0.50,
                              ),
                              color: Color(0xff4b8669),
                            ),
                          ),
                        ),
                        SizedBox(width: 9),
                        Text(
                          "24th Test Street, Test City",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff4b8669),
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 362,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SizedBox(width: 45),
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
                                              fontWeight: FontWeight.w400,
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
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 48),
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
                                SizedBox(height: 48),
                                SizedBox(
                                  width: 223,
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
                                SizedBox(height: 48),
                                Container(
                                  width: 336.67,
                                  height: 57,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 9,
                                                      height: 9,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xffff8068),
                                                      ),
                                                    ),
                                                    SizedBox(width: 14.67),
                                                    SizedBox(width: 14.67),
                                                    Text(
                                                      "XYZRescue centre responded",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff5e5d5d),
                                                        fontSize: 12,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(width: 14.67),
                                                    Text(
                                                      "10min ago",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffc4c4c4),
                                                        fontSize: 10,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 67.58),
                                                Opacity(
                                                    opacity: 0.50,
                                                    child: Transform.rotate(
                                                      angle: 1.57,
                                                      child: Container(
                                                        width: 8,
                                                        height: 13.09,
                                                        color:
                                                            Color(0xff5e5d5d),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 11,
                                        top: -138,
                                        child: Row(
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 237,
                              top: 106,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 42.73,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(21.36),
                                      color: Color(0xffebf3fa),
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 7,
                                      top: 10,
                                      bottom: 6,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 60.85,
                                          height: 20.72,
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
                                        SizedBox(width: 17.50),
                                        Opacity(
                                          opacity: 0.50,
                                          child: Container(
                                            width: 27.39,
                                            height: 25.89,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Adopt",
                                        style: TextStyle(
                                          color: Color(0xff4b8669),
                                          fontSize: 24,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 22),
                                      Container(
                                        width: 27.72,
                                        height: 24.61,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Opacity(
                                                  opacity: 0.50,
                                                  child: Container(
                                                    width: 7.93,
                                                    height: 7.28,
                                                    color: Color(0xff4b8669),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Opacity(
                                                  opacity: 0.50,
                                                  child: Container(
                                                    width: 7.93,
                                                    height: 7.28,
                                                    color: Color(0xff4b8669),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Opacity(
                                                  opacity: 0.50,
                                                  child: Container(
                                                    width: 18.58,
                                                    height: 14.27,
                                                    color: Color(0xff4b8669),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Opacity(
                                                  opacity: 0.50,
                                                  child: Container(
                                                    width: 8.74,
                                                    height: 8.02,
                                                    color: Color(0xff4b8669),
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
        ],
      ),
    );
  }
}
