import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petrescue/EditPost/colors.dart';
import 'package:petrescue/EditPost/edit_post_next.dart';
import 'package:petrescue/bloc/post/post/post_bloc.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petrescue/bloc/app_general/global.dart' as globals;
import 'package:path_provider/path_provider.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/postFeed/request_page.dart';

// File file;
class EditPost extends StatefulWidget {
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final Post post = Post.empty();
  File _saveImage;

  void pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    String path;
    await (getApplicationDocumentsDirectory())
        .then((value) => path = value.path);

    final File file = File(pickedFile.path);

    _saveImage = await file.copy('$path/' + DateTime.now().toIso8601String());
    post.imageThumbnail = _saveImage.path;

    setState(() {});
  }

  String strBtnSelectGender;
  static const genderItems = <String>['Đực', 'Cái'];
  final List<DropdownMenuItem<String>> _dropDownGenderItems = genderItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  String strBtnSelectMonthAge;
  static const monthsItems = <String>["Tháng", "Năm"];
  final List<DropdownMenuItem<String>> _dropDownMonthAgeItems = monthsItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor('#FFB9AC'),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Bài đăng nuôi nhận'),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostSecond(),
                      ));
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: HexColor('EBF3FA'),
                child: globals.file == null
                    ? Center(
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            //color: Colors.red,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: IconButton(
                                    iconSize: 50,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                Text(
                                  'Thêm Ảnh',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : FittedBox(
                        child: Image.file(globals.file),
                        fit: BoxFit.cover,
                      )
                //  Image.file(globals.file),
                ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Chi tiết',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                        child: Text(
                          'Tên',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Container(
                        height: 45,
                        color: HexColor('#EBF3FA'),
                        child: TextField(
                          onChanged: (text) {
                            post.title = text;
                          },
                          decoration: InputDecoration(
                            //labelText: 'Name',
                            hintText: 'Tên động vật',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Loài vật',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
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
                            hintText: 'Mèo nhà',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Địa điểm',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Container(
                        height: 45,
                        color: HexColor('#EBF3FA'),
                        child: TextField(
                          onChanged: (text) {
                            post.location = text;
                          },
                          decoration: InputDecoration(
                              //labelText: 'Name',
                              hintText: 'Chọn địa điểm...',
                              // border: OutlineInputBorder(
                              //     borderSide:
                              //         BorderSide(color: Colors.transparent)),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(Icons.gps_not_fixed),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 5, 15, 0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Giới tính',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 90,
                                  height: 40,
                                  color: HexColor('#EBF3FA'),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text('Chọn'),
                                      value: strBtnSelectGender,
                                      onChanged: ((String newValue) {
                                        post.gender = newValue;
                                        setState(() {
                                          strBtnSelectGender = newValue;
                                        });
                                      }),
                                      items: _dropDownGenderItems,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Tuổi',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    color: HexColor('#EBF3FA'),
                                    width: 54,
                                    height: 40,
                                    child: Center(
                                      child: TextField(
                                        onChanged: (text) {
                                          post.ages = text;
                                        },
                                        keyboardType:
                                            TextInputType.numberWithOptions(),
                                        decoration: InputDecoration.collapsed(
                                            hintText: '6-8'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    color: HexColor('E5E5E5'),
                                    width: 90,
                                    height: 40,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text('Tháng'),
                                        value: strBtnSelectMonthAge,
                                        onChanged: ((String newValue) {
                                          post.ages += " " + newValue;
                                          setState(() {
                                            strBtnSelectMonthAge = newValue;
                                          });
                                        }),
                                        items: _dropDownMonthAgeItems,
                                      ),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Nội dung bài đăng',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Container(
                        height: 100,
                        color: HexColor('#EBF3FA'),
                        child: TextField(
                          onChanged: (text) {
                            post.petType = text;
                          },
                          decoration: InputDecoration(
                            //labelText: 'Name',
                            hintText: 'Chi tiết về thú cần được nuôi nhận...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                    hintText: 'Nhập tag tóm tắt đặc điểm',
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
                    height:35,
                    decoration: BoxDecoration(
                      color: PetRescueTheme.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                          child: Row(
                            children: [Text('Mắt xanh', style: TextStyle(
                                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold
                            ),),
                              SizedBox(width: 5,),
                              Icon(Icons.close_rounded, color: Colors.white, size:12)
                            ],
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height:35,
                    decoration: BoxDecoration(
                      color: PetRescueTheme.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                          child: Row(
                            children: [Text('Lông đen', style: TextStyle(
                                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold
                            ),),
                              SizedBox(width: 5,),
                              Icon(Icons.close_rounded, color: Colors.white, size:12)
                            ],
                          )
                      ),
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

  Widget backButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.21),
        color: Color(0xfffffcfc),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
          ),
          Text(
            "Back",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

//Edit Post resuce
class CreateEditPostCapCuu extends StatefulWidget {
  @override
  _CreateEditPostCapCuuState createState() => _CreateEditPostCapCuuState();
}

class _CreateEditPostCapCuuState extends State<CreateEditPostCapCuu> {
  final Post post = Post.empty();
  File _saveImage;

  void pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    String path;
    await (getApplicationDocumentsDirectory())
        .then((value) => path = value.path);

    final File file = File(pickedFile.path);

    _saveImage = await file.copy('$path/' + DateTime.now().toIso8601String());
    post.imageThumbnail = _saveImage.path;

    setState(() {});
  }

  String strBtnSelectGender;
  static const genderItems = <String>['Đực', 'Cái'];
  final List<DropdownMenuItem<String>> _dropDownGenderItems = genderItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  String strBtnSelectMonthAge;
  static const monthsItems = <String>["Tháng", "Năm"];
  final List<DropdownMenuItem<String>> _dropDownMonthAgeItems = monthsItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

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
    return Scaffold(
      //backgroundColor: HexColor('#FFB9AC'),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Bài đăng cứu hộ'),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>RequestPostPage(listOfPost: listOfPosts, sortType: ["InRescuePost", "RequestPost"], postBloc: bloc,),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: HexColor('EBF3FA'),
                child: globals.file == null
                    ? Center(
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            //color: Colors.red,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: IconButton(
                                    iconSize: 50,
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                Text(
                                  'Thêm Ảnh',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : FittedBox(
                        child: Image.file(globals.file),
                        fit: BoxFit.cover,
                      )
                //  Image.file(globals.file),
                ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Chi tiết',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Độ ưu tiên',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 5,
                      children: [
                        RaisedButton(
                            textColor: priorityHigh ? Colors.white : null,
                            color:
                                priorityHigh ? PetRescueTheme.lightPink : null,
                            onPressed: () {
                              setState(() {
                                priorityHigh = true;
                                priorityLow = false;
                              });
                            },
                            child: Text('Cao',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              priorityHigh = false;
                              priorityLow = true;
                            });
                          },
                          textColor: priorityLow ? Colors.white : null,
                          color: priorityLow ? PetRescueTheme.lightPink : null,
                          child: Text(
                            'Thấp',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Loài vật',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

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
                            hintText: 'Mèo nhà',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Nội dung bài đăng',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Container(
                        height: 100,
                        color: HexColor('#EBF3FA'),
                        child: TextField(
                          onChanged: (text) {
                            post.petType = text;
                          },
                          decoration: InputDecoration(
                            //labelText: 'Name',
                            hintText: 'Hãy nói chi tiết để chúng mình có thể hỗ trợ tốt nhất...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Địa điểm, khu vực cứu hộ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Container(
                        height: 45,
                        color: HexColor('#EBF3FA'),
                        child: TextField(
                          onChanged: (text) {
                            post.location = text;
                          },
                          decoration: InputDecoration(
                              //labelText: 'Name',
                              hintText: 'Chọn địa điểm...',
                              // border: OutlineInputBorder(
                              //     borderSide:
                              //         BorderSide(color: Colors.transparent)),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(Icons.gps_not_fixed),
                              )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Phân loại',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 5,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          'Tình trạng',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
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

                            height:35,

                            decoration: BoxDecoration(
                              color: PetRescueTheme.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                child: Row(

                                  children: [Text('Gãy chân', style: TextStyle(
                                      color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(width: 5,),
                                  Icon(Icons.close_rounded, color: Colors.white, size:12)
                                  ],
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
