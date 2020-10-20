import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/models/status_data.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/screens/timeline.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/timeline_text.dart';

enum PostType { InfoPost, UpdatedPost, CriticalPost, RequestPost, AdoptPost }

class Post {
  String title, petType, gender, ages, description, location, imageString;
  DateTime timeCreated;
  PostType postType;
  List<Statuses> statuses = [];
  List<TimeLineText> timelineText = [];
  Widget timelineBuilder;
  User user;

  Post(title, description, petType, location, timeCreated, postType,
      imageString, gender, ages, statuses, timeline, user) {
    this.title = title;
    this.petType = petType;
    this.description = description;
    this.location = location;
    this.timeCreated = timeCreated;
    this.postType = postType;
    this.imageString = imageString;
    this.gender = gender;
    this.ages = ages;
    this.statuses = statuses;
    this.timelineText = timeline;
    this.user = user;

    if(timelineText== null || timelineText.length > 0)
    timelineBuilder = new TimelineBuilder(
          children: timelineText,
          indicators: generateIconTimeline(timelineText.length)
      ,);

    else
      timelineBuilder = new Container();
  }

  List<Widget> generateIconTimeline(int amount)
  {
    return List<Widget>.generate(amount, (index) => Icon(
      Icons.timer,
    ));
  }
}

enum Statuses { Injured, Abandoned, LostOwner }
