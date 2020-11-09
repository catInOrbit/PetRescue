import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/petrescue_theme.dart';

class NotifiSecond extends StatefulWidget {
  @override
  _NotifiSecondState createState() => _NotifiSecondState();
}

class _NotifiSecondState extends State<NotifiSecond> {
  @override
  Widget build(BuildContext context) {
    return currentUser.isVerifyRescueCenter == true ? Column(
      children: [
        //1
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color: PetRescueTheme.lightPink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu cứu hộ',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.lightPink),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '11:15',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Chấp nhận yêu cầu cứu hộ",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Bạn đã chấp nhận yêu cầu cứu hộ vào lúc 11:15',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
        //2
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.pets_outlined,
                          color: PetRescueTheme.darkGreen,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu nuôi nhận',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.darkGreen),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '10:15',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Nhận yêu cầu nuôi nhận chó, mèo",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Bạn đã có thêm 1 người mong muốn nhận nuôi  chú chó.',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
        //3
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color: PetRescueTheme.lightPink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu cứu hộ',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.lightPink),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '10:05',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Thay đổi trạng thái giải cứu thành công",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Bạn đã thay đổi trạng thái đã an toàn cho 1 đơn cứu hộ',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
        //4
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color: PetRescueTheme.lightPink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu cứu hộ',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.lightPink),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '19/10/2020 8:05',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Hủy đơn cứu hộ",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Người đăng đã hủy đơn cứu hộ mà bạn tiếp nhận',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
      ],
    ) : Column(
      children: [
        //1
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color: PetRescueTheme.lightPink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu cứu hộ',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.lightPink),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '11:15',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          " Yêu cầu cứu hộ được tiếp nhận.",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Yêu cầu cứu hộ của bạn đã được 1 trạm tiếp nhận.',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
        //2
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.pets_outlined,
                          color: PetRescueTheme.darkGreen,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu nuôi nhận',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.darkGreen),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '10:15',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Yêu cầu nuôi nhận chó, mèo",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Yêu cầu của bạn đã được chấp nhận.',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
        //3
        Slidable(
          child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color: PetRescueTheme.lightPink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yêu cầu cứu hộ',
                          style: TextStyle(
                              fontSize: 13, color: PetRescueTheme.lightPink),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '19/10/2020 8:05',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Hủy đơn cứu hộ",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Bạn hủy đơn cứu hộ ',
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Xóa',
              color: Colors.red,
              icon: Icons.delete,
              //onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ),
      ],
    );
  }
}


//click vào noti thì đi đến đơn đó. xử lý sau