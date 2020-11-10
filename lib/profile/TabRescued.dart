import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/petrescue_theme.dart';
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
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text( currentUser.isVerifyRescueCenter == true ? "Tin cứu hộ tiếp nhận:"  :   "Bạn đã đăng 3 tin cần cứu hộ:" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              )),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
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

                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(5,0,10,0),
                      //   child: CircleAvatar(
                      //     radius: 50,
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 245,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 20,
                               // width: 50,
                                color: PetRescueTheme.lime,
                                child: Center(
                                  child: Text("Đang cứu hộ",style: TextStyle(
                                    color: Colors.white
                                  ),),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Giải cứu 1 chú chó gần bệnh viện Quận 2",
                                  style: TextStyle  (
                                    color: Color(0xff4b8669),
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                  child: Text("Tình trạng: chấn thương chân")),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Ngày nhận đơn: 14/10/2020 5:30 PM",
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
                                  "Ngày cứu: 15/10/2020 5:30PM",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  Text("TP.HCM"),

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
            ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
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

                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(5,0,10,0),
                      //   child: CircleAvatar(
                      //     radius: 50,
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 245,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 20,
                                // width: 50,
                                color:Colors.grey,
                                child: Center(
                                  child: Text("Đã an toàn",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Mèo con bị bỏ rơi gần cầu Sài Gòn ",
                                  style: TextStyle(
                                    color: Color(0xff4b8669),
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Tình trạng: suy dinh dưỡng")),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Ngày nhận đơn: 14/10/2020 5:30 PM",
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
                                  "Ngày cứu: 15/10/2020 5:30PM",
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  Text("TP.HCM"),

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
            ),
          ),
        ],
      ),
    );
  }
}
