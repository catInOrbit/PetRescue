import 'package:petrescue/models/status_data.dart';

enum PostType { InfoPost, UpdatedPost, CriticalPost, RequestPost, AdoptPost}

class Post {
  String title, petType, gender, ages, description, location, imageString;
  DateTime timeCreated;
  PostType postType;
  List<Statuses> statuses = [];

  Post(
    title,
    description,
    petType,
    location,
    timeCreated,
    postType,
    imageString,
    gender,
    ages,
      statuses
  ) {
    this.title = title;
    this.petType = petType;
    this.description = description;
    this.location = location;
    this.timeCreated = timeCreated;
    this.postType = postType;
    this.imageString = imageString;
    this.gender = gender;
    this.ages = ages;
    this.statuses = statuses;
  }
}

enum Statuses { Injured, Abandoned, LostOwner }
