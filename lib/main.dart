import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/model/tabicondata.dart';
import 'package:petrescue/widgets/bottom_bar.dart';

void main() => runApp(PetApp());

class PetApp extends StatefulWidget {
  @override
  _PetAppState createState() => _PetAppState();
}

class _PetAppState extends State<PetApp> with TickerProviderStateMixin
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "AppTitle",
      home: HomeTab()
    );
  }

}

Future<bool> getData() async {
  await Future<dynamic>.delayed(const Duration(milliseconds: 200));
  return true;
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  AnimationController animationController;
  Widget tabBody = Container(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext buildContext, AsyncSnapshot<bool> snapshot){
            if (!snapshot.hasData) {return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar()
                ],
              );
            }
          }
        ),
      ),
    );
  }


  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),

        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                // setState(() {
                //   tabBody =
                //       MyDiaryScreen(animationController: animationController);
                // });
              });
            }
            else if (index == 1)
            {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                // setState(() {
                //   tabBody =
                //       TrainingScreen(animationController: animationController);
                // });
              });
            }

            else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                // setState(() {
                //   tabBody =
                //   // TrainingScreen(animationController: animationController);
                //   TimeBudgettingScreen( );
                // });
              });
            }
          },
        ),
      ],
    );
  }
}

