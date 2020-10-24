import 'package:petrescue/models/post_model.dart';

class User
{
  final List<Post> timelinePosts;
  final String id, fullNanme, job, centerName, phoneNumber, address, gmail, website, imageURL;
  bool isVerifyRescueCenter, isOnline;

  User(
      this.timelinePosts,
      this.id,
      this.fullNanme,
      this.job,
      this.centerName,
      this.phoneNumber,
      this.address,
      this.gmail,
      this.website,
      this.imageURL,
      this.isVerifyRescueCenter,
      this.isOnline);
}