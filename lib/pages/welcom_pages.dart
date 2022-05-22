import 'package:flutter/material.dart';
import 'package:travel/widget/text/app_text.dart';

import '../mics/colors.dart';
import '../widget/responsive_buttun.dart';
import '../widget/text/app_large_text.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({ Key? key }) : super(key: key);

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = [
    "welcom1.png",
    "welcom3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,

        itemCount: images.length,
        itemBuilder: (_,index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/"+images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppLargeText(text: "Trips",color: AppColors.black,),
                      AppText(text: "Mountain", size: 30,color: AppColors.black),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Mounutain hikes give you an incredible sense of freedom along with along endurance test",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40,),
                      ResponsiveButton(width: 120,)
                    ],
                  ),
                  Column(
                    children: 
                     List.generate(2, (indexDots) => 
                        Container(
                         margin: const EdgeInsets.only(bottom: 2), 
                         width: 8,
                         height: index == indexDots ? 25:8,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: index == indexDots?Colors.grey.withOpacity(0.7):Colors.grey.withOpacity(0.3)
                         ),
                       )
                     ),
                  )
                ]
              ),
            ),
          );
        },
      )
    );
  }
}