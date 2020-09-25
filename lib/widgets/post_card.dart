import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
     return Padding(
       padding: EdgeInsets.symmetric(vertical: 5),
       child: InkWell(
         child: Container(
           decoration: BoxDecoration(
             borderRadius: const BorderRadius.all(Radius.circular(16))
           ),
           
           child: Column(
             children: [
               ListTile(
                 leading: CircleAvatar(
                   backgroundImage: AssetImage("lib/assets/profile_icon.png"),
                 ),
                 contentPadding: EdgeInsets.all(2),
                 title: Column(
                   children: [
                     Text("Placeholder"),
                     Row(children: [
                       DateTimeTitle("Time"),
                       DateTimeTitle("12/12/12"),
                      ],
                     )
                   ],
                 ),
               ),
               
               Image.asset("lib/assets/placeholder_post_img.png",
                 height: 170,
                 width: MediaQuery.of(context).size.width,
                 fit: BoxFit.cover
               )
             ],
             
           ),
         ),
       ),
     );
  }

  Widget DateTimeTitle(String textData)
  {
     return Padding(
       padding: EdgeInsets.all(30),
       child: Container(
         width: 50,
         height: 20,
         decoration: new BoxDecoration(
             color: HexColor("#F6CC9F"),
             shape: BoxShape.rectangle,
             borderRadius: BorderRadius.all(Radius.circular(0))
         ),

         child: Text(textData)
       ),
     );
  }
}
