import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:petrescue/Colors.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: GestureDetector(
        onTap: (){
          print("Container clicked");
        },
        child: Container(
        //  color: HexColor('FFB9AC'),
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0,10,10,0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,10,0),
                  child: CircleAvatar(
                    radius: 30,
                  ),
                ),
                Container(
                  height: 100,
                  width: 245,
                 // color: Colors.red,
                  child: Column(

                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Mao Nguyen Trach Tam",
                          style: TextStyle(
                            color: Color(0xff4b8669),
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text(
                        "Konnichiwa, minasan, ana ta wa ikidesite, motte, itte ,ya, soresore, minato, hontto, taichohi, benkyo si te, madama",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Container(
//                color: Colors.black,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                          "10/24/2020 ",style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                      )
                      ),
                    ),
                  ),
                )
              ],
            ),
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
  }
}
