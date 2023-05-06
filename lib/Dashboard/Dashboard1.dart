
import 'dart:core';
import 'package:flutter/material.dart';
import '../Documents/UploadDocumentScreen.dart';
import '../Helper/globle style.dart';
import '../Profile/my_profile.dart';
import 'CheckCriteriaWithBot.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_screen (3).dart';

class Dashboard1 extends StatefulWidget {
  Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard1> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    CoustmerDetailScreen(),
    upload_documentDetailScreen(),
    CheckCriteriaWithBot(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.person, size: 30),
        Icon(Icons.upload_file, size: 30),
        Icon(Icons.currency_rupee, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: themeColor,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    ),
      extendBody: true,
        body: Container(
          color: themeColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
