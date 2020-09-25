import 'package:flutter/material.dart';
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
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemCount: 5,
          itemBuilder: (BuildContext buildContext, int index){
            return PostCard();
          },
        ),
      );
  }

}
