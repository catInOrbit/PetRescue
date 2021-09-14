import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/notification/Colors.dart';
import 'package:petrescue/notification/chat_widget.dart';
import 'package:petrescue/notification/notification_widget.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,

        endDrawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 120,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: HexColor('#FFB9AC'),
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(currentUser.imageURL),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            currentUser.fullName,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    )),
              ),
              //CustomListSideMenuBar(Icons.logout, 'Sign out', widget()),
              CustomListSideMenuBar(
                  Icons.group,
                  'Danh sách trung tâm',
                      () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CentersScreen()))
                  }),
              CustomListSideMenuBar(Icons.settings, 'Cài đặt', () => {}),
              CustomListSideMenuBar(
                Icons.info,
                'Giới thiệu',
                    () {
                  //close drawer
                  Navigator.pop(context, false);
                  //open another screen
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AboutScreen()));
                },
              ),
              CustomListSideMenuBar(Icons.phone_android, 'Đánh giá', () => {}),
              CustomListSideMenuBar(Icons.help_outline, 'Trợ giúp', () {
                //close drawer
                Navigator.pop(context, false);

                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HelpScreen()));
              }),

              CustomListSideMenuBar(Icons.remove_circle_outline, 'Đăng xuất ',
                      () {
                    //close drawer
                    Navigator.pop(context, false);
                  })
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              tooltip: "View notification",
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
          backgroundColor: PetRescueTheme.darkGreen,
          //  elevation: 0,
          title: Text("Tin nhắn"),
          centerTitle: false,
          bottom: TabBar(
            // isScrollable: true,
            //controller: tabController,
            tabs: <Widget>[
              Tab(text: "Trò chuyện"),
              Tab(
                text: 'Thông báo',
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
