import 'package:flutter/material.dart';
import 'package:travel/mics/colors.dart';
import 'package:travel/pages/navpages/bar_item_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navpages/my_page.dart';
import 'package:travel/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonBackground,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.buttonBackground,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "",icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}