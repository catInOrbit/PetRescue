import 'package:flutter/material.dart';
import 'package:petrescue/widgets/common.dart';


class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double  pictureContainersHeight = 272;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
            Container(
              height: MediaQuery.of(context).size.height + pictureContainersHeight,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  // width: 230,
                                  height: pictureContainersHeight,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("lib/assets/cat3.png"),
                                        fit: BoxFit.fill
                                    )
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 147,
                                    height: 132,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("lib/assets/cat4.png"),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                  Container(
                                    width: 147,
                                    height: 140,
                                     color: Colors.blueGrey,
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
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 390.30,
                            padding: const EdgeInsets.only(
                              right: 9,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 29,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(
                                        right: 40,
                                        bottom: 4,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
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
                                          SizedBox(width: 32),
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
                                          Expanded(
                                            child: SizedBox(
                                              width: 77,
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
                                          ),
                                        ],
                                      ),
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
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: [
                                      StatusTag(textData: "Test",),
                                    ],
                                  )
                                ),
                                SizedBox(height: 22),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                IntrinsicHeight(
                                  child: Row(
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
                                            Flexible(
                                              child: InkWell(
                                                child: Container(
                                                  height: 53,
                                                  child: Text(
                                                    "Contact",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 25.07),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 3),
                                      //TODO: Find way to expand children
                                      Flexible(
                                        child: Container(
                                          height: 53,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26.50),
                                            color: Color(0xffff8068),
                                          ),
                                          padding: const EdgeInsets.only(
                                            left: 58,
                                            right: 54,
                                          ),
                                          child: Center(
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          StoryDetail(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}

class StoryDetail extends StatelessWidget {
  const StoryDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
