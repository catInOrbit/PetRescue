import 'package:petrescue/models/post_model.dart';

class PostEvent {
  bool _isPrioritized = false, _hasSortRquest = false, _hasDeleteRequest = false, _acceptedRequest = false;
  Post _affectedPost;

  Post get affectedPost => _affectedPost;

  set affectedPost(Post value) {
    _affectedPost = value;
  }

  get acceptedRequest => _acceptedRequest;

  set acceptedRequest(value) {
    _acceptedRequest = value;
  }

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
