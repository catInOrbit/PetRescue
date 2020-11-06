import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/postFeed/request_page.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: PetRescueTheme.orange,
        elevation: 0,
        title: Text("Hoạt động", style: TextStyle(color: Colors.white),),
        leading: Container(),

        actions: [
          IconButton(
            icon: Image.asset("lib/assets/baseline_filter_alt_white_24dp.png"),
            onPressed: () {
              // if (widget.s
              //     .contains(PostType.RequestPost.toString().split('.').last)) {
              //   DialogFilter.dialogRescue(context);
              // } else if (widget.sortType
              //     .contains(PostType.AdoptPost.toString().split('.').last)) {
              //   DialogFilter.dialogAdopt(context);
              // }
            },
          ),

          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white,),
            tooltip: "View notification",
            onPressed: (){
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body:
      HomePagePost(),
      // ListView.builder(
      //   itemCount: listOfPosts.length,
      //   itemBuilder: (context, index)
      //   {
      //     if(listOfPosts[index].acceptedRequestUser != null)
      //       return HomePagePost(postModel: listOfPosts[index],);
      //     else
      //       return Container();
      // },),

          actions: [
            IconButton(
              icon: Icon(Icons.filter_alt),
              onPressed: () {
                DialogFilter.dialogActivities(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,),
              tooltip: "View notification",
              onPressed: (){
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listOfPosts.length,
          itemBuilder: (context, index)
          {
            if(listOfPosts[index].acceptedRequestUser != null)
              return HomePagePost(postModel: listOfPosts[index],);
            else
              return Container();
        },),

        endDrawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 120,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: HexColor('#FFB9AC'),
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

    );
  }
}
