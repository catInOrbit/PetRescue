import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';

class PostBody extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
     return Column(

       children: [
         ListTile(
           leading: CircleAvatar(
             backgroundImage: AssetImage(
               "lib/assets/profile_icon.png",
             ),
           ),
           title: DateTimeTitle("1212"),
         ),
         Container(
           height: 800,
           child: Stack(
             alignment: Alignment.center,
             children: [
                Positioned(
                  top: 10,
                  child: ImageSection(),
                ),

               Positioned(
                 child: BodyCard(),
               )
             ],
           )
         ),
       ],
     );
  }

  Widget StatusBarFull()
  {
     return Padding(
       padding: EdgeInsets.all(12),
       child: FittedBox(
         alignment: Alignment.center,
         child:
         Container(
           alignment: Alignment.center,
           width: 50,
           height: 20,
           decoration: BoxDecoration(
           borderRadius: const BorderRadius.all(Radius.circular(20)),
             color: Colors.redAccent
           ),
             child: Text(
               "Status Bar",
               style: TextStyle(
                   color: Colors.white,
                 fontSize: 10
               ),
             ),
         ),
       ),
     );
  }

  Widget StatusBarMoreIndicator(int numOfStatus)
  {
    return Padding(
      padding: EdgeInsets.all(12),
      child: FittedBox(
        alignment: Alignment.center,
        child:
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent
          ),
          child: Text(
            "3+",
            style: TextStyle(
                color: Colors.white,
                fontSize: 10
            ),
          ),
        ),
      ),
    );
  }

  Widget ImageSection()
  {
      return  Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("lib/assets/template_cat.png",
            height: 300,
            width: 350,
          ),
        ),
      );
  }

  Widget BodyCard()
  {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(2, 2),
                blurRadius: 8,
              ),
            ],
          ),

          child: InkWell(
            onTap: (){},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor   Lorem ipsum dolor sit amet, consectetur "),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: StatusBarFull(),
                      ),
                    ),



                    Expanded(
                      child: Container(
                        child: StatusBarFull(),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: StatusBarMoreIndicator(5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget PostCard()
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(

        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  "lib/assets/profile_icon.png",
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              title: DateTimeTitle("1212"),
            ),
            PostBody()
          ],
        ),
        onTap: (){},
      ),
    );
  }

  Widget DateTimeTitle(String textData)
  {
     return Padding(
       padding: EdgeInsets.all(10),
       child: Container(
         width: 50,
         height: 30,
         child: FittedBox(
           alignment: Alignment.center,
           child: Container(
             decoration: BoxDecoration(
                 borderRadius: const BorderRadius.all(Radius.circular(26)),
                 color: HexColor("#F6CC9F")
             ),
             child: Text(
               textData,
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 10
               ),
             ),
           ),
         ),
       ),
     );
  }
}
