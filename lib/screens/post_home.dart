import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/tabicondata.dart';
import 'package:petrescue/notification/NotiScreen.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/EditScreen.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/notification_screen.dart';
import 'package:petrescue/screens/timeline.dart';
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
    RequestPostPage(listOfPost: listOfPosts, sortType: PostType.RequestPost.toString().split('.').last, postBloc: bloc,),
    RequestPostPage(listOfPost: listOfPosts, sortType: PostType.AdoptPost.toString().split('.').last, postBloc: bloc),
    Timeline(postModel: listOfPosts[0],),
    NotiScreen(),
    ProfileTab(postModel: listOfPosts[0],),
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
      selectedItemColor: Colors.white,
      backgroundColor: Colors.redAccent,
      unselectedItemColor: Colors.white,
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.redAccent,
          icon: Icon(Icons.people),
          title: Text(
            'Request',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: PetRescueTheme.darkGreen,

          icon: Icon(Icons.pets),
          title: Text(
            'Adopt',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: PetRescueTheme.orange,
          icon: Icon(Icons.timeline),
          title: Text(
            'Timeline',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        BottomNavigationBarItem(
          backgroundColor: PetRescueTheme.darkGreen,
          icon: Icon(Icons.add_alert),
          title: Text(
            'Notification',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        BottomNavigationBarItem(
          backgroundColor: Colors.redAccent,
          icon: Icon(Icons.account_circle),
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

    List<TabIconData> tabIconsList = TabIconData.tabIconsList;
    AnimationController animationController;
    final bottomNavBarNew =
    BottomBarView(
      tabIconsList: tabIconsList,
      addClick: () {},
      changeIndex: (int index) {
      },
    );


    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
