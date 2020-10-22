import 'package:flutter/material.dart';

// class NotificationWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Container(
//         width: 350,
//         height: 150,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(28),
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   padding: const EdgeInsets.only(
//                     left: 9,
//                     right: 8,
//                     top: 2,
//                     bottom: 3,
//                   ),
//                   child: Text(
//                     "08/21/2020",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: "Roboto",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//
//                 Text(
//                   "14:52",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontStyle: FontStyle.italic,
//                     fontFamily: "Roboto",
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 10,),
//
//             // Container(
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.circular(13),
//             //     color: Colors.white,
//             //   ),
//             //   padding: const EdgeInsets.symmetric(
//             //     horizontal: 10,
//             //     vertical: 12,
//             //   ),
//             //   child: Column(
//             //     mainAxisSize: MainAxisSize.min,
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Row(
//             //         mainAxisSize: MainAxisSize.min,
//             //         children: [
//             //           Padding(
//             //             padding: const EdgeInsets.only(
//             //               top: 5,
//             //               bottom: 9,
//             //             ),
//             //             child: Opacity(
//             //               opacity: 0.50,
//             //               child: Container(
//             //                 width: 45,
//             //                 height: 40.50,
//             //                 color: Color(0xff4b8669),
//             //               ),
//             //             ),
//             //           ),
//             //           SizedBox(width: 18),
//             //           Column(
//             //             mainAxisSize: MainAxisSize.min,
//             //             crossAxisAlignment: CrossAxisAlignment.center,
//             //             children: [
//             //               SizedBox(
//             //                 width: 256,
//             //                 height: 29,
//             //                 child: Text(
//             //                   "Request accepted",
//             //                   style: TextStyle(
//             //                     color: Color(0xff4b8669),
//             //                     fontSize: 20,
//             //                     fontFamily: "Roboto",
//             //                     fontWeight: FontWeight.w900,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(height: 10),
//             //               Text(
//             //                 "User accepted your adoption request",
//             //                 style: TextStyle(
//             //                   color: Colors.black,
//             //                   fontSize: 16,
//             //                   fontFamily: "Roboto",
//             //                   fontWeight: FontWeight.w300,
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             NotificationDisplay(),
//             NotificationDisplay()
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// Widget NotificationDisplay()
// {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(13),
//       color: Colors.white,
//     ),
//     padding: const EdgeInsets.symmetric(
//       horizontal: 10,
//       vertical: 12,
//     ),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 5,
//                 bottom: 9,
//               ),
//               child: Opacity(
//                 opacity: 0.50,
//                 child: Container(
//                   width: 45,
//                   height: 40.50,
//                   color: Color(0xff4b8669),
//                 ),
//               ),
//             ),
//             SizedBox(width: 18),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 256,
//                   height: 29,
//                   child: Text(
//                     "Request accepted",
//                     style: TextStyle(
//                       color: Color(0xff4b8669),
//                       fontSize: 20,
//                       fontFamily: "Roboto",
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "User accepted your adoption request",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontFamily: "Roboto",
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }


class NotifiSecond extends StatefulWidget {
  @override
  _NotifiSecondState createState() => _NotifiSecondState();
}

class _NotifiSecondState extends State<NotifiSecond> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Container clicked");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,10,0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.email),
                  SizedBox(width: 10,),
                  Text('Requested Accepted', style: TextStyle(
                    fontSize: 13
                  ),),
                  SizedBox(width: 20,),
                  Text('11:15',style: TextStyle(
                      fontSize: 12,
                    color: Colors.black45
                  ),)
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  Text("We are processing your request", style: TextStyle(
                    fontSize: 20
                  ),)
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  Text('User accepted your adoption request',
                  style: TextStyle(fontSize: 15),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

