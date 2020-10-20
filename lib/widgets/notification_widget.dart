import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "August 21, 14:57PM",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color(0xffabd2bf),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 9,
                      ),
                      child: Opacity(
                        opacity: 0.50,
                        child: Container(
                          width: 45,
                          height: 40.50,
                          color: Color(0xff4b8669),
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 256,
                          height: 29,
                          child: Text(
                            "Request accepted",
                            style: TextStyle(
                              color: Color(0xff4b8669),
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "User accepted your adoption request",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 18,
                  height: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
