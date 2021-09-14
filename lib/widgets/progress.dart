import 'package:flutter/material.dart';
import 'package:petrescue/models/post_model.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/profile/SilverAppBar.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/widgets/common.dart';
import 'package:petrescue/widgets/detail_model_bottom.dart';

import 'detail_card.dart';

class Progress extends StatelessWidget {
  final Post postModel;

  const Progress({Key key, this.postModel}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    List<Color> colorScheme;

    if (postModel.postType == PostType.AdoptPost)
      colorScheme = PetRescueTheme.adoptPostTheme;
    else if (postModel.postType == PostType.RequestPost)
      postModel.priority == Priority.Normal
          ? colorScheme = PetRescueTheme.rescuePostTheme : colorScheme = PetRescueTheme.rescuePostPrioritizedTheme ;
    else if (postModel.postType == PostType.InRescuePost)
      colorScheme = PetRescueTheme.inRescuePostTheme;



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //TODO: Fix constraint
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailCard(
                            postModel: postModel,
                            isEditing: false,
                            defaultTabIndex: 1,
                          )));
            },
            child: Container(
              width: 380,
              child: Column(
                children: [
                  Container(),
                  Column(
                    children: [
                      Container(
                        width: 380,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  postModel.imageThumbnail), fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x00ffffff), Colors.black],
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 11,
                          bottom: 42,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 92),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color:
                      colorScheme[PetRescueThemeColorType.Accent.index],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                            children: [

                              PostHeaderRibbon(postModel: postModel,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: UserInfoRibon(
                                      isDetailRibbon: false,
                                      postModel: postModel,
                                    ),
                                  ),
                                  showResponsibleUserRibon(postModel),
                                ],
                              ),
                            ]
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            postModel.title,
                            style: TextStyle(
                              color: colorScheme[PetRescueThemeColorType
                                  .Text.index],
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Động vật:",
                                      style: TextStyle(
                                        color: colorScheme[PetRescueThemeColorType
                                            .Text.index],
                                        fontSize: 20,
                                        fontFamily: "Lato",
                                        fontStyle:  FontStyle.normal,
                                      ),
                                    ),

                                    SizedBox(width: 20,),

                                    Text(
                                      postModel.petType,
                                      style: TextStyle(
                                          color: colorScheme[PetRescueThemeColorType
                                              .Text.index],
                                          fontSize: 20,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(width: 20,),

                                    VerticalDivider(width: 1, thickness: 2, color: Colors.black,),

                                  ],

                                ),

                                SizedBox(height: 10,),

                                if(postModel.postType == PostType.AdoptPost)
                                  Column(
                                    children: [
                                      Row(

                                        children: [

                                          Text(
                                            "Giống:",
                                            style: TextStyle(
                                              color: colorScheme[PetRescueThemeColorType
                                                  .Text.index],
                                              fontSize: 20,
                                              fontFamily: "Lato",
                                              fontStyle:  FontStyle.normal,
                                            ),
                                          ),

                                          SizedBox(width: 20,),

                                          Text(
                                            postModel.breed,
                                            style: TextStyle(
                                                color: colorScheme[PetRescueThemeColorType
                                                    .Text.index],
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                        ],

                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [

                                          Text(
                                            "Giới tính:",
                                            style: TextStyle(
                                              color: colorScheme[PetRescueThemeColorType
                                                  .Text.index],
                                              fontSize: 20,
                                              fontFamily: "Lato",
                                              fontStyle:  FontStyle.normal,
                                            ),
                                          ),

                                          SizedBox(width: 20,),

                                          if(postModel.gender == "Female")
                                            Image.asset("lib/assets/female_gender_icon.jpeg", height: 25,)
                                          else
                                            Image.asset("lib/assets/male_gender_icon.png", height: 25,)
                                        ],

                                      ),
                                    ],
                                  )

                              ],
                            ),
                          ),
                        ),


                        //Contact button and action keyword
                        if(postModel.postType == PostType.AdoptPost )
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: [
                                Text("Yêu cầu nhận nuôi:", style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme[PetRescueThemeColorType.Text.index]

                                ),),
                                CustomAvatars(postModel: postModel,),
                              ],
                            ),
                          ),


                        Divider(
                          color: colorScheme[PetRescueThemeColorType.Icon
                              .index],
                          thickness: 0.5,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: colorScheme[PetRescueThemeColorType.Icon.index],),
                              SizedBox(width: 20,),
                              Text("Cách bạn 2.7km", style: TextStyle(
                                  color: colorScheme[PetRescueThemeColorType.Text.index],fontSize: 18,
                                  fontWeight: FontWeight.w300
                              )),

                              SizedBox(width: 10,),

                              Text("Xem bản đồ", style: TextStyle(
                                color: Colors.cyan,fontSize: 16,
                                decoration: TextDecoration.underline,
                              )),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                          child: Text(postModel.location,
                            style: TextStyle(color: colorScheme[PetRescueThemeColorType.Text.index], fontSize: 18, fontStyle: FontStyle.normal),
                          ),
                        ),

                        Divider(
                          color: colorScheme[PetRescueThemeColorType.Icon
                              .index],
                          thickness: 0.5,
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 30),
                          child: Row(
                            children: [
                              Container(
                                child: Wrap(
                                  spacing: 2,
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  children: getAllCategory(postModel),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
