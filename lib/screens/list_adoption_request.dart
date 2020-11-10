import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/widgets/common.dart';


class ListAdoptionRequest extends StatefulWidget {
  final Post postModel;

  const ListAdoptionRequest({Key key, this.postModel}) : super(key: key);
  @override
  _ListAdoptionRequestState createState() => _ListAdoptionRequestState();
}

class _ListAdoptionRequestState extends State<ListAdoptionRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách yêu cầu nhận nuôi"),
        backgroundColor: PetRescueTheme.darkGreen,
      ),
      body: Column(
        children: buildAdopterRow(widget.postModel, context)
      ),
    );
  }

}
