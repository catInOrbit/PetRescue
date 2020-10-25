import 'package:flutter/widgets.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';

class PostState {
  List<Post> _visiblePostTree = listOfPosts;


  List<Post> get visiblePostTree => _visiblePostTree;

  set visiblePostTree(List<Post> value) {
    _visiblePostTree = value;
  }

  int get numOfPost => _visiblePostTree.length;

  PostState();
}
