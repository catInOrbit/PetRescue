import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/widgets/timeline_text.dart';

List<Post> listOfPosts = [

  Post(
      "P01",
      "Chó bỏ rơi bị thương mắt cần giải cứu gắp",
      "Tìm thấy mèo con bị thất lạc gần đường XYZ, mèo bị thương ở chân và cần cấp cứu gắp, nhờ trung tâm gần nhất mau đến cứu",
      "Chó ",
      "17/10, Nguyễn Phúc Chu, P. 15, Q. Tân Bình, Phường 15, Tân Bình, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.RequestPost,
      "https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-g70644hiocchitapae654vgia4-20161227061350.Medi.jpeg",
      "Male",
      "6-8 months",
      ["Tìm thấy chó bị bỏ hoang ở góc đường", "Chó bị chấn thương nặng ở mắt, đi cà nhắt, chảy máu nhiều ở mặt", "Mèo có đeo vòng cổ, có thể đã có chủ"],
      <TimeLineText>[],
      userList[0],
      <User>[],
      null,
      <String>[],
      "Persian",
      Priority.High,
    false,
     ["Tai nạn", "Thất lạc"]
  ),

  Post(
    "P00",
    "Cần giải cứu mèo bị thương chân",
      "Tìm thấy mèo con bị thất lạc gần đường XYZ, mèo bị thương ở chân và cần cấp cứu gắp, nhờ trung tâm gần nhất mau đến cứu",
    "Mèo nhà",
    "87-79 Trần Bình Trọng, Phường 1, Gò Vấp, Thành phố Hồ Chí Minh, Vietnam",
    DateTime.now(),
    PostType.RequestPost,
      "https://sbly-web-prod-shareably.netdna-ssl.com/wp-content/uploads/2018/08/14083438/battle_cat_recovery_featured.jpg",
    "Male",
    "6-8 months",
      ["Bỏ hoang", "Mèo bị thương chân đi cà nhắt", " Mắt trái không mở được"],
    <TimeLineText>[],
      userList[1],
    <User>[],
      null,
    <String>[],
    "Persian",
    Priority.Normal,
    false,
    ["Tai nạn", "Thất lạc"]

  ),

  Post(
      "P00",
      "Chó bị thương ở quận 2 cần cứu gấp",
      "Tìm thấy mèo con bị thất lạc gần đường XYZ, mèo bị thương ở chân và cần cấp cứu gắp, nhờ trung tâm gần nhất mau đến cứu",
      "Chó",
      "Lương Định Của, P. Bình An, Quận 2, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.RequestPost,
      "https://i.pinimg.com/originals/b7/fc/8d/b7fc8df5d49d22cf5bde171e5f45df2e.jpg",
      "Male",
      "6-8 months",
      [ "Chó bị thương ở bụng không đi được",],
      <TimeLineText>[],
      userList[4],
      <User>[],
      null,
      <String>[],
      "Persian",
      Priority.Normal,
      false,
    [" Tai nạn"]
  ),
  Post(
      "P00",
      "Cần giải cứu mèo bị thương chân",
      "Đã giải cứu mèo và chăm sóc y tế",
      "Mèo nhà",
      "87-79 Trần Bình Trọng, Phường 1, Gò Vấp, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.FinishedPost,
      "https://sbly-web-prod-shareably.netdna-ssl.com/wp-content/uploads/2018/08/14083438/battle_cat_recovery_featured.jpg",
      "Male",
      "6-8 months",
      ["Bỏ hoang", "Chấn thương", "Mất chủ"],
      <TimeLineText>[],
      userList[2],
      <User>[],
      null,
      <String>[],
      "Persian",
      Priority.Normal,
      false,
    ["Meo"]
  ),


  Post(
      "P02",
      "Hãy nhận nuôi em Xù",
    "Hiện được 3 năm 3 tháng tuổi, Cái, Lông trắng",
    "Chó",
    "200 Hoàng Văn Thụ, Phường 9, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam",
    DateTime.now(),
    PostType.AdoptPost,
      "https://img.huffingtonpost.com/asset/5c3544842600003e058624ff.jpeg?ops=scalefit_630_noupscale",
    "Male",
    "6-8 months",
    ["2kg", "Khỏe mạnh", "Đã được vaccine"],
    [TimeLineText(postTile:  "Trung tâm ABC đã đến vị trí",timePosted: "10 phút trước",), TimeLineText(postTile:  "Trung tâm ABC đang kiểm tra y tế",timePosted: "10 phút trước",)],
      userList[2],
      <User>[userList[2], userList[3]],
    userList[2],
    <String>[],
    "Chó Alaska",
      Priority.Normal,
    false,
    ["Chó", "Đực"]
  ),

  Post(
      "P02",
      "Lucky",
      "Hiện được 5 năm tuổi, cái, lông trắng, dà",
      "Mèo",
      "200 Hoàng Văn Thụ, Phường 9, Phú Nhuận, Thành phố Hồ Chí Minh, Vietnam",
      DateTime.now(),
      PostType.AdoptPost,
      "https://img.huffingtonpost.com/asset/5c3544842600003e058624ff.jpeg?ops=scalefit_630_noupscale",
      "Female",
      "6-8 months",
      ["ăn được cơm", "Đã được vaccine"],
      [TimeLineText(postTile:  "Trung tâm ABC đã đến vị trí",timePosted: "10 phút trước",), TimeLineText(postTile:  "Trung tâm ABC đang kiểm tra y tế",timePosted: "10 phút trước",)],
      userList[2],
      <User>[userList[3], userList[4]],
      userList[2],
      <String>[],
      "Mèo ba tư",
      Priority.Normal,
      false,
      ["Mèo", "Cái"]
  ),

  Post(
      "P03",
      "Mèo nhà bị lạc, lông vàng nhạt, xin gọi nếu tìm thấy",
      "Mèo",
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
    true,
      ["Mèo"]
  ),
];
