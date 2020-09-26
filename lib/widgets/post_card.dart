import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petrescue/main.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        SizedBox(height: 5,),
        Container(
          height: 900,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child:TopPostInfoSection(),
              ),
              Positioned(
                top: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("lib/assets/template_cat.png",
                    height: 500,
                    width: 350,
                  ),
                ),
              ),

              Positioned(
                top: 300,
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
                                  child: StatusBar(),
                                ),
                              ),

                            Expanded(
                              child: Container(
                                child: StatusBar(),
                              ),
                            )

                          ],
                        )
                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget StatusBar()
  {
     return Padding(
       padding: EdgeInsets.all(12),
       child: FittedBox(
         alignment: Alignment.center,
         child: Container(
           decoration: BoxDecoration(
           borderRadius: const BorderRadius.all(Radius.circular(26)),
             color: Colors.redAccent
           ),
             child: Text("Status Bar", ),
         ),
       ),
     );
  }

  Widget TopPostInfoSection()
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              trailing: Text(
                "trailing",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
        onTap: (){},
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
