import 'package:flutter/material.dart';
import 'package:petrescue/widgets/feed.dart';
import 'package:petrescue/widgets/post_card.dart';

class PostHome extends StatefulWidget
{
  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome>
{

  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index){
              return   PostBody(
                  image: "https://avatars2.githubusercontent.com/u/18541062?s=400&u=8615e79647fcff133862cd6c832cacce54b484a1&v=4",
                  content: "",
                  name: "Poster",
                  date: "12/12/2020",
                  time: "12:00",
              );
            }
        ),
      );
  }
}
