import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';

class PostBody extends StatelessWidget {
  final Post postModel;

  const PostBody({Key key, this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(postModel.imageString),
                  ),
                ),
              ),
            ),
            title: new Text(
              postModel.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Row(
              children: [
                new Text("subtitle"),
              ],
            ),
            trailing: Container(
              alignment: Alignment.centerRight,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: DateTimeTitle(postModel.timeCreated.toString())),
                  // Expanded(child: DateTimeTitle(date)),
                ],
              ),
            )),
        Container(
          height: 600,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 10,
                child: ImageSection(),
              ),
              Positioned(
                child: BodyCard(),
              )
            ],
          ),
        )
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
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "lib/assets/template_cat.png",
          width: 350,
        ),
      ),
    );
  }

  Widget BodyCard() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(2, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor   Lorem ipsum dolor sit amet, consectetur "),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: StatusBarFull(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: StatusBarFull(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: StatusBarMoreIndicator(5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget DateTimeTitle(String textData) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FittedBox(
          fit: BoxFit.cover,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                color: HexColor("#F6CC9F")),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textData,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ])),
    ]);
  }
}
