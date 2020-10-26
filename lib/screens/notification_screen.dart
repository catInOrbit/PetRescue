import 'package:flutter/material.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: PetRescueTheme.lightPink,
          appBar: AppBar(
            backgroundColor: PetRescueTheme.darkGreen,
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
            children: [
              Center(
                child: Column(
                  children: [
                    NotificationWidget(),
                    NotificationWidget(),

                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    NotificationWidget()
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
