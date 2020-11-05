import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingPageImproved extends StatefulWidget {
  @override
  _TrackingPageImprovedState createState() => _TrackingPageImprovedState();
}

class _TrackingPageImprovedState extends State<TrackingPageImproved> {
  static GoogleMapController mapController;

  static LatLng _center = const LatLng(37.7338, -122.4419);

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
              zoom: 4,
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
         child: Text("Di chuyển đến địa điểm của thú", style: TextStyle(fontSize: 24, fontFamily: "Lato"), ),
      ),

    ),
    PageViewModel(
      title: "Title of first page",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image:  Center(child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("lib/assets/update_pic.png"))),)),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () {
        // When done button is press
      },
      onSkip: () {
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_forward_ios),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.deepOrangeAccent,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
