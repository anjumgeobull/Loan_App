import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Helper/SizedConfig.dart';
import '../Documents/UploadDocumentScreen.dart';
import '../Helper/globle style.dart';
import '../Profile/my_profile.dart';
import '../Splash_Screen/car_assistants.dart';
import 'Car_details_page.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'CheckCriteriaWithBot.dart';
import 'Emi_calculator.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _pageController = PageController(initialPage: 0);
  int maxCount = 4;

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    CoustmerDetailScreen(),
    upload_documentDetailScreen(),
    CheckCriteriaWithBot(),
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ?
       CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: KWHITE_COLOR),
          Icon(Icons.person, size: 30,color: KWHITE_COLOR,),
          Icon(Icons.upload_file, size: 30,color: KWHITE_COLOR,),
          Icon(Icons.currency_rupee, size: 30,color: KWHITE_COLOR,),
        ],
        color: themeColor,
        buttonBackgroundColor: themeColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.jumpToPage(_page.toInt());
          });
        },
        letIndexChange: (index) => true,
      )
          : null,
    );
  }
}
