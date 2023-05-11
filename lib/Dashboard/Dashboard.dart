import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Documents/DocumentScreen.dart';
import '../Helper/globle style.dart';
import '../Profile/my_profile.dart';
import 'CheckCriteriaWithBot.dart';
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
    CheckCriteriaWithBot(),
    DocumentScreen(),
    CoustmerDetailScreen(),
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
    return WillPopScope(
      onWillPop: () => showAlertExit(),
      child: Scaffold(
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
            Icon(Icons.currency_rupee, size: 30,color: KWHITE_COLOR,),
            Icon(Icons.upload_file, size: 30,color: KWHITE_COLOR,),
            Icon(Icons.person, size: 30,color: KWHITE_COLOR,),
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
      ),
    );
  }

  Future<bool> showAlertExit() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[50],
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: Colors.black87),
          ),
          content: Wrap(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Do you want to exit App',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: const Text("Yes",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 13)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[200],
                                minimumSize: const Size(70, 30),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: ElevatedButton(
                              onPressed: () => {Navigator.pop(context)},
                              child: const Text("No",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 13)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[200],
                                minimumSize: const Size(70, 30),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
