import 'package:flutter/material.dart';
import 'package:travel/mics/colors.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/widget/text/app_large_text.dart';
import 'package:travel/widget/text/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images = {
    "hot-air-balloon.png" : "Ballooning",
    "mountains.png" : "Hiking",
    "rafting.png" : "Kayaking",
    "scuba.png" : "Snorkling",

  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //menu text
          Container(
            margin: const EdgeInsets.only(top: 70,left: 20,right: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.menu, size: 30,color: AppColors.black,),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10) 
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          //Discover Text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 20,),
          //TabBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 25,right: 25),
                controller: _tabController,
                labelColor: AppColors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndecator(color: AppColors.mainColor,radius: 4),
                tabs: [
                  Tab(text: "Plasec",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions")
                ]
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                    scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return OutlineButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                        },
                        borderSide: BorderSide(color: AppColors.white, width: 0),
                      child: Container(
                        margin: const EdgeInsets.only(right: 15,top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.buttonBackground,
                        image: DecorationImage(
                          image: AssetImage("assets/moun1.jpeg"),
                        fit: BoxFit.cover
                        )
                      ),
                                      ),
                    );
                }),
                Text("There"),
                Text("Bye")
              ],
            ),
          ),
          //Explore Text
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(right: 20,left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more",size: 22,),
                AppText(text: "See all", color:  AppColors.textColor1,)
              ],
            ),
          ),
          //Apps List
          SizedBox(height: 10,),
          Container(
              margin: const EdgeInsets.only(left: 20),
              height: 120,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                        // margin: const EdgeInsets.only(right: 50),  
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                            color: AppColors.buttonBackground,
                        ),
                        padding: EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/"+images.keys.elementAt(index)),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: AppText(
                        text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    )
                    ]
                    ),
                  );
                },
              ),
          )
        ],

      ),
    );
  }
  onPressed(){

  }
}

class CircleTabIndecator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndecator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _Circlepainter(color: color,radius: radius);
  }
}

class _Circlepainter extends BoxPainter{
  final Color color;
  double radius;
  _Circlepainter({required this.color,required this.radius});
  @override
  void paint(
    Canvas canvas,Offset offset, ImageConfiguration configuration){
      Paint _paint = Paint();
      _paint.color=color;
      _paint.isAntiAlias=true;
      final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-radius);
      canvas.drawCircle(offset+circleOffset,radius,_paint);     
  }
  
}