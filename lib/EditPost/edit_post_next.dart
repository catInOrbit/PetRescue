import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrescue/EditPost/colors.dart';
import 'package:petrescue/bloc/app_general/global.dart' as globals;

import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/repository/data/post_data.dart';
//library flutter_tagging;

class PostSecond extends StatefulWidget {
  const PostSecond({Key key, this.post}) : super(key: key);

  @override
  _PostSecondState createState() => _PostSecondState();
  final Post post;
}

class _PostSecondState extends State<PostSecond> {
  final Post post = Post.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#FFB9AC'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: GestureDetector(
                child: globals.PostButton(),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => PostSecond(),
                  //     ));
                },
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: HexColor('EBF3FA'),
                child: globals.file == null
                    ? Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          //color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: IconButton(
                                  iconSize: 50,
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : FittedBox(
                        child: Image.file(globals.file),
                        fit: BoxFit.fill,
                      )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 5),
                  child: Text('Nội dung', style: TextStyle(fontSize: 18)),
                )),
            Container(
              width: 365,
              height: 125,
              color: HexColor('EBF3FA'),
              child: TextField(
                onChanged: (text) {
                  widget.post.description = text;
                },
                maxLines: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tôi vừa thấy một con mèo...'),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                  child: Text('Tags', style: TextStyle(fontSize: 18)),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Container(
                height: 45,
                color: HexColor('#EBF3FA'),
                child: TextField(
                  onChanged: (text) {
                    post.petType = text;
                  },
                  decoration: InputDecoration(
                    //labelText: 'Name',
                    hintText: 'Nhập tag tóm tắt',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: PetRescueTheme.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                          child: Row(
                            children: [
                              Text(
                                'Gãy chân',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.warning,
                                  color: Colors.white, size: 12)
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
