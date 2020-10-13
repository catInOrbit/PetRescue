import 'package:flutter/material.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
class StatusTag extends StatelessWidget
{
  final textData;

  const StatusTag({Key key, this.textData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );;
  }
}

class UserInfo extends StatelessWidget
{
  final Post postModel;

  const UserInfo({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}

