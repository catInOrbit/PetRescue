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
      "https://sbly-web-prod-shareably.netdna-ssl.com/wp-content/uploads/2018/08/14083438/battle_cat_recovery_featured.jpg",
    "Male",
    "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
    <TimeLineText>[],
      userList[0],
    <User>[],
      null,
    <String>[],
    "Persian",
    Priority.Normal
  ),

  Post(
      "Cần giải cứu mèo bị thương chân",
      "description",
      "House cat",
      "2426  Breezewood Court",
      DateTime.now(),
      PostType.RequestPost,
      "https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-g70644hiocchitapae654vgia4-20161227061350.Medi.jpeg",
      "Male",
      "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
      <TimeLineText>[],
      userList[0],
      <User>[],
      null,
      <String>[],
      "Persian",
      Priority.High
  ),

  Post(
    "Đã giải cứu mèo ở quận 2",
    "description",
    "House cat",
    "164 Ilbert Street, London,W10 4QD ",
    DateTime.now(),
    PostType.AdoptPost,
      "https://img.huffingtonpost.com/asset/5c3544842600003e058624ff.jpeg?ops=scalefit_630_noupscale",
    "Male",
    "6-8 months",
    ["2kg", "Đã được vaccine"],
    [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[1],
      <User>[userList[2], userList[3]],
    userList[2],
    <String>[],
    "COco",
      Priority.Normal


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
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
      [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[1],
      <User>[userList[2]],
      userList[2],
      <String>[],
    "Oxloot",
      Priority.Normal
  ),


];
