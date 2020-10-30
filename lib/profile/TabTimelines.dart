import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/timeline.dart';

class PageTimelines extends StatefulWidget {
  @override
  _PageTimelinesState createState() => _PageTimelinesState();
}

class _PageTimelinesState extends State<PageTimelines> {
  @override
  Widget build(BuildContext context) {
    return TimelineBottomCard(postModel: listOfPosts[0],);
  }
}
