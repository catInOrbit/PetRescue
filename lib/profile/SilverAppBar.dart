import 'package:flutter/material.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/profile/Colors.dart';
import 'package:petrescue/profile/EditScreen.dart';
import 'package:petrescue/profile/TabAdoption.dart';
import 'package:petrescue/profile/TabRescued.dart';
import 'package:petrescue/profile/TabTimelines.dart';
import 'package:petrescue/profile/chat_screen.dart';
import 'package:petrescue/models/message_model.dart';
import 'package:petrescue/widgets/progress.dart';

class ProfileTab extends StatefulWidget {
  final Post postModel;

  const ProfileTab({Key key, this.postModel}) : super(key: key);
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin{

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
    return Scaffold(
      backgroundColor: HexColor('#FFB9AC'),
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
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditScreen()),
                        );
                      },
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).padding.top,0,MediaQuery.of(context).padding.bottom),
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
                          Text("Websitesfsfd.com.vn", style: TextStyle(fontSize: 13)),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    user: chat.sender,
                                  )
                              ));
                              },
                            child: Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Colors.lightGreen,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.near_me, color: Colors.white, size: 12,),
                                  SizedBox(width: 10,),
                                  Text("Message",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                  ),)
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
              ActivityPage(postModel: widget.postModel,),
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
    return SingleChildScrollView(child: Progress(postModel: postModel,));
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

