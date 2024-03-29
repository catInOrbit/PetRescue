import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final List<Location> locations = [
    Location('Đã tới khu vực XYZ', DateTime(2019, 6, 5, 5, 23, 4),
        showHour: false, isHere: false, passed: true),
    Location('Tìm thấy thú ở XYZ', DateTime(2019, 6, 6, 5, 23, 4),
        showHour: false, isHere: false, passed: true),
    Location(
      ' Trên đường về trạm',
      DateTime(2019, 6, 9, 5, 23, 4),
      showHour: false,
      isHere: true,
    ),
    Location(
      'Đã về đến trạm',
      DateTime(2019, 6, 10, 5, 23, 4),
      showHour: true,
      isHere: false,
    ),
  ];

  String selectedProduct = 'Boat Headphones Bass boost 100v';

  GoogleMapController mapController;

  final LatLng _center = const LatLng(37.7338, -122.4419);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Quá trình giải cứu',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: SizedBox(),
        actions: <Widget>[CloseButton()],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/tracking_page.png")),
                ),
                child: Theme(
                  data: ThemeData(
                      primaryColor: PetRescueTheme.lightPink,
                      fontFamily: 'Montserrat'),
                  child: Stepper(
//                          physics: NeverScrollableScrollPhysics(),
                    steps: [
                      ...locations
                          .map(
                            (location) => Step(
                              isActive: location.isHere || location.passed,
                              title: Text(location.city),
                              subtitle: Text(location.getDate()),
                              content: Align(
                                child: Image.asset('lib/assets/truck.png'),
                                alignment: Alignment.centerLeft,
                              ),
                              state: location.passed
                                  ? StepState.complete
                                  : location.isHere
                                      ? StepState.editing
                                      : StepState.indexed,
                            ),
                          )
                          .toList()
                    ],
                    currentStep: locations
                        .indexOf(locations.firstWhere((loc) => loc.isHere)),
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Location {
  String city;
  DateTime date;
  bool showHour;
  bool isHere;
  bool passed;

  Location(this.city, this.date,
      {this.showHour = false, this.isHere = false, this.passed = false});

  String getDate() {
    if (showHour) {
      return DateFormat("K:mm aaa, d MMMM y").format(date);
    } else {
      return DateFormat('d MMMM y').format(date);
    }
  }
}
