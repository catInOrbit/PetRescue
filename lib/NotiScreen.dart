import 'package:flutter/material.dart';

class NotiScreen extends StatefulWidget {
  @override
  _NotiScreenState createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  TabController tabController;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   tabController = TabController(vsync: this, length: 2);
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Messengers"),
          centerTitle: true,
          bottom: TabBar(
            // isScrollable: true,
            //controller: tabController,
            tabs: <Widget>[
              Tab(text: "Chats"),
              Tab(
                text: 'Notifications',
              ),
            ],
          ),
        ),
        body: TabBarView(

        ),
      ),
    );
  }
}
