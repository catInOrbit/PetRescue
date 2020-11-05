import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';

class PostEmpty extends StatelessWidget
{
  final Post postModel;

  const PostEmpty({Key key, this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),

      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                      NetworkImage(postModel.imageThumbnail),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00ffffff), Colors.black],
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 11,
                  bottom: 42,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 700,
                      height: 44,
                      child: Stack(
                        children: [
                          Positioned(
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  print("Tap");
                                  // _showPopupMenu(context);
                                },
                                child: Ink(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                  child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "lib/assets/setting_icon.png")),
                                ),
                              )),
                          Positioned(
                              left: 20,
                              child: Text(
                                "20 phút trước",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 92),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
              style: TextStyle(
                color: Color(0xff151515),
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
