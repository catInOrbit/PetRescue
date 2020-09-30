import 'package:petrescue/models/post_model.dart';

List<Post> postContent = List.generate(5, (index) {
  return Post("Title 1", "Description 1", "Location ", DateTime.now(),
      PostType.InfoPost);
});
