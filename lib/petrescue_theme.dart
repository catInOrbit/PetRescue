import 'package:flutter/material.dart';

class PetRescueTheme
{
   static final Color darkGreen = Color.fromRGBO(75, 134, 105, 1);
   static final Color lightPink = Color.fromRGBO(255, 128, 104, 1);
   static final Color orange = Color.fromRGBO(249, 151, 70, 1);
   static final Color lime = Color.fromRGBO(204, 202, 152, 1);
   static final Color lightGrey = Color.fromRGBO(235, 243, 250, 1);

   static List<Color> adoptPostTheme = [darkGreen, Colors.white]; //accent, keyword
   static List<Color> inRescuedPostTheme = [lime, Colors.white]; //accent, keyword

   static List<Color> requestRescuePostTheme = [Colors.white, lightPink];
   static List<Color> revertRescuePostTheme = [lightPink, Colors.white];
   static List<Color> statusTagsRescueTheme = [orange, Colors.white];
   static List<Color> revertAdoptPostTheme = [Colors.white, darkGreen]; //accent, keyword
   static List<Color> actionWordAdoptPostTheme = [darkGreen, Colors.white]; //accent, keyword
   static List<Color> actionWordRescuePostTheme = [Colors.orange, Colors.white]; //accent, keyword

}

enum PetRescueThemeColorType
{
   Accent, KeyWord
}