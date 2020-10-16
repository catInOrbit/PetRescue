import 'package:petrescue/models/post_model.dart';

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
     [Statuses.Abandoned, Statuses.Injured]
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
    [Statuses.Abandoned, Statuses.Injured, Statuses.LostOwner]
  ),

];
