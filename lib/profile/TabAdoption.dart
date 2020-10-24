import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

class PageAdoption extends StatefulWidget {
  @override
  _PageAdoptionState createState() => _PageAdoptionState();
}

class _PageAdoptionState extends State<PageAdoption> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: Column(
          children: <Widget>[
            // GestureDetector(
            //   onTap: (){},
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 140,
            //     padding: EdgeInsets.fromLTRB(10.0,0,10,5),
            //     // decoration: BoxDecoration(
            //     //   border: Border(
            //     //     bottom: BorderSide(
            //     //       width: 0.5
            //     //     )
            //     //   )
            //     // ),
            //     child: Material(
            //       elevation: 4.0,
            //       borderRadius: BorderRadius.circular(5.0),
            //
            //       child:Row(
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(5,0,10,0),
            //             child: CircleAvatar(
            //               radius: 50,
            //             ),
            //           ),
            //           Expanded(
            //             child: Container(
            //               // height: 100,
            //               // width: 245,
            //               // color: Colors.red,
            //               child: Column(
            //                 children: <Widget>[
            //                   Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Text(
            //                       "Mao Trach Dong",
            //                       style: TextStyle(
            //                         color: Color(0xff4b8669),
            //                         fontSize: 20,
            //                         fontFamily: "Roboto",
            //                         fontWeight: FontWeight.w900,
            //                       ),
            //                     ),
            //                   ),
            //                   Align(
            //                       alignment: Alignment.centerLeft,
            //                       child: Text("Dog")),
            //                   SizedBox(height: 5,),
            //                   Align(
            //                     alignment: Alignment.centerLeft,
            //                     child: Text(
            //                       "Has been raised for 2 months",
            //                       style: TextStyle(
            //                         color: Colors.black,
            //                         fontSize: 15,
            //                         fontFamily: "Roboto",
            //                         fontWeight: FontWeight.w300,
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(height: 5,),
            //                   Align(
            //                     alignment: Alignment.centerRight,
            //                     child: Row(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: <Widget>[
            //                         Text("Ha Noi"),
            //                         Icon(Icons.location_on)
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PetAdoptionWidget(),
                SizedBox(width: 20,),
                PetAdoptionWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PetAdoptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Cat2.png'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Text("Miu Miu", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,),
                SizedBox(width: 10,),
                Text("Male",style: TextStyle(
                  color: Colors.white,
                  fontSize: 13
                ),)
              ],),

              SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    "Special Dog English, Husky, beautiful, white, adfsdf",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "9 months age",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
             // SizedBox(height: 5,),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Has been raised for 2 months",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

              ),

          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Ha Noi",
            style: TextStyle(
                fontSize: 12, color: Colors.white),),
                Icon(Icons.location_on, color: Colors.white, size: 12,)
              ],
            ),)
            ],
          ),
        ),
      ),
    );
  }
}


