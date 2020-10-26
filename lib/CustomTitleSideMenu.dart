import 'package:flutter/material.dart';

class CustomListSideMenuBar extends StatelessWidget {

  IconData icon;
  String text;
 // Widget onTap;
  Function onTap;
  CustomListSideMenuBar(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
      child: InkWell(
        // onTap: () {
        //   Navigator.push(context,
        //   MaterialPageRoute(builder: (_) => onTap));
        // },
        onTap: onTap,
        splashColor: Colors.black12,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,
                    style: TextStyle(
                        fontSize: 16
                    ),),
                ),
              ],),

              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
