import 'package:flutter/material.dart';

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
            onTap: (){},
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
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mao Trach Dong",
                                style: TextStyle(
                                  color: Color(0xff4b8669),
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                                child: Text("Dog")),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Saved Day: 15/10/2020",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("Ha Noi"),
                                  Icon(Icons.location_on)
                                ],
                              ),
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
