import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Helper/SizedConfig.dart';
import '../Helper/globle style.dart';
import '../Profile/my_profile.dart';
import '../Splash_Screen/car_assistants.dart';
import '../VehicleSearch/VehicleSearch.dart';
import 'Car_details_page.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'CheckCriteriaWithBot.dart';
import 'Emi_calculator.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Item {
  final String name;
  final String imageUrl;

  Item({required this.name, required this.imageUrl});
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [themeColor, themelightColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Welcome John',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new CoustmerDetailScreen()));
                //Profile
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeScreenState extends State<HomeScreen> {
  bool isApiCallProcessing = false;
  final List<Item> items = [
    Item(name: 'Vehicle search', imageUrl: 'assets/images/carsearch.png'),
    Item(name: 'Emi calculator', imageUrl: 'assets/images/calculatoremi.png'),
    Item(name: 'Fast tag', imageUrl: 'assets/images/fastag.png'),
    Item(name: 'Latest Car', imageUrl: 'assets/images/latestcar.png'),
    Item(name: 'RBI Repo Rate', imageUrl: 'assets/images/reporate.png'),
    Item(name: 'RTO Address', imageUrl: 'assets/images/rtoaddress.png'),
    Item(name: 'Used Car loan', imageUrl: 'assets/images/car_loan.png'),
    Item(name: 'CIBIL', imageUrl: 'assets/images/cibil.png'),
  ];
  late String name = "loading",
      emailid = "loading",
      mobile_no = "loading",
      dob = "";
  late String profile_pic = '';
  String image = "assets/images/img_10.png";
  late File icon_img;
  late File pickedImageFile;
  TextEditingController car_number = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  bool isIconSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      // AppBar(
      //   elevation: 0,
      //   backgroundColor:themeColor,
      //   //leading:
      //   // IconButton(
      //   //   icon: Icon(
      //   //     Icons.chevron_left,
      //   //     size: 25.0,
      //   //     color: Colors.white,
      //   //   ),
      //   //   onPressed: () {
      //   //     Navigator.of(context).pop();
      //   //   },
      //   // ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       //   Icon(
      //       //   Icons.person,
      //       //   color: Colors.white,
      //       //   size: 35,
      //       // ),
      //       SizedBox(
      //         width: 30,
      //       ),
      //       Text(
      //         "Welcome, John",
      //         style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new CoustmerDetailScreen()));
      //         //Profile
      //       },
      //       child: const Padding(
      //         padding: EdgeInsets.only(right: 10.0),
      //         child: Icon(
      //           Icons.person,
      //           color: Colors.white,
      //           size: 25,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body:
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  //color: themeColor,
                  gradient: LinearGradient(
                    colors: [themeColor, themelightColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: car_number,
                          decoration: InputDecoration(
                            hintText: 'Enter vehicle number',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            // Perform search action here
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => CarDetailScreen()));
                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CarDetailScreen()));
                          // Perform search action here
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Best Offer For You :",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: TextColor,
                      fontSize: 18,
                      fontFamily: 'InterRegular'),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 4.0,
                  child: Center(
                    child: CarouselSlider(
                      items: [
                        Image.asset('assets/images/img_13.png'),
                        Image.asset('assets/images/img_14.png'),
                        Image.asset('assets/images/img_15.png'),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Eligibility Criteria:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: TextColor,
                                fontSize: 18,
                                fontFamily: 'InterRegular',
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => CheckCriteriaWithBot(),
                                ));
                              },
                              icon: AvatarGlow(
                                glowColor: themeColor,
                                endRadius: 120,
                                duration: Duration(milliseconds: 2000),
                                repeat: true,
                                showTwoGlows: true,
                                curve: Curves.easeOutQuad,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.question_mark,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Card(
                            //     color: themeColor,
                            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            //     elevation: 4.0,
                            //     child: Padding(
                            //       padding: EdgeInsets.all(12.0),
                            //       child: Row(
                            //         children: [
                            //           Expanded(
                            //             child: Text(
                            //               'Check Here',
                            //               style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontSize: 15.0,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 1:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EMICalculatorUI()));
                                  break;
                                case 0:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CarAssistant()));
                                  break;
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  items[index].imageUrl,
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  items[index].name,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: items.length,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/call.gif',
                                width: 120,
                                height: 150,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Our Team will call you soon...",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeColor,
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                            ],
                          ),
                        ),
                      ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Check Your Eligibility Criteria:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: TextColor,
                        fontSize: 15,
                        fontFamily: 'InterRegular',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CheckCriteriaWithBot(),
                        ));
                      },
                      icon: AvatarGlow(
                        glowColor:themeColor,
                        endRadius: 120,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        curve: Curves.easeOutQuad,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.question_mark,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 1:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => EMICalculatorUI()));
                                  break;
                                case 0:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => VehicleSearchScreen()));
                                  break;
                                case 2:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 3:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 4:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 5:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),

                                  );
                                  break;
                                case 6:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 7:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;

                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  items[index].imageUrl,
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  items[index].name,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: items.length,
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Card(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         Image.asset(
                      //           'assets/images/call.gif',
                      //           width: 120,
                      //           height: 150,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Expanded(
                      //           child: Text(
                      //             "Our Team will call you soon...",
                      //             style: TextStyle(
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold,
                      //               color: themeColor,
                      //             ),
                      //           ),
                      //         ),
                      //         // SizedBox(
                      //         //   height: 5,
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/call.gif',
                        width: 120,
                        height: 150,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Our Team will call you soon...",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
