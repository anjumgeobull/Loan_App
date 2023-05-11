import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Helper/SizedConfig.dart';
import '../Dashboard/Car_details_page.dart';
import '../Dashboard/CheckCriteriaWithBot.dart';
import '../Dashboard/Emi_calculator.dart';
import '../Helper/globle style.dart';
import '../Profile/my_profile.dart';
import '../Splash_Screen/car_assistants.dart';
import 'package:avatar_glow/avatar_glow.dart';


class VehicleSearchScreen extends StatefulWidget {
  VehicleSearchScreen({Key? key}) : super(key: key);

  @override
  State<VehicleSearchScreen> createState() => _VehicleSearchScreenState();
}
class Item {
  final String name;
  final String imageUrl;

  Item({required this.name, required this.imageUrl});
}
class _VehicleSearchScreenState extends State<VehicleSearchScreen> {
  bool isApiCallProcessing = false;
  final List<Item> items = [
    Item(name: 'Latest Car', imageUrl: 'assets/images/latestcar.png'),
    Item(name: 'RBI Repo Rate', imageUrl: 'assets/images/reporate.png'),
    Item(name: 'RTO Address', imageUrl: 'assets/images/rtoaddress.png'),
    Item(name: 'CIBIL', imageUrl: 'assets/images/cibil.png'),
  ];
  late String name = "loading",
      emailid = "loading",
      mobile_no = "loading",
      dob = "";
  late String profile_pic = '';
  String image = "assets/images/Vagnera.png";
  late File icon_img;
  late File pickedImageFile;
  TextEditingController emailId = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  bool isIconSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[20],
        appBar: AppBar(
          elevation: 0,
          backgroundColor:themeColor,
          leading:
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 25.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Column(
            children: [

              Text(
                "Search Vehicle",
                style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ],
          ),

        ),
        body: SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: themeColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Enter The Vehicle Number",
                          style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child:
                            TextField(
                              controller: emailId,
                              decoration: InputDecoration(
                                hintText: 'DL 1CXA 8010',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {
                                // Perform search action here
                              },
                            ),

                          ),
                          IconButton(
                            icon: Icon(Icons.search,size: 43,color: Colors.white,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDetailScreen()));
                              // Perform search action here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Recent Search",
                  style:TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            image,
                            width: 50,
                            height: 80,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   [

                            Text("MH12TY5476",style: TextStyle(
                                fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "John Smith",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,

                                  ),
                                ),
                                SizedBox(width: 10), // Add some space between the two Text widgets
                                Text(
                                  "First Owner",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,

                                  ),
                                ),
                              ],
                            ),



                          ],
                        ),




                      ],
                    ),
                  ),
                ),

              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Recommended Services",
                  style:TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
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
                                case 0:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon...',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 1:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon...',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: themeColor,
                                    ),
                                  );
                                  break;
                                case 2:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Comming Soon...',
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
                                        'Comming Soon...',
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
