import 'package:flutter/material.dart';
import 'package:travel/mics/colors.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navpages/main_pages.dart';
import 'package:travel/widget/text/app_text.dart';

 class ResponsiveButton extends StatelessWidget {
   bool? isResponsive;
   double? width;
   ResponsiveButton({ Key? key,this.isResponsive = false, this.width=120}) : super(key: key);
   bool isElaveted = false;
   
   @override
   Widget build(BuildContext context) {
     return Flexible(
       child: OutlineButton(
         onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
           },
           borderSide: BorderSide(width: 0, color: AppColors.white),
         child: Container(
           width: isResponsive==true?double.maxFinite:width,
           height: 60,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.mainColor 
           ),
           child: Row(
             mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
             children: [
               isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),child: AppText(text: "Book Trip Now", color: AppColors.white,)):Container(),
                // Image.asset("assets/arrow-rigth.png")
               Container(margin: const EdgeInsets.only(right: 20),child: Align(alignment: Alignment.center, child: Text("Next",style: TextStyle(color: AppColors.white, fontSize: 20),),))
             ],
           )
         ),
       ),
     );
   }
 }

 