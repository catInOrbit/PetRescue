import 'package:flutter/material.dart';

class PostEmpty extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
