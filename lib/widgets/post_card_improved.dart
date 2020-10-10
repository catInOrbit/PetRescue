import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';

class PostBody extends StatelessWidget {
  final Post postModel;

  const PostBody({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        BodyCard(),
      ],
    );
  }

  Widget StatusBarFull() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: FittedBox(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.redAccent),
          child: Text(
            "Status Bar",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget StatusBarMoreIndicator(int numOfStatus) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: FittedBox(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 20,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
          child: Text(
            "3+",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget ImageSection() {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.grey[800].withAlpha(128)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Image.network(
            "https://icatcare.org/app/uploads/2018/06/Layer-1704-1920x840.jpg",
            fit: BoxFit.fitWidth,
          ),
        ),
        UserInfo(),
      ],
    );
  }

  Widget BodyCard() {
    return Card(
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ImageSection(),
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Column(
              children: [
                ListTile(
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  title: Row(
                    children: [
                      new Text(
                        postModel.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(postModel.gender,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(postModel.ages,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15))
                    ],
                  ),
                  subtitle: Text(postModel.petType,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                DateTimeTitle("12dawdwa"),
                                DateTimeTitle("12dawdwa"),
                                DateTimeTitle("dead"),
                                DateTimeTitle("12dawd"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Flat Button",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            FlatButton(
                              color: Colors.blueGrey,
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.grey,
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Flat Button",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget UserInfo() {
    return ListTile(
      //visualDensity: VisualDensity.compact,
      //contentPadding: EdgeInsets.only(top: 10),
      leading: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black.withAlpha(40),
                spreadRadius: 1)
          ]),
          child: CircleAvatar(
            backgroundImage: NetworkImage(postModel.imageString),
            radius: 20,
          )),
      title: Text(
        "user.name",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: [
          Text("location",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15)),
          SizedBox(
            width: 5,
          ),
          Text("mi. away",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 13)),
        ],
      ),
    );
  }

  Widget DateTimeTitle(String textData) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                color: HexColor("#F6CC9F")),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              child: Text(
                textData,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
