import 'package:petrescue/bloc/post/post_event.dart';
import 'package:petrescue/bloc/post/post_state.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  final PostState _state = PostState();
  //TODO: Broadcast
  Stream<List<Post>> _outputPostStream = Stream.empty(); //main output stream
  Stream<List<Post>> get posts => _outputPostStream;

  BehaviorSubject<String> _inputStream = BehaviorSubject<String>();
  Sink<String> get inputSink => _inputStream;

  PostBloc() {
    void onSortOptionChanged(PostEvent _event) 
    {
      String statusTag = _inputStream.value;
      if (_event.hasSortRquest) 
      {
          List<Post> newLis = [];
          postContent.forEach((element) { 
            if(element.statuses.contains()
            {
              
            }

          });
      }
     
        
    }
  }
}
