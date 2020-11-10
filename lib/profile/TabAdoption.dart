

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/timeline.dart';

class PageAdoption extends StatefulWidget {
  @override
  _PageAdoptionState createState() => _PageAdoptionState();
}


class _PageAdoptionState extends State<PageAdoption> {
  List<Widget> awaitConfirmationPost = [
    PetAdoption4(), PetAdoption2(), PetAdoptionWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text( currentUser.isVerifyRescueCenter == true ? "Tìm nhà cho các bé:" :  "Danh sách chờ xác nhận nhận nuôi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    )),
                SizedBox(height: 10,),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: awaitConfirmationPost.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 30,),
                                awaitConfirmationPost[index]
                              ],
                            ),
                          ],
                        );
                  },),
                ),

              ],
            ),

            SizedBox(height: 30,),

            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text( currentUser.isVerifyRescueCenter == true ? "Tìm nhà cho các bé:" :  "Bạn đang nhận nuôi 4 bạn thú cưng:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    )),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PetAdoptionWidget(),
                    SizedBox(
                      width: 20,
                    ),
                    PetAdoption4(),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  PetAdoption2(),
                  SizedBox(
                    width: 20,
                  ),
                  PetAdoption3(),
                ])
              ],
            )


          ],
        ),
      ),
    );
  }
}

class PetAdoptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimelineBottomCard(postModel: listOfPosts[2],),));
      },
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/Cat2.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Miu Miu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cái",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Mèo con. Lông vàng trắng",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "9 tháng tuổi",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Được trung tâm nuôi 2 tháng.",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "TP.HCM",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PetAdoption2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimelineBottomCard(postModel: listOfPosts[2],),));

      },
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://thumbs-prod.si-cdn.com/omtxDUbVWafbhOTsDFJnOW3gFiw=/fit-in/1600x0/filters:focal(2135x711:2136x712)/https://public-media.si-cdn.com/filer/77/8b/778bb007-831c-4c81-a475-05487cd7b53b/adult-brown-labrador-retriever-1010121_3.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bưởi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Đực",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Chó nhà lông vàng, tai nhọn, chân dài.",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "1 tuổi rưỡi",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Được trung tâm nuôi 1 năm.",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "TP.HCM",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PetAdoption3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimelineBottomCard(postModel: listOfPosts[2],),));
      },
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://cdn.kinsights.com/cache/9f/52/9f52c9c87d064eefaa07cead85eb82fe.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tin Tin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Đực",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Giống chó cỏ lai với Bắc Kinh",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "5 tuổi rưỡi",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Được trung tâm nuôi nửa năm.",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "TP.HCM",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PetAdoption4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimelineBottomCard(postModel: listOfPosts[2],),));
      },
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/originals/9e/e1/15/9ee1158724d8580cb47e2e9d44b96d41.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bun",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cái",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Giống mèo Anh lông ngắn",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "1 năm 5 tháng tuổi",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Được trung tâm nuôi 7 tháng.",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "TP.HCM",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
