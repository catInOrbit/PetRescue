import 'package:petrescue/models/post_model.dart';

class PostEvent {
  bool _isPrioritized, _hasSortRquest, _hasDeleteRequest;
  String selectedSort = "";
  Post _selectedPost;

  get selectedPost => _selectedPost;

  set selectedPost(Post value) {
    _selectedPost = value;
  }

  bool get isPrioritized => _isPrioritized;

  set isPrioritized(bool value) {
    _isPrioritized = value;
  }

  get hasSortRquest => _hasSortRquest;

  get hasDeleteRequest => _hasDeleteRequest;

  set hasDeleteRequest(value) {
    _hasDeleteRequest = value;
  }

  set hasSortRquest(value) {
    _hasSortRquest = value;
  }
}
