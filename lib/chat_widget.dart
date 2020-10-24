import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/chat_screen.dart';
import 'package:petrescue/models/message_model.dart';

// class ChatWidget extends StatefulWidget {
//   @override
//   _ChatWidgetState createState() => _ChatWidgetState();
// }
//
// class _ChatWidgetState extends State<ChatWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       child: GestureDetector(
//         onTap: (){
//           print("Container clicked");
//         },
//         child: Container(
//         //  color: HexColor('FFB9AC'),
//           width: MediaQuery.of(context).size.width,
//           height: 120,
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(width: 0.5)
//             )
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0,0,10,0),
//                   child: CircleAvatar(
//                     radius: 30,
//                   ),
//                 ),
//                 Container(
//                   height: 100,
//                   width: 245,
//                  // color: Colors.red,
//                   child: Column(
//
//                     children: <Widget>[
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "Mao Nguyen Trach Tam",
//                           style: TextStyle(
//                             color: Color(0xff4b8669),
//                             fontSize: 20,
//                             fontFamily: "Roboto",
//                             fontWeight: FontWeight.w900,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Konnichiwa, minasan, ana ta wa ikidesite, motte, itte ,ya, soresore, minato, hontto, taichohi, benkyo si te, madama",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontFamily: "Roboto",
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
// //                color: Colors.black,
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                           "10/24/2020 ",style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black45
//                       )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       actionPane: SlidableDrawerActionPane(),
//       actionExtentRatio: 0.25,
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           caption: 'Delete',
//           color: Colors.red,
//           icon: Icons.delete,
//           //onTap: () => _showSnackBar('Delete'),
//         ),
//       ],
//     );
//   }
// }

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //itemExtent: 250.0,
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return Slidable(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      user: chat.sender,
                    )
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: chat.unread ? BoxDecoration(
                        //  shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ])
                          : BoxDecoration(
                          shape: BoxShape.circle,
                          // border: Border.all(
                          //     width: 2, color: Theme.of(context).primaryColor),
                          // borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ])
                      ,
                      child: CircleAvatar(
                        radius: 35,
                        //backgroundImage: Image.asset(''),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      chat.sender.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    chat.sender.isOnline ?
                                    Container(
                                      margin: const EdgeInsets.only(left:  5),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor),
                                    )
                                        : Container(child: null,)
                                  ],
                                ),

                                Text(
                                  chat.time,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black45),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                //onTap: () => _showSnackBar('Delete'),
              ),
            ],
          );
        });
  }
}

