import 'package:flutter/widgets.dart';
import 'package:petrescue/models/post_model.dart';

class PostState {
  List<Post> visiblePostTree = [];

  void addToVisibleTree(Post post) {
    visiblePostTree.add(post);
  }

  List<Post> get getVisiblePostTree => visiblePostTree;

  int get numOfPost => visiblePostTree.length;

  PostState();
}
