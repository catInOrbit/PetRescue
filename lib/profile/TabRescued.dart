import 'package:flutter/material.dart';
import 'package:petrescue/profile/chat_screen.dart';

class PageRescued extends StatefulWidget {
  @override
  _PageRescuedState createState() => _PageRescuedState();
}

class _PageRescuedState extends State<PageRescued> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              padding: EdgeInsets.fromLTRB(10.0,10,10,5),
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(
              //       width: 0.5
              //     )
              //   )
              // ),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),

                child:Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,10,0),
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: 100,
                        // width: 245,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Test Name",
                                style: TextStyle(
                                  color: Color(0xff4b8669),
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w900,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                                child: Text("Dog")),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Request Receive Day: 14/10/2020 5:30 PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                                maxLines: 1,
                              ),
                            ),

                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Saved Day: 15/10/2020 5:30PM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                                maxLines: 1,
                              ),
                            ),

                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Ha Noi"),
                                Icon(Icons.location_on)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
