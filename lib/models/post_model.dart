enum PostType
{
  InfoPost, UpdatedPost,CriticalPost
}

class Post
{
  String title, description;
  DateTime timeCreated;
  PostType postType;

  Post(this.title, this.description, this.timeCreated, this.postType);
}