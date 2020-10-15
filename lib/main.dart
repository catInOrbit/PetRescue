import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/SilverAppBar.dart';

void main() {
  runApp(MaterialApp(
    home: profildsab(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HexColor('#FFB9AC'),
        appBar: AppBar(
          backgroundColor: HexColor('#FFB9AC'),
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            SizedBox(
              width: 40.0,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                //margin: EdgeInsets.all(10),
                height: 230,
                width: MediaQuery.of(context).size.width * 0.7,
                // decoration: BoxDecoration(color: Colors.white),
                child: Container(
                  //margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Full Name",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.business_center,
                            size: 13,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Job", style: TextStyle(fontSize: 13)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("|"),
                          SizedBox(
                            width: 5,
                          ),
                          Text("ABC Center", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 13,
                          ),
                          Text("1234567890", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 13,
                          ),
                          Text("123 abc street",
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            size: 13,
                          ),
                          Text("asdfasfsadf@gmail.com",
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Website", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_car,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                // first tab bar view widget
                Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Bike',
                  ),
                ),
              ),
// second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                ],
            ))
          ],
        ),
      ),
    );
  }
}
