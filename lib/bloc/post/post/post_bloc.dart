import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';

class PostBloc {
  final PostState _state = PostState();
  final _inputEventStreamController = StreamController<PostEvent>();

  final _outputStateStreamController = StreamController<PostState>.broadcast();

  StreamSink<PostEvent> get inputSink => _inputEventStreamController.sink;
  Stream<PostState> get outputStream => _outputStateStreamController.stream;

  PostBloc() {
    void onOptionDetected(PostEvent _event) {
      String statusTag = _event.selectedSort;

      if (_event.hasSortRquest) {
        List<Post> newList = [];
        listOfPosts.forEach((element) {
          if (element.statuses.toString() == statusTag) {
            _state.visiblePostTree.add(element);
          }
        });
      }

      else if(_event.hasDeleteRequest)
      {
        _state.visiblePostTree.remove(_event.selectedPost);
      }

      _outputStateStreamController.sink.add(_state);
    }

    _inputEventStreamController.stream.listen(onOptionDetected);
  }

  void dispose() {
    inputSink.close();
  }
}

class PostBlocProvider extends InheritedWidget {
  final PostBloc bloc;
  final Widget child;

  PostBlocProvider({Key key, @required this.bloc, this.child})
      : super(key: key, child: child);

  static PostBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PostBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}
final bloc = PostBloc();