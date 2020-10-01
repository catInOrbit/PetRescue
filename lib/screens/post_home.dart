import 'package:flutter/material.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_event.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/models/status_data.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/post_card.dart';

class PostHome extends StatefulWidget {
  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  final _bloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PostBlocProvider(
            bloc: this._bloc,
            child: DropdownButton<Statuses>(
              onChanged: (Statuses status) =>
                  _bloc.inputSink.add(PostEvent("true", status.toString())),
              items: Statuses.values.map((Statuses status) {
                return DropdownMenuItem<Statuses>(
                  value: status,
                  child: Text(status.toString()),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder<PostState>(
            stream: _bloc.outputStream,
            builder: (context, AsyncSnapshot<PostState> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: snapshot.data.numOfPost,
                      itemBuilder: (BuildContext context, int index) {
                        return PostBody(
                            postModel: snapshot.data.visiblePostTree[index]);
                      }),
                );
              }

              return Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: listOfPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostBody(postModel: listOfPosts[index]);
                    }),
              );
            },
          ),
        ],
      ),
    );

    @override
    void dispose() {
      this._bloc.dispose();
      super.dispose();
    }
  }
}
