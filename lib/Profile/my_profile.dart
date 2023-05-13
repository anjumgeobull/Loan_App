

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loan_app/Dashboard/Dashboard.dart';
import 'package:loan_app/Helper/navigation_helper.dart';
import 'package:loan_app/login/login_screen.dart';

import '../Controller/MyVehicleDetaileController.dart';
import '../Controller/UserProfileController.dart';
import '../Dashboard/Car_details_page.dart';
import '../Documents/Document_List.dart';
import '../Helper/String_constant.dart';
import '../Helper/globle style.dart';
import '../Helper/shared_preferances.dart';
import '../Model/MyVehicleData.dart';
import '../Register/register_screen.dart';
import '../VehiclelList/VehicleDummyModel.dart';
import '../VehiclelList/Vehicle_List.dart';
import '../config/choosen_lang.dart';
import '../widget/sign_out_dailog.dart';
import 'Edit_profile.dart';
import 'Pdf_viewer.dart';

class CoustmerDetailScreen extends StatefulWidget {
  CoustmerDetailScreen({Key? key}) : super(key: key);

  @override
  State<CoustmerDetailScreen> createState() => _CoustmerDetailScreenState();
}

class _CoustmerDetailScreenState extends State<CoustmerDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  String document="",token="", tab1="Personal Info",tab2="My Vehicle";
  late File filedocument;
  bool isfileuploaded=false;
  final profileDataController = Get.find<UserProfileController>();
  final myVehicleListController = Get.find<MyVehicleDetailedController>();
  @override
  void initState() {
    super.initState();
    print(vehicles.length);
    get_token();
  }
  get_token()
  async {
    if(await SPManager.instance.getUser(LOGIN_KEY)!=null)
      token = (await SPManager.instance.getUser(LOGIN_KEY))!;
    if(token!=''){
      profileDataController.getUserProfile();
      myVehicleListController.getMyVehicleDetail();
      myVehicleListController.myVehicleList;
      print("vehicle list====>");
      print(myVehicleListController.myVehicleList);
      // tab1=await textTranslate(input: 'Personal Info',language: 'en');
      // tab2=await textTranslate(input: 'My Vehicle',language: 'en');
      setState(() {
      });
    }
    print("token profile" + token.toString());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        profileDataController.getUserProfile();
        myVehicleListController.getMyVehicleDetail();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: textToTrans(
            input:
            "My Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.chevron_left,
          //     size: 25.0,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                size: 25.0,
                color: Colors.white,
              ),
              onPressed: () {
                token==null || token==''?Get.to(()=>LoginScreen()):
                Get.to(() => EditProfileScreen());
              },
            ),
            IconButton(
              icon: Icon(
                token==null || token==''?Icons.logout:Icons.login,
                size: 25.0,
                color: Colors.white,
              ),
              onPressed: () {
                if(token!=null || token!=''){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const SignOutConfirmationDialog();
                      });
                  //Get.off(()=>Dashboard());
                }else
                  Get.off(() => LoginScreen());
              },
            ),
          ],
        ),
        body: token==null || token==''?
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [textToTrans(
                input:'You are not logged '),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  Get.to(()=>LoginScreen());
                },
                child: Container(
                  height: 40,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: textToTrans(
                    input:
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textToTrans(
                        input:"Don't Have Any Account?  "),
                    GestureDetector(
                      child: textToTrans(
                        input:
                        "Sign Up Now",
                        style: TextStyle(color: themeColor),
                      ),
                      onTap: () {
                        Get.to(()=>RegisterScreen());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ):
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: themeColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child:  textToTrans(
                              input:
                              "${profileDataController.name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width * 0.7,
                          //   alignment: Alignment.topLeft,
                          //   child: textToTrans(
                          //input:
                          //     "Pune, Maharashtra",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.normal,
                          //       color: Colors.white,
                          //       fontSize: 15,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: themeColor)),
                          child: const Icon(
                            Icons.person,
                            color:themeColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text:tab1,
                  ),
                  Tab(text: tab2),
                  //Tab(text: 'Documents'),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorColor: themeColor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 520,
                child:
                TabBarView(
                  controller: _tabController,
                  children: [
                    //  details screen widget
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              textToTrans(
                                input:
                                "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: TextColor,
                                    fontSize: 13,
                                    fontFamily: 'InterRegular'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              textToTrans(
                                input:
                                "${profileDataController.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: TextColor,
                                    fontSize: 15,
                                    fontFamily: 'InterRegular'),
                              ),
                              const Divider(
                                thickness: 0.4,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(height: 10),
                              textToTrans(
                                input:
                                "Contact Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: TextColor,
                                    fontSize: 13,
                                    fontFamily: 'InterRegular'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              textToTrans(
                                input:
                                "${profileDataController.contact}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: TextColor,
                                    fontSize: 15,
                                    fontFamily: 'InterRegular'),
                              ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Email Id",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "johnsmith@gmail.com",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Address",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "Hadapsar, Pune Maharashtra",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Blood group",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "O+",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Date of birth",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "12-Nov-1994",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Job Role",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "Developer",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // const Divider(
                              //   thickness: 0.4,
                              //   color: Colors.blueGrey,
                              // ),
                              // SizedBox(height: 10),
                              // textToTrans(
                              //input:
                              //   "Employement Type",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       color: TextColor,
                              //       fontSize: 13,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // textToTrans(
                              //input:
                              //   "Self Employed",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.normal,
                              //       color: TextColor,
                              //       fontSize: 15,
                              //       fontFamily: 'InterRegular'),
                              // ),
                              const Divider(
                                thickness: 0.4,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // vehicle screen here..
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Obx(() => myVehicleListController.myVehicleList.isNotEmpty?
                      ListView.builder(
                        itemCount: myVehicleListController.myVehicleList.length,
                        itemBuilder: (context, index) {
                          MyVehicleData data = MyVehicleData.fromJson(myVehicleListController.myVehicleList[index]);
                          print(data.toString());
                          return my_Vehicle_List(
                            data: data,
                            index: index,
                          );
                        },
                      ):Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[textToTrans(
                              input:'No Vehicles')]),
                      ),
                    ),
                    // Document screen here..
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: ListView.builder(
                    //     itemCount: vehicles.length,
                    //     itemBuilder: (context, index) {
                    //       return
                    //         My_Document_List(
                    //           data: vehicles[index],
                    //           index: index,
                    //         );
                    //     },
                    //   ),
                    // ),

                  ],
                ),


              )],
          ),
        ),
      ),
    );

  }


  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: textToTrans(
              input:" Confirmation"),
          content: textToTrans(
              input:"Are you sure you want to upload this document?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: textToTrans(
                  input:"Yes"),
            ),
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              child: textToTrans(
                  input:"No"),
            ),
          ],
        );
      },
    );
  }
}