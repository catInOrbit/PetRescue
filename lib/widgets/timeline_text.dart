import 'package:flutter/material.dart';

class TimeLineText extends StatelessWidget {
  final String postTile, timePosted;

  const TimeLineText({Key key, @required this.postTile, @required this.timePosted}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Text(
            postTile,
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
              timePosted,
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
    );
  }
}
