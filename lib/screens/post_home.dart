import 'package:flutter/material.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/models/status_data.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/post_card_improved.dart';

class PostHome extends StatefulWidget {
  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          itemCount: listOfPosts.length,
          itemBuilder: (BuildContext buildContext, int i) {
            return PostBody(
              postModel: listOfPosts[i],
            );
          }),
    );
  }
}
