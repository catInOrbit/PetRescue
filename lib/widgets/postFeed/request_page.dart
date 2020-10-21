import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/post_card.dart';

class RequestPostPage extends StatefulWidget {
  final List<Post> listOfPost;
  final String sortType;

  const RequestPostPage({Key key, @required this.listOfPost, this.sortType}) : super(key: key);

  @override
  _RequestPostPageState createState() => _RequestPostPageState();
}

class _RequestPostPageState extends State<RequestPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          itemCount: sortedList(listOfPosts).length,
          itemBuilder: (BuildContext buildContext, int i) {
            return PostCard( postModel: sortedList(listOfPosts)[i]);
          }),
    );
  }

  List<Post> sortedList(List<Post> listOfPost)
  {
    if(widget.sortType == PostType.RequestPost.toString().split('.').last)
      return listOfPost.where((element) => element.postType.toString().split('.').last == widget.sortType).toList();

    else if(widget.sortType == PostType.AdoptPost.toString().split('.').last)
      return listOfPost.where((element) => element.postType.toString().split('.').last == widget.sortType).toList();
  }
}
