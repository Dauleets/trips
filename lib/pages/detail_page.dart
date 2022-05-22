import 'package:flutter/material.dart';
import 'package:travel/mics/colors.dart';
import 'package:travel/widget/responsive_buttun.dart';
import 'package:travel/widget/text/app_large_text.dart';

import '../widget/appButtuns.dart';
import '../widget/text/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/moun1.jpeg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 45,
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 30,
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 30),
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //text: Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      AppLargeText(text: "Yosemite",color: AppColors.black.withOpacity(0.8)),
                      AppLargeText(text: "\$ 250",color: AppColors.mainColor,)
                      
                    ],),
                    //text: location
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        AppText(text: "USA, California",color: AppColors.textColor1,),
                      ],
                    ),
                    //icons STAR
                    SizedBox(height: 20,),
                    Row(
                      children: [ 
                        Wrap(
                            children: List.generate(5, (index){
                              return Icon(Icons.star, color: index<gottenStars?AppColors.starColor:AppColors.textColor2);
                            }), 
                        ),
                        AppText(text: "(4.0)", color: AppColors.textColor2,)
                      ]
                    ),
                    //text: People
                    SizedBox(height: 25,),
                    AppLargeText(text: "People", color: Colors.black.withOpacity(0.8),size: 20,),
                    //text: people- Subtitle 
                    SizedBox(height: 5,),
                    AppText(text: "Number of people in your group", color: AppColors.mainTextColor),
                    //appButtons
                    SizedBox(height: 10,),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 60,
                              color: selectedIndex==index?AppColors.white:AppColors.black, 
                              backgroundColor: selectedIndex==index?AppColors.black:AppColors.buttonBackground,  
                              borderColor: selectedIndex==index?AppColors.black:AppColors.buttonBackground,
                              text: (index+1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    //text: Description
                    SizedBox(height: 20,),
                    AppLargeText(text: "Description", color: AppColors.black.withOpacity(0.8),),
                    SizedBox(height: 10,),
                    AppText(text: "You must go for a travel.Travelling, helps get rid of pressure. Go to the mountains too see the nature.",
                    color: AppColors.mainTextColor,)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60, 
                    color: AppColors.textColor2, 
                    backgroundColor: AppColors.white, 
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border
                  ),
                  SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}