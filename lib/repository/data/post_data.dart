import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/widgets/timeline_text.dart';

List<Post> listOfPosts = [

  Post(
      "P01",
      "Chó bỏ rơi bị thương mắt cần giải cứu gắp",
      "description",
      "Chó ",
      "17/10, Nguyễn Phúc Chu, P. 15, Q. Tân Bình, Phường 15, Tân Bình, Thành phố Hồ Chí Minh, Vietnam",
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
      Priority.High,
    false
  ),

  Post(
    "P00",
    "Cần giải cứu mèo bị thương chân",
    "description",
    "Mèo nhà",
    "87-79 Trần Bình Trọng, Phường 1, Gò Vấp, Thành phố Hồ Chí Minh, Vietnam",
    DateTime.now(),
    PostType.RequestPost,
      "https://sbly-web-prod-shareably.netdna-ssl.com/wp-content/uploads/2018/08/14083438/battle_cat_recovery_featured.jpg",
    "Male",
    "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
    <TimeLineText>[],
      userList[1],
    <User>[],
      null,
    <String>[],
    "Persian",
    Priority.Normal,
    false
  ),

  Post(
      "P00",
      "Cần giải cứu mèo bị thương chân",
      "description",
      "Mèo nhà",
      "87-79 Trần Bình Trọng, Phường 1, Gò Vấp, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.FinishedPost,
      "https://sbly-web-prod-shareably.netdna-ssl.com/wp-content/uploads/2018/08/14083438/battle_cat_recovery_featured.jpg",
      "Male",
      "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
      <TimeLineText>[],
      userList[1],
      <User>[],
      null,
      <String>[],
      "Persian",
      Priority.Normal,
      false
  ),




  Post(
      "P02",
      "Đã giải cứu mèo ở quận 2",
    "description",
    "Mèo nhà",
    "200 Hoàng Văn Thụ, Phường 9, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam",
    DateTime.now(),
    PostType.AdoptPost,
      "https://img.huffingtonpost.com/asset/5c3544842600003e058624ff.jpeg?ops=scalefit_630_noupscale",
    "Male",
    "6-8 months",
    ["2kg", "Đã được vaccine"],
    [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[2],
      <User>[userList[2], userList[3]],
    userList[2],
    <String>[],
    "COco",
      Priority.Normal,
    false
  ),

  Post(
      "P02",
      "Đã giải cứu mèo ở quận 3",
      "description",
      "Mèo nhà",
      "200 Hoàng Văn Thụ, Phường 9, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.AdoptPost,
      "https://img.huffingtonpost.com/asset/5c3544842600003e058624ff.jpeg?ops=scalefit_630_noupscale",
      "Male",
      "6-8 months",
      ["2kg", "Đã được vaccine"],
      [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[0],
      <User>[userList[3], userList[4]],
      userList[2],
      <String>[],
      "COco",
      Priority.Normal,
      false
  ),

  Post(
      "P03",
      "Mèo nhà bị lạc, lông vàng nhạt, xin gọi nếu tìm thấy",
      "Mèo nhà",
      "House cat",
      "70-72 Nguyễn Văn Trỗi, Phường 8, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.InRescuePost,
      "https://www.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg",
      "Male",
      "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
      [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[3],
      <User>[userList[2]],
      userList[2],
      <String>[],
    "Oxloot",
      Priority.Normal,
    true
  ),
];
