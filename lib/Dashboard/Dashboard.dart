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

import 'home_screen (3).dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _pageController = PageController(initialPage: 1);
  int maxCount = 4;

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    CoustmerDetailScreen(),
    upload_documentDetailScreen(),
    CheckCriteriaWithBot(),
  ];

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
          ? AnimatedNotchBottomBar(
        pageController: _pageController,
        color: Colors.white,
        showLabel: false,
        notchColor: themeColor,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: themeColor,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: themeColor,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.white,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.upload_file,
              color: themeColor,
            ),
            activeItem: Icon(
              Icons.upload_file,
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.currency_rupee,
              color: themeColor,
            ),
            activeItem: Icon(
              Icons.currency_rupee,
              color: Colors.white,
            ),
            itemLabel: 'Page 4',
          ),
        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      )
          : null,
    );
  }
}
