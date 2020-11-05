import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/models/status_data.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/screens/timeline.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/timeline_text.dart';

enum PostType { InfoPost, UpdatedPost, CriticalPost, RequestPost, AdoptPost, InRescuePost, FinishedPost}
enum Category { InfoPost, UpdatedPost, CriticalPost, RequestPost, AdoptPost, InRescuePost, FinishedPost}

class Post {
  Key key;
  String title, petType, gender, ages, description, location, imageThumbnail, breed, id;
  DateTime timeCreated;
  PostType postType;
  List<String> statuses = [];
  List<TimeLineText> timelineText = [];
  Widget timelineBuilder;
  User currentUser, acceptedRequestUser;
  List<User> adoptUserRequests;
  List<String> imageStrings;
  Priority priority;
  bool _acceptedRequest = false;


  Post.empty()
  {

  }

  Post(id, title, description, petType, location, timeCreated, postType,
      imageString, gender, ages, statuses, timeline, user, adoptUserRequests, acceptedRequestUser, imageStrings, breed, priority, acceptedRequest) {
    this.id = id;
    this.title = title;
    this.petType = petType;
    this.description = description;
    this.location = location;
    this.timeCreated = timeCreated;
    this.postType = postType;
    this.imageThumbnail = imageString;
    this.gender = gender;
    this.ages = ages;
    this.statuses = statuses;
    this.timelineText = timeline;
    this.currentUser = user;
    this.adoptUserRequests = adoptUserRequests;
    this.acceptedRequestUser = acceptedRequestUser;
    this.imageStrings = imageStrings;
    this.breed = breed;
    this.priority = priority;
    this._acceptedRequest = acceptedRequest;

    if(timelineText== null || timelineText.length > 0)
    timelineBuilder = new TimelineBuilder(
          children: timelineText,
          indicators: generateIconTimeline(timelineText.length)
      ,);

    else
      timelineBuilder = new Container();
  }


  bool get acceptedRequest => _acceptedRequest;

  set acceptedRequest(bool value) {
    _acceptedRequest = value;
  }

  List<Widget> generateIconTimeline(int amount)
  {
    return List<Widget>.generate(amount, (index) => Icon(
      Icons.timer, color: PetRescueTheme.darkGreen,
    ));
  }
}

enum Statuses { Injured, Abandoned, LostOwner }
enum Priority {Normal, High}

