import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/notification_screen.dart';
import 'package:petrescue/utils/flappy_search_bar.dart';
import 'package:petrescue/widgets/post_card.dart';
import 'package:flappy_search_bar/scaled_tile.dart';

class RequestPostPage extends StatefulWidget {
  final List<Post> listOfPost;
  final List<String> sortType;
  final PostBloc postBloc;

  const RequestPostPage({Key key, @required this.listOfPost, this.sortType, this.postBloc}) : super(key: key);

  @override
  _RequestPostPageState createState() => _RequestPostPageState();
}

class _RequestPostPageState extends State<RequestPostPage> {

  @override
  Widget build(BuildContext context) {
    Color appBarColor;
    String appbarText;
    if(widget.sortType.contains(PostType.RequestPost.toString().split('.').last))
      {
        appbarText = "Rescue";
        appBarColor = Colors.redAccent;

      }
    else if(widget.sortType.contains(PostType.AdoptPost.toString().split('.').last))
      {
        appbarText = "Adopt";
        appBarColor = PetRescueTheme.darkGreen;
      }
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    PostState state = PostState();
    return Scaffold(
      key: _scaffoldKey,
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
            CustomListSideMenuBar(Icons.group, 'Centers', ()=>{
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CentersScreen()))
            }),
            CustomListSideMenuBar(Icons.settings, 'Settings', ()=>{}),
            CustomListSideMenuBar(Icons.settings, 'About', () {
              //close drawer
              Navigator.pop(context,false);
              //open another screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AboutScreen()));
            },),
            CustomListSideMenuBar(Icons.settings, 'Give feedback', ()=>{

            }),
            CustomListSideMenuBar(Icons.help_outline, 'Help', () {
              //close drawer
              Navigator.pop(context,false);

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HelpScreen()));
            }),

            CustomListSideMenuBar(Icons.remove_circle_outline, 'Sign out', () {
              //close drawer
              Navigator.pop(context,false);
            })
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(appbarText, style: TextStyle(color: Colors.white),),
        leading:  IconButton(
          icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
          tooltip: "View notification",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPost(),));
          },
        ),

        backgroundColor: appBarColor,
        actions: [

          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white,),
            tooltip: "View notification",
            onPressed: (){
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),


        ],

      ),
      body: StreamBuilder(
        initialData: state,
        stream: bloc.outputStream,
        builder: (context, snapshot) {
          state = snapshot.data;
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              itemCount: sortedList(state.visiblePostTree).length,
              itemBuilder: (BuildContext buildContext, int i) {
                  return PostCard( postModel: sortedList(state.visiblePostTree)[i]);
              });
        },

      ),
    );
  }


  List<Post> sortedList(List<Post> listOfPost)
  {

    return listOfPost.where((element) =>  widget.sortType.contains(element.postType.toString().split('.').last)).toList();

    // if(widget.sortType.contains(PostType.RequestPost.toString().split('.').last) || widget.sortType .contains(PostType.InRescuePost.toString().split('.').last))
    //   return listOfPost.where((element) =>  widget.sortType.contains(element.postType.toString().split('.').last)).toList();
    //
    // else if(widget.sortType.contains(PostType.AdoptPost.toString().split('.').last))
    //   return listOfPost.where((element) => element.postType.toString().split('.').last widget.sortType).toList();
  }
}
