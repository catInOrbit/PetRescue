import 'package:petrescue/models/post_model.dart';

class User
{
  final List<Post> timelinePosts;
  final String fullName, job, centerName, phoneNumber, address, gmail, website, imageURL;
  int id;
  bool isVerifyRescueCenter = false, isOnline;

  User(
      this.timelinePosts,
      this.id,
      this.fullName,
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