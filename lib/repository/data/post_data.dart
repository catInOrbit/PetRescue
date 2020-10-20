import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/user_list.dart';
import 'package:petrescue/widgets/timeline_text.dart';

List<Post> listOfPosts = [
  Post(
    "Title 1",
    "description",
    "House cat",
    "Location ",
    DateTime.now(),
    PostType.RequestPost,
    "https://avatars2.githubusercontent.com/u/18541062?s=400&u=8615e79647fcff133862cd6c832cacce54b484a1&v=4",
    "Male",
    "6-8 months",
     [Statuses.Abandoned, Statuses.Injured],
    <TimeLineText>[],
      userList[0]
  ),

  Post(
    "Title 1",
    "description",
    "House cat",
    "Location ",
    DateTime.now(),
    PostType.AdoptPost,
    "https://avatars2.githubusercontent.com/u/18541062?s=400&u=8615e79647fcff133862cd6c832cacce54b484a1&v=4",
    "Male",
    "6-8 months",
    [Statuses.Abandoned, Statuses.Injured, Statuses.LostOwner],
    [TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",), TimeLineText(postTile:  "XYZ center rescued",timePosted: "10 mins ago",)],
      userList[1]
  ),

];
