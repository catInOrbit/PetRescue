import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/notification_screen.dart';
import 'package:petrescue/widgets/post_card.dart';

class RequestPostPage extends StatefulWidget {
  final List<Post> listOfPost;
  final String sortType;
  final PostBloc postBloc;

  const RequestPostPage({Key key, @required this.listOfPost, this.sortType, this.postBloc}) : super(key: key);

  @override
  _RequestPostPageState createState() => _RequestPostPageState();
}

class _RequestPostPageState extends State<RequestPostPage> {
  @override
  Widget build(BuildContext context) {
    PostState state = PostState();
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert, color: Colors.black,),
            tooltip: "View notification",
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
            },
          )
        ],
      ),
      body: StreamBuilder(
        initialData: state,
        stream: bloc.outputStream,
        builder: (context, snapshot) {
          state = snapshot.data;
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              itemCount: sortedList(state.visiblePostTree).length,
              itemBuilder: (BuildContext buildContext, int i) {
                return PostCard( postModel: sortedList(state.visiblePostTree)[i]);
              });
        },

      ),
    );
  }

  List<Post> sortedList(List<Post> listOfPost)
  {
    if(widget.sortType == PostType.RequestPost.toString().split('.').last)
      return listOfPost.where((element) => element.postType.toString().split('.').last == widget.sortType).toList();

    else if(widget.sortType == PostType.AdoptPost.toString().split('.').last)
      return listOfPost.where((element) => element.postType.toString().split('.').last == widget.sortType).toList();
  }
}
