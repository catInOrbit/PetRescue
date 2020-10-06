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

    return Container(
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                "lib/assets/template_cat.png",
              ),
            ),
          ),

          UserInfo(),
        ],
      ),
    );

  }

  Widget BodyCard() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ImageSection(),

            ListTile(
                title: new Text(
                  postModel.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: new Row(
                  children: [
                    Text(postModel.petType,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
                trailing: Container(
                  alignment: Alignment.centerRight,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(postModel.gender,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      Text(postModel.ages,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                )),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 500,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: [

                              Stack(
                                children: [
                                  Container(
                                    width: 3,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: HexColor('#87A0E5').withOpacity(0.5),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                    ),
                                  ), //Decoration border left

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.1,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              height: 48,
                              width: 2,
                              decoration: BoxDecoration(
                                color: HexColor('#F56E98').withOpacity(0.5),
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                              ),
                            ), ////Decoration border left

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
                      mainAxisAlignment: MainAxisAlignment.start ,
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
    );
  }


  Widget UserInfo()
  {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black, spreadRadius: 5)
              ]
          ),
          child: CircleAvatar(backgroundImage: NetworkImage(postModel.imageString), radius: 25,
          )),
      title: Text("Placeholder", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
      subtitle: Row(
        children: [
          Text("Location", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 15)),
          SizedBox(width: 10,),
          Text("Miles away", style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 13)),
        ],
      ),
    );
  }



  Widget DateTimeTitle(String textData) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(26)),
              color: HexColor("#F6CC9F")),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              textData,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
