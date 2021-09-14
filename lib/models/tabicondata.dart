import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'lib/assets/mdi_perm_identity.png',
      selectedImagePath: 'lib/assets/mdi_perm_identity.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/mdi_pets.png',
      selectedImagePath: 'lib/assets/mdi_pets.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/mdi_rss_feed.png',
      selectedImagePath: 'lib/assets/mdi_rss_feed.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/mdi_settings.png',
      selectedImagePath: 'lib/assets/mdi_settings.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
