import 'package:flutter/material.dart';

class PetRescueTheme
{
   static final Color darkGreen = Color.fromRGBO(75, 134, 105, 1);
   static final Color lightPink = Color.fromRGBO(255, 128, 104, 1);
   static final Color orange = Color.fromRGBO(249, 151, 70, 1);
   static final Color lime = Color.fromRGBO(204, 202, 152, 1);
   static final Color lightGrey = Color.fromRGBO(235, 243, 250, 1);

   static List<Color> rescuePostTheme = [Colors.white, Colors.white, Colors.black, lightPink]; //accent, keyword, text, icon
   static List<Color> rescuePostPrioritizedTheme = [lightPink, Colors.white, Colors.white, Colors.white]; //accent, keyword, text, icon
   static List<Color> adoptPostTheme = [Colors.white, Colors.black, Colors.black, darkGreen]; //accent, keyword
   static List<Color> inRescuePostTheme = [lime, lime, Colors.white, Colors.white]; //accent, keyword


   static List<Color> inRescuedPostTheme = [Colors.white, lime]; //accent, keyword
   static List<Color> homePageInRescue = [lime, Colors.white]; //accent, keyword
   static List<Color> homePageAdoptPost = [darkGreen, Colors.white]; //accent, keyword


   static List<Color> requestRescuePostTheme = [Colors.black, Colors.white];
   static List<Color> revertRescuePostTheme = [lightPink, Colors.white];
   static List<Color> statusTagsRescueTheme = [orange, Colors.white];
   static List<Color> statusTagsAdoptPostTheme = [darkGreen, Colors.white];
   static List<Color> revertAdoptPostTheme = [darkGreen, Colors.white]; //accent, keyword

   static List<Color> actionWordInRescuePostTheme = [lime, Colors.white]; //accent, keyword
   static List<Color> actionWordRescuePostTheme = [lightPink, Colors.white]; //accent, keyword
   static List<Color> actionWordAdoptPostTheme = [darkGreen, Colors.white]; //accent, keyword

   static List<Color> userRibbonRescuePostTheme = [Colors.white, Colors.black];
   static List<Color> adoptPostStatusTheme = [Colors.white, Colors.black]; //accent, keyword




}

enum PetRescueThemeColorType
{
   Accent, KeyWord, Text, Icon
}