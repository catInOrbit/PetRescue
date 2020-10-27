import 'package:flutter/material.dart';
import 'package:petrescue/notification/Colors.dart';
import 'package:petrescue/notification/chat_widget.dart';
import 'package:petrescue/notification/notification_widget.dart';
import 'package:petrescue/petrescue_theme.dart';

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
          backgroundColor: PetRescueTheme.darkGreen,
          //  elevation: 0,
          title: Text("Messengers"),
          centerTitle: false,
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
          children: <Widget>[
            // Center(
            //   child: Column(
            //     children: [ChatWidget()],
            //   ),
            // ),
            ChatWidget(),
            Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Center(
                      child: NotifiSecond(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
