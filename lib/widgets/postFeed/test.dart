import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/timeline.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:petrescue/bloc/app_general/global.dart' as global;
import 'package:petrescue/widgets/detail_model_bottom.dart';

class PostHomePage extends StatelessWidget {
  final Post postModel;

  const PostHomePage({Key key, @required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DetailCard()));
            },
            child: Container(
              width: 380,
              child: Stack(

                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 380,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://ichef.bbci.co.uk/news/976/cpsprodpb/12A9B/production/_111434467_gettyimages-1143489763.jpg")),
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x00ffffff), Colors.black],
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 11,
                          bottom: 42,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 181,
                              height: 44,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: 37,
                                      height: 37,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 92),
                            SizedBox(
                              width: 81,
                              height: 24,
                              child: Text(
                                "25min ago",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffebf3fa),
                                  fontSize: 11,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 120,
                    child: Align(
                      alignment: Alignment.center,
                      //NOTE: Main Card BOdy
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 500,
                                height: 144,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  height: 29,
                                                  child: Text(
                                                    "Rescued Kitten",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 13),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 57,
                                              height: 15,
                                              child: Text(
                                                "House cat",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              "Kitten was found stranded in a drain. I have brought it home and the kitten is being taken....",
                                              style: TextStyle(
                                                color: Color(0xff555555),
                                                fontSize: 16,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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

// Widget BodyCard() {
//   return Card(
//     borderOnForeground: true,
//     clipBehavior: Clip.hardEdge,
//     elevation: 5,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(bottom: 13),
//           child: Column(
//             children: [
//               ListTile(
//                 visualDensity: VisualDensity.compact,
//                 dense: true,
//                 title: Row(
//                   children: [
//                     new Text(
//                       postModel.title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     Text(postModel.gender,
//                         style: TextStyle(
//                             fontWeight: FontWeight.normal, fontSize: 15)),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(postModel.ages,
//                         style: TextStyle(
//                             fontWeight: FontWeight.normal, fontSize: 15))
//                   ],
//                 ),
//                 subtitle: Text(postModel.petType,
//                     style: TextStyle(
//                         fontWeight: FontWeight.normal, fontSize: 14)),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     flex: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Wrap(
//                             direction: Axis.horizontal,
//                             children: <Widget>[
//                               DateTimeTitle("12dawdwa"),
//                               DateTimeTitle("12dawdwa"),
//                               DateTimeTitle("dead"),
//                               DateTimeTitle("12dawd"),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: IntrinsicHeight(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           FlatButton(
//                             color: Colors.blue,
//                             textColor: Colors.white,
//                             disabledColor: Colors.grey,
//                             disabledTextColor: Colors.black,
//                             padding: EdgeInsets.all(8.0),
//                             splashColor: Colors.blueAccent,
//                             onPressed: () {
//                               /*...*/
//                             },
//                             child: Text(
//                               "Flat Button",
//                               style: TextStyle(fontSize: 20.0),
//                             ),
//                           ),
//                           FlatButton(
//                             color: Colors.blueGrey,
//                             textColor: Colors.black,
//                             disabledColor: Colors.grey,
//                             disabledTextColor: Colors.black,
//                             padding: EdgeInsets.all(8.0),
//                             splashColor: Colors.grey,
//                             onPressed: () {
//                               /*...*/
//                             },
//                             child: Text(
//                               "Flat Button",
//                               style: TextStyle(fontSize: 20.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
