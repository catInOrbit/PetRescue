library petrescue.global;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/repository/data/user_list.dart';

Widget selectedTab = null;
User currentUser = userList[2];

File file;

Widget proceedButton() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26.50),
      color: Color(0xffff8068),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 13,
      vertical: 9,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 80,
          height: 22.72,
          child: Text(
            "Tiếp theo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

      ],
    ),
  );
}

Widget PostButton() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26.50),
      color: Color(0xffff8068),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 13,
      vertical: 9,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          height: 22.72,
          child: Text(
            "Đăng",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

      ],
    ),
  );
}

