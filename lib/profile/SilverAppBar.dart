import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/EditScreen.dart';
import 'package:petrescue/profile/TabAdoption.dart';
import 'package:petrescue/profile/TabRescued.dart';
import 'package:petrescue/profile/TabTimelines.dart';
import 'package:petrescue/profile/chat_screen.dart';
import 'package:petrescue/models/message_model.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';
import 'package:petrescue/widgets/progress.dart';

class ProfileTab extends StatefulWidget {
  final Post postModel;

  const ProfileTab({Key key, this.postModel}) : super(key: key);
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
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
                          backgroundImage: NetworkImage(currentUser.imageURL),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          currentUser.fullNanme,
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
                leading: Container(),
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
                    icon: Icon(Icons.menu),
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
                            backgroundImage: NetworkImage(currentUser.imageURL),
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Icon(
                          //       Icons.business_center,
                          //       size: 13,
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text("Job", style: TextStyle(fontSize: 13)),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text("|"),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text("ABC Center",
                          //         style: TextStyle(fontSize: 13)),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
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
              ActivityPage(
                postModel: widget.postModel,
              ),
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
class ActivityPage extends StatelessWidget {
  final Post postModel;

  const ActivityPage({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Progress(
      postModel: postModel,
    ));
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
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
      ),
    );
  }
}
