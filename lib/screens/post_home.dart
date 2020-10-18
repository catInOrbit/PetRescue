import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/tabicondata.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/bottom_bar.dart';
import 'package:petrescue/widgets/postFeed/request_page.dart';

class PostHome extends StatefulWidget {
  final List<Post> listOfPost;

  const PostHome({Key key, this.listOfPost}) : super(key: key);
  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    RequestPostPage(listOfPost: listOfPosts,),
    RequestPostPage(listOfPost: listOfPosts,),
    RequestPostPage(listOfPost: listOfPosts,),
    ProfileTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bottomNavBar = BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: PetRescueTheme.orange,
      unselectedItemColor: Colors.grey.withOpacity(0.6),
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          title: Text(
            'Request',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text(
            'Chats',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beach_access),
          title: Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

  //   List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  //   AnimationController animationController;
  //   final bottomNavBar =
  // BottomBarView(
  //         tabIconsList: tabIconsList,
  //         addClick: () {},
  //         changeIndex: (int index) {
  //           if (index == 0 || index == 2) {
  //             animationController.reverse().then<dynamic>((data) {
  //               if (!mounted) {
  //                 return;
  //               }
  //               // setState(() {
  //               //   tabBody = RequestPostPage();
  //               // });
  //             });
  //           } else if (index == 1) {
  //             animationController.reverse().then<dynamic>((data) {
  //               if (!mounted) {
  //                 return;
  //               }
  //             });
  //           } else if (index == 3) {
  //             animationController.reverse().then<dynamic>((data) {
  //               if (!mounted) {
  //                 return;
  //               }
  //             });
  //           }
  //         },
  //       );


    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
