import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const GoogleSignInButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: onPressed,
      child: Container(
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/google_light.svg"),
            Text(text),
          ],
        ),
      ),
    );
  }
}
