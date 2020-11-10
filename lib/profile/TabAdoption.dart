

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';

class PageAdoption extends StatefulWidget {
  @override
  _PageAdoptionState createState() => _PageAdoptionState();
}

class _PageAdoptionState extends State<PageAdoption> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
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
        ),
      ),
    );
  }
}

class PetAdoptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
      onTap: () {},
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://www.ddfl.org/wp-content/uploads/2019/06/Remy.jpg'), fit: BoxFit.cover),
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
      onTap: () {},
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
      onTap: () {},
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/proxy/6sry914FVjugl-ZhVItwLsT2BosIS8pvduX558WXS8r9oUcmU07AjQc_SwQxWI1fkwgTDNr43_dvG9ZGtx6YNEclmca-RHsVL7YH3BSzRgXVsaIOkmurIerBsP7y9rJZ9c4eYRm6at7yaGYYtJC6Y3T4S4YH'), fit: BoxFit.cover),
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
