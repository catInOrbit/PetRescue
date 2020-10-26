import 'package:flutter/material.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/common.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: listOfPosts.length,
          itemBuilder: (context, index)
          {
            if(listOfPosts[index].acceptedRequestUser != null)
              return HomePagePost(postModel: listOfPosts[index],);
            else
              return Container();
        },),
      ),
    );
  }
}
