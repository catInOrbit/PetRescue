import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/profile/CustomListSlideMenuBar.dart';
import 'package:petrescue/profile/profile_screens/about_screen.dart';
import 'package:petrescue/profile/profile_screens/center_screen.dart';
import 'package:petrescue/profile/profile_screens/help_screen.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_card.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../main.dart';
import '../petrescue_theme.dart';

class ActivityTimelineApp extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        backgroundColor: PetRescueTheme.orange,
        elevation: 0,
        title: Text("Hoạt động", style: TextStyle(color: Colors.white),),
        leading:  IconButton(
          icon: const Icon(Icons.add_circle_outline, color: Colors.white,),
          tooltip: "View notification",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPost(),));
          },

        ),

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
      body: _ActivityTimeline(),
    );
  }
}

class _ActivityTimeline extends StatefulWidget {
  @override
  _ActivityTimelineState createState() => _ActivityTimelineState();
}

class _ActivityTimelineState extends State<_ActivityTimeline> {
  List<Step> _steps;
  List<Color> colorScheme;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.white.withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Expanded(
                  child: _TimelineActivity(steps: _steps),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget statusTitle(Post postModel)
  {
    List<Color> colorScheme;
    String label = "";

    switch(postModel.postType)
    {
      case PostType.InRescuePost:
        colorScheme = PetRescueTheme.homePageInRescue;
        label = "Đang giải cứu";
        break;
      case PostType.AdoptPost:
        colorScheme = PetRescueTheme.homePageAdoptPost;
        label = "Đăng nhận nuôi";
        break;
      case PostType.RequestPost:
        colorScheme = PetRescueTheme.homePageRescuePost;
        label = "Yêu cầu cứu hộ";
        break;
      case PostType.FinishedPost:
        colorScheme = PetRescueTheme.rescuedPost;
        label = "Đã giải cứu";
        break;
    }

    return Row(
      children: [
        Chip(
          label: Text(label),
          backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
          labelStyle: TextStyle(color: colorScheme[PetRescueThemeColorType.KeyWord.index], fontSize: 18),
        ),

        if(postModel.postType == PostType.FinishedPost)
          Icon(Icons.verified_user, size: 30, color: Colors.green,)
      ],
    );
  }

  Widget createTimelinePost(BuildContext context, Post postModel) {

    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (postModel.postType == PostType.RequestPost)
      postModel.priority == Priority.Normal
          ? colorScheme = PetRescueTheme.rescuePostTheme : colorScheme = PetRescueTheme.rescuePostPrioritizedTheme ;
    else if (postModel.postType == PostType.InRescuePost)
      colorScheme = PetRescueTheme.inRescuePostTheme;
    else if (postModel.postType == PostType.FinishedPost)
      colorScheme = PetRescueTheme.finishedPostTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailCard(
                            postModel: postModel,
                            isEditing: false,
                            defaultTabIndex: 1,
                          )));
            },
            child: Container(
              width: 380,
              child: Column(
                children: [
                  Container(),
                  // Column(
                  //   children: [
                  //     // Container(
                  //     //   width: 380,
                  //     //   decoration: BoxDecoration(
                  //     //     image: DecorationImage(
                  //     //         image: NetworkImage(
                  //     //             postModel.imageThumbnail), fit: BoxFit.cover),
                  //     //     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  //     //     gradient: LinearGradient(
                  //     //       begin: Alignment.topCenter,
                  //     //       end: Alignment.bottomCenter,
                  //     //       colors: [Color(0x00ffffff), Colors.black],
                  //     //     ),
                  //     //   ),
                  //     //   padding: const EdgeInsets.only(
                  //     //     top: 11,
                  //     //     bottom: 42,
                  //     //   ),
                  //     //   child: Column(
                  //     //     mainAxisSize: MainAxisSize.max,
                  //     //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     //     children: [
                  //     //       Container(
                  //     //         width: 700,
                  //     //         height: 44,
                  //     //         child: Stack(
                  //     //           children: [
                  //     //
                  //     //             Positioned(
                  //     //                 left: 20,
                  //     //
                  //     //                 child: Text("20 phút trước", style: TextStyle(color: Colors.white),)
                  //     //             ),
                  //     //           ],
                  //     //         ),
                  //     //       ),
                  //     //       SizedBox(height: 92),
                  //     //     ],
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color:
                      colorScheme[PetRescueThemeColorType.Accent.index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                            children: [

                              PostHeaderRibbon(postModel: postModel,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: UserInfoRibon(
                                      isDetailRibbon: false,
                                      postModel: postModel,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: statusTitle(postModel),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            postModel.title,
                            style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType
                                  .Text.index],
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "Thời gian nhận: " + postModel.timeCreated.toString(),
                            style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType
                                  .Text.index],
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        if(postModel.postType == PostType.FinishedPost)
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Thời gian xử lí thành công: 6/10/2020",
                              style: TextStyle(
                                color: colorScheme[PetRescueThemeColorType
                                    .Text.index],
                                fontSize: 15,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                        SizedBox(height: 10,),

                        if(postModel.postType == PostType.AdoptPost )
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Text("Yêu cầu nhận nuôi:", style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme[PetRescueThemeColorType.Text.index]

                                ),),
                                CustomAvatars(postModel: postModel,),
                              ],
                            ),
                          ),
                        //Contact button and action keyword
                        // Padding(
                        //   padding: const EdgeInsets.all(12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       // InkWell(
                        //       //   onTap: (){
                        //       //     Navigator.push(context, MaterialPageRoute(
                        //       //       builder: (context) => ProfileTab(postModel: listOfPosts[0],),
                        //       //     ));
                        //       //   },
                        //       //   // child: Container(
                        //       //   //   height: 45,
                        //       //   //   decoration: BoxDecoration(
                        //       //   //     borderRadius:
                        //       //   //     BorderRadius.circular(20),
                        //       //   //     color: Color(0xffebf3fa),
                        //       //   //   ),
                        //       //   //   padding: const EdgeInsets.only(
                        //       //   //     left: 8,
                        //       //   //     right: 14,
                        //       //   //     top: 9,
                        //       //   //     bottom: 4,
                        //       //   //   ),
                        //       //   //   child: Row(
                        //       //   //     mainAxisSize: MainAxisSize.min,
                        //       //   //     crossAxisAlignment: CrossAxisAlignment.center,
                        //       //   //     children: [
                        //       //   //       SizedBox(
                        //       //   //         width: 70,
                        //       //   //         child: Text(
                        //       //   //           "Liên hệ",
                        //       //   //           style: TextStyle(
                        //       //   //             color: Colors.black,
                        //       //   //             fontSize: 18,
                        //       //   //             fontFamily: "Lato",
                        //       //   //             fontWeight:
                        //       //   //             FontWeight.w700,
                        //       //   //           ),
                        //       //   //         ),
                        //       //   //       ),
                        //       //   //       SizedBox(width: 4),
                        //       //   //       Container(
                        //       //   //         width: 22,
                        //       //   //         height: 20,
                        //       //   //         child: Icon(
                        //       //   //             Icons.call
                        //       //   //         ),
                        //       //   //       ),
                        //       //   //     ],
                        //       //   //   ),
                        //       //   // ),
                        //       // ),
                        //       ActionKeyword(
                        //         postModel: postModel,
                        //         isHomepagePost: true,),
                        //     ],
                        //   ),
                        // ),


                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                        //   child: Wrap(
                        //     children: [
                        //       Container(
                        //         child: Wrap(
                        //           spacing: 10,
                        //           direction: Axis.horizontal,
                        //           alignment: WrapAlignment.start,
                        //           children: getAllStatuses(postModel),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget buildWidget(Post e)
  {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   backgroundImage: NetworkImage(
                //       e.currentUser.imageURL), maxRadius: 30,),
                // SizedBox(width: 20,),
              ],
            ),
            createTimelinePost(context, e),
          ],
        );
  }

  Color _getColorOfStep(PostType postType)
  {
      switch(postType)
      {
        case PostType.AdoptPost :
          return PetRescueTheme.darkGreen;
          break;
          case PostType.InRescuePost:
            return PetRescueTheme.lime;
            break;
        case PostType.FinishedPost:
          return Colors.grey;
          break;
      }
  }

  Icon _getIconOfStep(PostType postType)
  {
      switch(postType)
      {
        case PostType.AdoptPost :
          return  Icon(MaterialIcons.pets);
          break;
        case PostType.InRescuePost:
          return Icon(MaterialIcons.pets);
          break;
        case PostType.FinishedPost:
          return Icon(Icons.check_circle);
          break;
      }
  }

  List<Step> _generateData() {
    return listOfPosts.where((element) => element.postType != PostType.RequestPost).map((e) {
        return Step(
          buildWidget(e),
          type: Type.checkpoint,
          hour: '05:42',
          icon: Icons.home,
          message: 'Home',
          duration: 2,
          color: _getColorOfStep(e.postType),
        );
    }).toList();
  }
}

class _TimelineActivity extends StatelessWidget {


  const _TimelineActivity({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (BuildContext context, int index) {
        final Step step = steps[index];

        final IndicatorStyle indicator = step.isCheckpoint
            ? _indicatorStyleCheckpoint(step)
            : const IndicatorStyle(width: 0);

        final righChild = _RightChildTimeline(step: step);

        Widget leftChild;
        if (step.hasHour) {
          leftChild = _LeftChildTimeline(step: step);
        }

        return TimelineTile(
          alignment: TimelineAlign.manual,
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          lineXY: 0.15,
          indicatorStyle: indicator,
          startChild: leftChild,
          endChild: righChild,
          hasIndicator: step.isCheckpoint,
          beforeLineStyle: LineStyle(
            color: step.color,
            thickness: 4,
          ),
        );
      },
    );
  }

  IndicatorStyle _indicatorStyleCheckpoint(Step step) {
    return IndicatorStyle(
      width: 46,
      height: 100,
      indicator: Container(
        decoration: BoxDecoration(
          color: step.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Icon(
            step.icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _RightChildTimeline extends StatelessWidget {
  const _RightChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    final double minHeight =
    step.isCheckpoint ? 100 : step.duration.toDouble() * 8;
    return step.widget;
    // return ConstrainedBox(
    //   constraints: BoxConstraints(minHeight: minHeight),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Padding(
    //         padding: EdgeInsets.only(
    //             left: step.isCheckpoint ? 20 : 39, top: 8, bottom: 8, right: 8),
    //         child: RichText(
    //           text: TextSpan(children: <TextSpan>[
    //             TextSpan(
    //               text: step.message,
    //               style: GoogleFonts.patrickHand(
    //                 fontSize: 22,
    //                 color: step.color,
    //               ),
    //             ),
    //             TextSpan(
    //               text: '  ${step.duration} min',
    //               style: GoogleFonts.patrickHand(
    //                 fontSize: 22,
    //                 color: const Color(0xFFF2F2F2),
    //               ),
    //             )
    //           ]),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class _LeftChildTimeline extends StatelessWidget {
  const _LeftChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Text(
            step.hour,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 17,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {

  Widget statusTitle(Post postModel)
  {
    List<Color> colorScheme;
    String label = "";

    switch(postModel.postType)
    {
      case PostType.InRescuePost:
        colorScheme = PetRescueTheme.homePageInRescue;
        label = "Đang giải cứu";
        break;
      case PostType.AdoptPost:
        colorScheme = PetRescueTheme.homePageAdoptPost;
        label = "Đăng nhận nuôi";
        break;
      case PostType.RequestPost:
        colorScheme = PetRescueTheme.homePageRescuePost;
        label = "Yêu cầu cứu hộ";
        break;
      case PostType.FinishedPost:
        colorScheme = PetRescueTheme.rescuedPost;
        label = "Đã giải cứu";
        break;
    }

    return Row(
      children: [
        Chip(
          label: Text(label),
          backgroundColor: colorScheme[PetRescueThemeColorType.Accent.index],
          labelStyle: TextStyle(color: colorScheme[PetRescueThemeColorType.KeyWord.index], fontSize: 18),
        ),

        if(postModel.postType == PostType.FinishedPost)
          Icon(Icons.verified_user, size: 30, color: Colors.green,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: statusTitle(listOfPosts[0])
            // Text(
            //   'Activity Tracker',
            //   textAlign: TextAlign.center,
            //   style: GoogleFonts.patrickHand(
            //     fontSize: 36,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

enum Type {
  checkpoint,
  line,
}

class Step {
  Step(this.widget, {
    this.type,
    this.hour,
    this.message,
    this.duration,
    this.color,
    this.icon,
  });

  final Widget widget;
  final Type type;
  final String hour;
  final String message;
  final int duration;
  final Color color;
  final IconData icon;

  bool get isCheckpoint => type == Type.checkpoint;

  bool get hasHour => hour != null && hour.isNotEmpty;
}
