import 'package:flutter/material.dart';

class Full extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  height: 272,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 147,
                      height: 132,
                    ),
                    Container(
                      width: 147,
                      height: 140,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 61,
                            top: 64,
                            child: SizedBox(
                              width: 21,
                              child: Text(
                                "+3 ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.50,
                            child: Container(
                              width: 147,
                              height: 140,
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
        Container(
          color: Color(0xffc4c4c4),
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 390.30,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 374,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 166,
                                height: 29,
                                child: Text(
                                  "Stranded Kitten",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Container(
                                width: 5,
                                height: 4.80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 6),
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
                              SizedBox(width: 6),
                              Container(
                                width: 5,
                                height: 4.80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 6),
                              SizedBox(
                                width: 122,
                                child: Text(
                                  "6-8 Months",
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
                    SizedBox(height: 22),
                    Container(
                      height: 19,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                          SizedBox(width: 11),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xfff99746),
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
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                  Positioned(
                                    left: 39.06,
                                    top: 4,
                                    child: Opacity(
                                      opacity: 0.50,
                                      child: Container(
                                        width: 16.11,
                                        height: 16,
                                        color: Colors.black,
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
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              child: Stack(
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
                                ],
                              ),
                            ),
                            SizedBox(width: 13),
                            Text(
                              "Be the first to rescue!",
                              style: TextStyle(
                                color: Color(0xffffb9ac),
                                fontSize: 20,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26.50),
                            color: Color(0xffebf3fa),
                          ),
                          padding: const EdgeInsets.only(
                            left: 23,
                            right: 31,
                            top: 11,
                            bottom: 13,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Contact",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 25.07),
                              Opacity(
                                opacity: 0.50,
                                child: Container(
                                  width: 26.79,
                                  height: 25.60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.30,
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 3),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26.50),
                            color: Color(0xffff8068),
                          ),
                          padding: const EdgeInsets.only(
                            left: 58,
                            right: 54,
                          ),
                          child: Text(
                            "Rescue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 46),
              Container(
                width: 398.50,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Story",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          width: 352,
                          child: Text(
                            "Kitten was found stranded in a drain. I found it severly injured and it’s leg stuck in a hole. ",
                            style: TextStyle(
                              color: Color(0xff555555),
                              fontSize: 16,
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
            ],
          ),
        ),
      ],
    ),
      ],
    );
  }
}
