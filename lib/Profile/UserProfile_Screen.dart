import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/EditScreen.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/profile/TabAdoption.dart';
import 'package:petrescue/profile/TabRescued.dart';
import 'package:petrescue/profile/TabTimelines.dart';
import 'package:petrescue/profile/chat_screen.dart';
import 'package:petrescue/models/message_model.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';
import 'package:petrescue/widgets/progress.dart';


class UserProfileScreen extends StatefulWidget {
  final Post postModel;

  const UserProfileScreen({Key key, this.postModel}) : super(key: key);
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  final Message chat = chats[0];

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    //_scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    tabController.dispose();
    //_scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(

      endDrawerEnableOpenDragGesture: false,
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Full Name',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  )),
            ),
            //CustomListSideMenuBar(Icons.logout, 'Sign out', widget()),
            CustomListSideMenuBar(
                Icons.group,
                'Centers',
                    () =>
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CentersScreen()))
                }),
            CustomListSideMenuBar(Icons.settings, 'Settings', () => {}),
            CustomListSideMenuBar(
              Icons.settings,
              'About',
                  () {
                //close drawer
                Navigator.pop(context, false);
                //open another screen
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutScreen()));
              },
            ),
            CustomListSideMenuBar(Icons.settings, 'Give feedback', () => {}),
            CustomListSideMenuBar(Icons.help_outline, 'Help', () {
              //close drawer
              Navigator.pop(context, false);

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HelpScreen()));
            }),

            CustomListSideMenuBar(Icons.settings, 'Sign out', () {
              //close drawer
              Navigator.pop(context, false);
            })
          ],
        ),
      ),
      key: _scaffoldKey,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                snap: false,
                elevation: 0,
                expandedHeight: 330,
                backgroundColor: HexColor('#FFB9AC'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context, false),
                ),
                title: Text(
                  "Tài khoản",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  SizedBox(
                    width: 40.0,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditScreen()),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        MediaQuery
                            .of(context)
                            .padding
                            .top,
                        0,
                        MediaQuery
                            .of(context)
                            .padding
                            .bottom),
                    height: 230,
                    //color: Colors.white,
                    child: Center(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(currentUser.imageURL),
                            radius: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Mao Trạch Tâm",
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
                                Icons.phone,
                                size: 13,
                              ),
                              Text("0123456789",
                                  style: TextStyle(fontSize: 13)),
                            ],
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Icon(
                          //       Icons.location_on,
                          //       size: 13,
                          //     ),
                          //     Text("123 Đường D1 Khu Công nghệ cao,",
                          //         style: TextStyle(fontSize: 13)),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text(" P.Long Thạnh Mỹ, Q. 9, TP.HCM ",
                          //     style: TextStyle(fontSize: 13)),
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
                              Text("maotrachtam@gmail.com",
                                  style: TextStyle(fontSize: 13)),
                            ],
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Icon(
                          //       Icons.public,
                          //       size: 13,
                          //     ),
                          //     Text("maotrachtam.com.vn",
                          //         style: TextStyle(fontSize: 13)),
                          //   ],
                          // ),

                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ChatScreen(
                                            user: chat.sender,
                                          )));
                            },
                            child: Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                                color: Colors.lightGreen,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.near_me,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Nhắn tin",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: TabBar(
                  //isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: "Hoạt động",
                      // icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: "Cứu hộ",
                      //   icon: Icon(Icons.help,size: 20,),
                    ),
                    Tab(
                      text: "Nuôi nhận",
                      //   icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: "Nhật kí",
                      //  icon: Icon(Icons.home),
                    ),
                  ],
                  controller: tabController,
                ),
              ),

            ];
          },
          body: TabBarView(
            children: <Widget>[
              ActivityPage(
                postModel: widget.postModel,
              ),
              PageRescued(),
              PageAdoption(),
              PageTimelines(postModel: widget.postModel,),
            ],
            controller: tabController,
          ),
        ),
      ),
    );
  }

}

