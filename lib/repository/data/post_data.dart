import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/widgets/timeline_text.dart';

List<Post> listOfPosts = [
  Post(
    "Cần giải cứu mèo bị thương chân",
    "description",
    "House cat",
    "2426  Breezewood Court",
    DateTime.now(),
    PostType.RequestPost,
      "https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg",
    "Male",
    "6-8 months",
     [Statuses.Abandoned, Statuses.Injured],
    <TimeLineText>[],
      userList[0],
    <User>[],
      null,
    <String>[],
    "Persian"
  ),

  Post(
    "Title 1",
    "description",
    "House cat",
    "164 Ilbert Street, London,W10 4QD ",
    DateTime.now(),
    PostType.AdoptPost,
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*",
    "Male",
    "6-8 months",
    [Statuses.Abandoned, Statuses.Injured, Statuses.LostOwner],
    [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[1],
      <User>[userList[2]],
    userList[2],
    <String>[],
    "COco"
  ),

  Post(
      "Title 1",
      "description",
      "House cat",
      "7 Croftlands Drive, Ravenglass",
      DateTime.now(),
      PostType.InRescuePost,
      "https://www.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg",
      "Male",
      "6-8 months",
      [Statuses.Abandoned, Statuses.Injured, Statuses.LostOwner],
      [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[1],
      <User>[userList[2]],
      userList[2],
      <String>[],
    "Oxloot"
  ),


];
