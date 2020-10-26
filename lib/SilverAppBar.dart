import 'package:flutter/material.dart';
import 'package:petrescue/Colors.dart';
import 'package:petrescue/CustomTitleSideMenu.dart';
import 'package:petrescue/EditScreen.dart';
import 'package:petrescue/TabAdoption.dart';
import 'package:petrescue/TabRescued.dart';
import 'package:petrescue/TabTimelines.dart';
import 'package:petrescue/chat_screen.dart';
import 'package:petrescue/models/message_model.dart';
import 'package:petrescue/sidebar_screen/about_creen.dart';
import 'package:petrescue/sidebar_screen/centers_screen.dart';
import 'package:petrescue/sidebar_screen/help_screen.dart';

class profildsab extends StatefulWidget {
  @override
  _profildsabState createState() => _profildsabState();
}

class _profildsabState extends State<profildsab>
    with SingleTickerProviderStateMixin {
  //test data input
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

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFB9AC'),
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
            CustomListSideMenuBar(Icons.group, 'Centers', ()=>{
            Navigator.push(context,
            MaterialPageRoute(builder: (_) => CentersScreen()))
            }),
            CustomListSideMenuBar(Icons.settings, 'Settings', ()=>{}),
            CustomListSideMenuBar(Icons.pets_outlined, 'About', () {
              //close drawer
              Navigator.pop(context,false);
              //open another screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AboutScreen()));
            },),
            CustomListSideMenuBar(Icons.phone_iphone_outlined, 'Give feedback', ()=>{

            }),
            CustomListSideMenuBar(Icons.help_outline, 'Help', () {
            //close drawer
            Navigator.pop(context,false);

            Navigator.push(context,
            MaterialPageRoute(builder: (_) => HelpScreen()));
            }),

            CustomListSideMenuBar(Icons.logout, 'Sign out', () {
            //close drawer
            Navigator.pop(context,false);
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
                  "My Profile",
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
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        MediaQuery.of(context).padding.top,
                        0,
                        MediaQuery.of(context).padding.bottom),
                    height: 230,
                    //color: Colors.white,
                    child: Center(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                Icons.phone,
                                size: 13,
                              ),
                              Text("1234567890",
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
                          Text("Websitesfsfd.com.vn",
                              style: TextStyle(fontSize: 13)),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ChatScreen(
                                            user: chat.sender,
                                          )));
                            },
                            child: Container(
                              height: 20,
                              width: 130,
                              color: Colors.lightGreen,
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
                                    "Message",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                      text: "Activities",
                      // icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: "Rescused",
                      //   icon: Icon(Icons.help,size: 20,),
                    ),
                    Tab(
                      text: "Adopted",
                      //   icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: "Timelines",
                      //  icon: Icon(Icons.home),
                    ),
                  ],
                  controller: tabController,
                ),
              ),
              // SliverPersistentHeader(
              //   delegate: _SliverAppBarDelegate(TabBar(
              //     labelColor: Colors.black87,
              //     unselectedLabelColor: Colors.grey,
              //     tabs: [
              //       Tab(icon: Icon(Icons.info), text: "Tab 1"),
              //       Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
              //     ],
              //   )),
              //   pinned: true,
              // ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              PageOne(),
              PageRescued(),
              PageAdoption(),
              PageTimelines(),
            ],
            controller: tabController,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

//test page
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(5.0),
          color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
          child: Center(
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
