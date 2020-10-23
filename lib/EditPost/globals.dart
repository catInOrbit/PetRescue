
library globals;

import 'dart:io';

import 'package:flutter/material.dart';

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
          width: 70.51,
          height: 22.72,
          child: Text(
            "Proceed",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 10.19),
        Container(
          width: 12.75,
          height: 11.28,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Opacity(
                    opacity: 0.50,
                    child: Container(
                      width: 6.88,
                      height: 11.28,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 0.50,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -67.69,
                top: 6.36,
                child: Opacity(
                  opacity: 0.50,
                  child: Container(
                    width: 12.02,
                    height: 2.47,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
