import 'package:petrescue/models/status_data.dart';

enum PostType { InfoPost, UpdatedPost, CriticalPost }

class Post {
  String title, description, location, imageString;
  DateTime timeCreated;
  PostType postType;
  List<Statuses> statuses = [Statuses.Abandoned, Statuses.Injured];

  Post(title, description, location, timeCreated, postType, imageString) {
    this.title = title;
    this.description = description;
    this.location = location;
    this.timeCreated = timeCreated;
    this.postType = postType;
    this.imageString = imageString;
  }
}
