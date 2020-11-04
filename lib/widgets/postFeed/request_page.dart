import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/EditPost/edit_post.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/bloc/post/post/post_state.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:petrescue/login/SignIn.dart';
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

  const RequestPostPage(
      {Key key, @required this.listOfPost, this.sortType, this.postBloc})
      : super(key: key);

  @override
  _RequestPostPageState createState() => _RequestPostPageState();
}

class _RequestPostPageState extends State<RequestPostPage> {
  @override
  Widget build(BuildContext context) {
    Color appBarColor;
    String appbarText;
    if (widget.sortType
        .contains(PostType.RequestPost.toString().split('.').last)) {
      appbarText = "Cứu hộ";
      appBarColor = Colors.redAccent;
    } else if (widget.sortType
        .contains(PostType.AdoptPost.toString().split('.').last)) {
      appbarText = "Nuôi nhận";
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
                          backgroundImage: currentUser.isVerifyRescueCenter ? NetworkImage(currentUser.imageURL) : NetworkImage("https://avatars2.githubusercontent.com/u/1532252?s=400&v=4"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          currentUser.isVerifyRescueCenter ? currentUser.fullNanme : "Nguyễn Bùi Bảo Khanh",
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
              Icons.settings,
              'Giới thiệu',
              () {
                //close drawer
                Navigator.pop(context, false);
                //open another screen
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutScreen()));
              },
            ),
            CustomListSideMenuBar(Icons.settings, 'Đánh giá', () => {}),
            CustomListSideMenuBar(Icons.help_outline, 'Trợ giúp', () {
              //close drawer
              Navigator.pop(context, false);

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HelpScreen()));
            }),

            CustomListSideMenuBar(Icons.remove_circle_outline, 'Đăng xuất ',
                () {
              //close drawer
              Navigator.push(context, MaterialPageRoute( builder: (context) => LoginPage()));
            })
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appbarText,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          tooltip: "View notification",
          onPressed: () {
            if (widget.sortType
                .contains(PostType.RequestPost.toString().split('.').last)) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateEditPostCapCuu(),
                  ));
            } else if (widget.sortType
                .contains(PostType.AdoptPost.toString().split('.').last)) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPost(),
                  ));
            }



          },
        ),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              if (widget.sortType
                  .contains(PostType.RequestPost.toString().split('.').last)) {
                DialogFilter.dialogRescue(context);
              } else if (widget.sortType
                  .contains(PostType.AdoptPost.toString().split('.').last)) {
                DialogFilter.dialogAdopt(context);
              }
            },
          ),
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
                return PostCard(
                    postModel: sortedList(state.visiblePostTree)[i]);
              });
        },
      ),
    );
  }

  List<Post> sortedList(List<Post> listOfPost) {
    return listOfPost
        .where((element) => widget.sortType
            .contains(element.postType.toString().split('.').last))
        .toList();

    // if(widget.sortType.contains(PostType.RequestPost.toString().split('.').last) || widget.sortType .contains(PostType.InRescuePost.toString().split('.').last))
    //   return listOfPost.where((element) =>  widget.sortType.contains(element.postType.toString().split('.').last)).toList();
    //
    // else if(widget.sortType.contains(PostType.AdoptPost.toString().split('.').last))
    //   return listOfPost.where((element) => element.postType.toString().split('.').last widget.sortType).toList();
  }
}

//filet
class DialogFilter {
  static dialogRescue(context) =>
      showDialog(context: context, builder: (context) => DialogFilterRescue());

  static dialogAdopt(context) =>
      showDialog(context: context, builder: (context) => DialogFilterAdopt());
}

class DialogFilterRescue extends StatefulWidget {
  @override
  _DialogFilterRescueState createState() => _DialogFilterRescueState();
}

class _DialogFilterRescueState extends State<DialogFilterRescue> {
//  String p = "";
//tinh trang do uu tien
  bool priorityHigh = false;
  bool priorityLow = false;

//phan loai
  bool isTainan = false;
  bool isThatlac = false;
  bool isBoroi = false;
  bool isKhac = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                //alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //border: BorderRadius.circular(10)
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Độ ưu tiên",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        RaisedButton(
                          textColor: priorityHigh ? Colors.white : Colors.black,
                          color: priorityHigh ? PetRescueTheme.lightPink : null,
                          onPressed: () {
                            setState(() {
                              priorityHigh = true;
                              priorityLow = false;
                            });
                          },
                          child: Text('Cao',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                            textColor: priorityLow ? Colors.white : null,
                            color: priorityLow ? PetRescueTheme.lightPink : null,
                            onPressed: () {
                              setState(() {
                                priorityHigh = false;
                                priorityLow = true;
                              });
                            },
                            child: Text(
                              'Thấp',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Phân loại',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        RaisedButton(
                          textColor: isTainan ? Colors.white : null,
                          color: isTainan ? PetRescueTheme.lightPink : null,
                          onPressed: () {
                            setState(() {
                              isTainan = true;
                              isThatlac = false;
                              isBoroi = false;
                              isKhac = false;
                            });
                          },
                          child: Text('Tai nạn', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          textColor: isThatlac ? Colors.white : null,
                          color: isThatlac ? PetRescueTheme.lightPink : null,
                          onPressed: () {
                            setState(() {
                              isTainan = false;
                              isThatlac = true;
                              isBoroi = false;
                              isKhac = false;
                            });
                          },
                          child: Text('Thất lạc', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        RaisedButton(
                          textColor: isKhac ? Colors.white : null,
                          color: isKhac ? PetRescueTheme.lightPink : null,
                          onPressed: () {
                            setState(() {
                              isTainan = false;
                              isThatlac = false;
                              isBoroi = false;
                              isKhac=true;
                            });
                          },
                          child: Text('Khác', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Khu vực tìm kiếm',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
                      child: Row(
                        //  direction: Axis.horizontal,
                        //  mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.gps_fixed,
                            color: PetRescueTheme.lightPink,
                          ),
                          // SizedBox(width: 20,),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              //width: MediaQuery.of(context).size.width,
                              height: 70,
                              width: 200,
                              decoration: BoxDecoration(color: Colors.black12),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'CÔNG TY PHÁT TRIỂN CÔNG NGHỆ PHẦN MỀM QUANG TRUNG',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Thay đổi',
                              style: TextStyle(
                                  color: PetRescueTheme.lightPink,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context,false);
                  },

                  child: Text(
                    'XONG',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class DialogFilterAdopt extends StatefulWidget {
  @override
  _DialogFilterAdoptState createState() => _DialogFilterAdoptState();
}

class _DialogFilterAdoptState extends State<DialogFilterAdopt> {
  //loai
  bool isCho = false;
  bool isMeo = false;
  bool isKhac = false;
  //gioi tinh
  bool isDuc = false;
  bool isCai = false;
  bool isChuaxacdinh = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                //border: BorderRadius.circular(10)
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Loài",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      RaisedButton(
                        textColor: isCho ? Colors.white : Colors.black,
                        color: isCho ? PetRescueTheme.darkGreen : null,
                        onPressed: () {
                          setState(() {
                            isCho = true;
                            isMeo = false;
                            isKhac = false;
                            print('la cho');
                          });
                        },
                        child: Text('Chó',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      RaisedButton(
                          textColor: isMeo ? Colors.white : null,
                          color: isMeo ? PetRescueTheme.darkGreen : null,
                          onPressed: () {
                            setState(() {
                              isCho = false;
                              isMeo = true;
                              isKhac = false;
                            });
                          },
                          child: Text(
                            'Mèo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      RaisedButton(
                          textColor: isKhac ? Colors.white : null,
                          color: isKhac ? PetRescueTheme.darkGreen : null,
                          onPressed: () {
                            setState(() {
                              isCho = false;
                              isMeo = false;
                              isKhac = true;
                            });
                          },
                          child: Text(
                            'Khác',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Giới tính',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      RaisedButton(
                        textColor: isDuc ? Colors.white : null,
                        color: isDuc ? PetRescueTheme.darkGreen : null,
                        onPressed: () {
                          setState(() {
                            isDuc = true;
                            isCai = false;
                            isChuaxacdinh = false;
                          });
                        },
                        child: Text('Đực'),
                      ),
                      RaisedButton(
                        textColor: isCai ? Colors.white : null,
                        color: isCai ? PetRescueTheme.darkGreen : null,
                        onPressed: () {
                          setState(() {
                            isDuc = false;
                            isCai = true;
                            isChuaxacdinh = false;
                          });
                        },
                        child: Text('Cái'),
                      ),
                      RaisedButton(
                        textColor: isChuaxacdinh ? Colors.white : null,
                        color: isChuaxacdinh ? PetRescueTheme.darkGreen : null,
                        onPressed: () {
                          setState(() {
                            isDuc = false;
                            isCai = false;
                            isChuaxacdinh = true;
                          });
                        },
                        child: Text('Chưa xác định'),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context,false);
                },

                child: Text(
                  'XONG',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
