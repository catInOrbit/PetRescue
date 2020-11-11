import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/widgets/detail_card.dart';

import '../petrescue_theme.dart';

class TrackingPageImproved extends StatefulWidget {
  final Post postModel;

  const TrackingPageImproved({Key key, this.postModel}) : super(key: key);
  @override
  _TrackingPageImprovedState createState() => _TrackingPageImprovedState();
}

class _TrackingPageImprovedState extends State<TrackingPageImproved> {
  static GoogleMapController mapController;

  static LatLng _center = const LatLng(10.828056, 106.703324);

  static void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: SafeArea(
        child: Container(
          height: 350,
          width: 400,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16,
            ),
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            rotateGesturesEnabled: true,
            myLocationEnabled: true,
          ),
        ),
      ),
      // titleWidget:
      bodyWidget:  Container(
        height: 200,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/tracking_page.png"), fit: BoxFit.cover)),
         child: Text("Đường đi đến địa điểm cần cứu hộ", style: TextStyle(fontSize: 24, fontFamily: "Lato"), ),
      ),

    ),
    PageViewModel(
      title: " Cập nhật quá trình của bạn",
      bodyWidget: SizedBox(
        width: 400,
        child: Wrap(
          direction: Axis.horizontal,
          alignment:  WrapAlignment.center,
          children:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(" Đăng post cập nhật trong tab cập nhật", style: TextStyle(fontSize: 18),),
            ),
            Container( height: 100, width: 100,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("lib/assets/update_pic.png"))),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(" để cung cấp thêm thông tin về quá trình giải cứu", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
      image:  SafeArea(
        child: Center(child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("lib/assets/doctor.jpg"))),)),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yêu cầu đã được chấp nhận"),
        backgroundColor: PetRescueTheme.lightPink,
      ),
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCard(postModel: widget.postModel, defaultTabIndex: widget.postModel.postType == PostType.RequestPost ? 2 : 1, isEditing: false,),));
        },
        onSkip: () {
          Navigator.of(context).pop();
        },
        showSkipButton: true,
        skip:  Text("Hủy", style: TextStyle(color: Colors.black, fontSize: 20),),
        next: const Icon(Icons.arrow_forward_ios),
        done: const Text("Đi đến chi tiết", style: TextStyle(fontWeight: FontWeight.w600)),
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
