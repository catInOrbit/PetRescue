import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petrescue/models/post_model.dart';
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
    PageViewModel(
      image: Container(
        height: 200,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/contact_center.jpg"), fit: BoxFit.cover)),
      ),

      title: "Liên lạc trung tâm",
      bodyWidget:  Text("Liên lạc trung tâm cứu hộ để biết địa điểm cần đến", style: TextStyle(fontSize: 24, fontFamily: "Lato"), ),

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
              child: Text(" Đăng post cập nhật trong tab cập nhật", style: TextStyle(fontSize: 21),),
            ),
            Container( height: 100, width: 100,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("lib/assets/update_pic.png"))),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(" để cung cấp thêm thông tin về tình trạng của thú", textAlign: TextAlign.center, style: TextStyle(fontSize: 21),),
            ),
          ],
        ),
      ),
      image:  SafeArea(
        child: Center(child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("lib/assets/adopt_family.jpg"))),)),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
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
      done: const Text("Xong", style: TextStyle(fontWeight: FontWeight.w600)),
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
