import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/post_home.dart';
import 'package:petrescue/widgets/detail_card.dart';

class AdoptProcessIntroduction extends StatefulWidget {
  final Post postModel;

  const AdoptProcessIntroduction({Key key, this.postModel}) : super(key: key);
  @override
  _AdoptProcessIntroductionState createState() => _AdoptProcessIntroductionState();
}

class _AdoptProcessIntroductionState extends State<AdoptProcessIntroduction> {
  static GoogleMapController mapController;

  static LatLng _center = const LatLng(10.828056, 106.703324);

  static void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<PageViewModel> listPagesViewModel = [
    // PageViewModel(
    //   image: Container(
    //     height: 200,
    //     decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/contact_center.jpg"), fit: BoxFit.cover)),
    //   ),
    //
    //   title: "Liên lạc trung tâm",
    //   bodyWidget:  Text("Liên lạc trung tâm cứu hộ để biết địa điểm cần đến", style: TextStyle(fontSize: 24, fontFamily: "Lato"), ),
    //
    // ),
    PageViewModel(
      title: " Bạn đã gửi yêu cầu nhận nuôi bé",
      bodyWidget: SizedBox(
        width: 400,
        child: Wrap(
          direction: Axis.horizontal,
          alignment:  WrapAlignment.center,
          children:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Bạn hãy chờ nhân viên cứu hộ liên lạc để biết thêm chi tiết nhé! ", style: TextStyle(fontSize: 21),),
            ),
            // Container( height: 100, width: 100,
            // child: Icon(Icons.check_circle_outline_outlined, size: 50,),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(" để cung cấp thêm thông tin về tình trạng của thú", textAlign: TextAlign.center, style: TextStyle(fontSize: 21),),
            // ),
          ],
        ),
      ),
      image:  SafeArea(
        child: Center(child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("lib/assets/adopt_family.jpg"))),)),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: InkWell(
                onTap: (){
                  showAlertDialog(context, widget.postModel);
                },
                child: Text("Hủy", style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,

                ),)
              ),
            ),
          ),
        ],
      ),
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCard(postModel: widget.postModel, defaultTabIndex: widget.postModel.postType == PostType.RequestPost ? 2 : 1, isEditing: false,),));
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.arrow_forward_ios),
        done: const Text("Thông tin bé", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrangeAccent,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

showAlertDialog(BuildContext context, Post postModel) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Hủy"),
    onPressed:  () {
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCard(postModel: postModel, defaultTabIndex: 1,),));
      //Navigator.pop(context, false);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostHome(listOfPost: listOfPosts, defaultIndex: 1 ,),));
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Tiếp tục gửi yêu cầu"),
    onPressed:  () {
      Navigator.pop(context, false)

      ;
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hủy yêu cầu"),
    content: Text("Bạn có đồng ý hủy yêu cầu nhận nuôi chó mèo không ? "),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}