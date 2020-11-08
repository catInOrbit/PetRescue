import 'package:flutter/material.dart';
import 'package:petrescue/petrescue_theme.dart';

class ListAdoptionRequest extends StatefulWidget {
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
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            //color: Colors.black26,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: CircleAvatar(
                    radius: 25,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nguyễn Đỗ Cát Tường",
                            style: TextStyle(
                              color: Color(0xff4b8669),
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 1,
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.message),
                          ),
                          SizedBox(height: 3,),
                          Text("Liên lạc")
                        ],
                      ),
                      SizedBox(width: 8,),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.check_circle),
                          ),
                          SizedBox(height: 3,),
                          Text("Chấp thuận")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
           // color: Colors.black26,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: CircleAvatar(
                    radius: 25,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nguyễn Phan Chu Vi",
                            style: TextStyle(
                              color: Color(0xff4b8669),
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 1,
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.message),
                          ),
                          SizedBox(height: 3,),
                          Text("Liên lạc")
                        ],
                      ),
                      SizedBox(width: 8,),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.check_circle),
                          ),
                          SizedBox(height: 3,),
                          Text("Chấp thuận")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
