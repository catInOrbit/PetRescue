import 'package:flutter/material.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/postFeed/post_home.dart';

class PostHome extends StatefulWidget {
  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              itemCount: listOfPosts.length,
              itemBuilder: (BuildContext buildContext, int i) {
                // return PostBody(
                //   postModel: listOfPosts[i],
                // );
                return PostHomePage(listOfPost: listOfPosts);
              }),
        ),
      ],
    );
  }
}
