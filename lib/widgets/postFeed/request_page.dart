import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/post_card.dart';

class RequestPostPage extends StatefulWidget {
  final List<Post> listOfPost;

  const RequestPostPage({Key key, @required this.listOfPost}) : super(key: key);

  @override
  _RequestPostPageState createState() => _RequestPostPageState();
}

class _RequestPostPageState extends State<RequestPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          itemCount: listOfPosts.length,
          itemBuilder: (BuildContext buildContext, int i) {
            return PostCard( postModel: listOfPosts[i]);
          }),
    );
  }
}
