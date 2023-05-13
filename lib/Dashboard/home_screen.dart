import 'dart:async';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loan_app/Dashboard/Car_details_page.dart';
import '../Controller/UserProfileController.dart';
import '../Helper/LanguageProvider.dart';
import '../Helper/String_constant.dart';
import '../Helper/globle style.dart';
import '../Helper/shared_preferances.dart';
import '../Controller/VehicleDetailedController.dart';
import 'package:get/get.dart';
import '../VehicleSearch/VehicleSearch.dart';
import '../config/choosen_lang.dart';
import '../login/login_screen.dart';
import 'CheckCriteriaWithBot.dart';
import 'Emi_calculator.dart';
import 'package:avatar_glow/avatar_glow.dart';

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

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String name;

  MyAppBar(this.name);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  final profileDataController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                child: Obx(()=> profileDataController.name.value!="loading" && profileDataController.name.value!=''?
                textToTrans(
                  input:"Welcome ${profileDataController.name.value}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ):
                textToTrans(
                  input: "Welcome User",
                  style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.to(() => const ChooseLanguage())!.whenComplete(() {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.language,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
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
  late String vehicleNo = "",
      emailid = "loading",
      mobile_no = "loading",
      dob = "",vehicle_number_hint='Enter vehicle number';
  late String profile_pic = '';
  String image = "assets/images/img_10.png";
  late File icon_img;
  late File pickedImageFile;

  TextEditingController car_number = TextEditingController();

  FocusNode userNameFocus = FocusNode();
  bool isIconSelected = false;
  String? token='';
  final vehicleScreenController = Get.find<VehicleDetailedController>();
  final profileDataController = Get.find<UserProfileController>();
  bool is_my_vehicle=false;
  String my_vehicle="no";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_token();
    translateText();
  }
  void translateText() async {
    vehicle_number_hint = await textTranslate(input: vehicle_number_hint, language: "en");
    print(vehicle_number_hint);
    setState(() {});
  }
  get_token()
  async {
    token = await SPManager.instance.getUser(LOGIN_KEY);
    if(token!=null && token!="")
    {
      profileDataController.getUserProfile();
    }
    setState(() {});
    //print("token " + token.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(profileDataController.name.value),
      appBar:AppBar(
        elevation: 0,
        backgroundColor:themeColor,
        automaticallyImplyLeading: false,
        //leading:
        // IconButton(
        //   icon: Icon(
        //     Icons.chevron_left,
        //     size: 25.0,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //   Icon(
            //   Icons.person,
            //   color: Colors.white,
            //   size: 35,
            // ),
            SizedBox(
              width: 30,
            ),
            textToTrans(
                 input:
              "Welcome",
              style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const ChooseLanguage())!.whenComplete(() {
                  setState(() {});
                });
              },
              icon: const Icon(Icons.language,color: Colors.white,)),
        ],
      ),
      body:
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Obx(()=> profileDataController.name.value!="loading" && profileDataController.name.value!=''?
              // textToTrans(
              //   input:"Welcome ${profileDataController.name.value}",
              //   style: const TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ):
              // textToTrans(
              //   input: "Welcome User",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),
              // ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  //color: themeColor,
                  gradient: const LinearGradient(
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
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            setState(() {
                              vehicleNo=car_number.text;
                              log("$vehicleNo");
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => CarDetailScreen()));
                          if (token != null) {
                            if(token==""){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }
                            else {
                              if(vehicleNo.isNotEmpty && vehicleNo!="") {
                                vehicleScreenController
                                    .getVehicleDetailsSearchData(vehicleNo);
                                //Get.to(()=>CarDetailScreen());

                                // showDialog(context: context,
                                // builder: (context) {
                                // return SignInConfirmationDialog();
                                // }
                                // );
                                AddtoMycar(context);
                              }else
                                {
                                  Fluttertoast.showToast(msg: 'Please enter valid car no. ' , backgroundColor: Colors.grey,);
                                }
                            }
                          }else {
                            Get.to(()=>LoginScreen());
                          }
                          // Perform search action here
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
               Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: textToTrans(
                  input:
                  'Best Offer For You :',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: TextColor,
                      fontSize: 16,
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
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(height: 60,
                  child: Card(
                    elevation: 1,
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 0,bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textToTrans(
                            input:"Check Your Eligibility Criteria:",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: TextColor,
                              fontSize: 16,
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
                              endRadius: 200,
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
                                  Icons.send,size: 15,
                                  color: themeColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20.0,top: 10,),
                child: Text(
                  "Services",
                  style:TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(height: 210,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child:
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: GridView.builder(
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
                                    const SnackBar(
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
                                    const SnackBar(
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
                                    const SnackBar(
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
                                    const SnackBar(
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
                                    const SnackBar(
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
                                    const SnackBar(
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
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 32.0,
                                      height: 32.0,
                                      child: Image.asset(
                                        items[index].imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    textToTrans(
                                      input:
                                      items[index].name,
                                      style: const TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: items.length,
                      ),
                    ),
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
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textToTrans(
                          input:
                          "Our Team will call you soon...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),

    );
  }


  // void _showaccoutCraeteDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const textToTrans(
                 // input:"Create account",style: TextStyle(
  //           color: themeColor,
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold
  //         ),),
  //         content: const textToTrans(
               //   input:"Do want to create account?",style: TextStyle(
  //             color: themeColor,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold
  //         ),),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const textToTrans(
    //              input:"Yes",style: TextStyle(
  //                 color: themeColor,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold
  //             ),),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //
  //               Navigator.of(context).pop();
  //             },
  //             child: const textToTrans(
              //    input:"No",style: TextStyle(
  //                 color: themeColor,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold
  //             ),),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  // }

  void AddtoMycar(context) {
    Future.delayed(Duration(seconds: 8)).then((value) => showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          int selectedRadio = 0;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child:
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300),
                Center(
                  child: Image.asset(
                    "assets/images/car.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 15
                  ,),
                Center(
                  child: textToTrans(
                  input:'Mark this as your car',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 15
                  ,),

                 textToTrans(
                  input:
                  'Get important remainders like insurance '
                      'and pollution expiry, upload your '
                      'vehicle documents securly and get exclusive offers ',
                  style:
                  TextStyle(fontSize: 14, color:Colors.grey,
                      fontWeight: FontWeight.normal),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              color: themelightColor,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.7,
                              ),
                            ),
                            child: Center(
                              child: textToTrans(
                                  input:
                                "Not My Vehicle",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              is_my_vehicle=true;
                              if(is_my_vehicle==true){
                                my_vehicle="yes";
                              }
                              Fluttertoast.showToast(msg: 'Added in to my vehicle', backgroundColor: Colors.grey,);
                              vehicleScreenController.addVehicleDetails(car_number.text,
                                  my_vehicle,vehicleScreenController.licNo.value,vehicleScreenController.full_chasis.value,
                                  vehicleScreenController.owner.value,vehicleScreenController.registration_date.value,vehicleScreenController.fule_type.value
                                  ,vehicleScreenController.engine.value,vehicleScreenController.vehicle_class.value,vehicleScreenController.maker_name.value,
                                  vehicleScreenController.maker_model.value,vehicleScreenController.count.value,vehicleScreenController.insuranceDate.value
                                  ,vehicleScreenController.pollution.value,vehicleScreenController.fitnessDate.value,
                                  vehicleScreenController.model.value,vehicleScreenController.insuerName.value,vehicleScreenController.financier_name.value,
                                  vehicleScreenController.vehicle_color.value,vehicleScreenController.manufacturing_date.value,vehicleScreenController.norms_type.value,
                                  vehicleScreenController.owner_father_name.value,vehicleScreenController.registration_authority.value,vehicleScreenController.insurance_policy_no.value,
                                  vehicleScreenController.present_address.value,vehicleScreenController.permanent_address.value,vehicleScreenController.vehicle_cubic_capacity.value,
                                  vehicleScreenController.pucc_no.value,vehicleScreenController.vehicle_weight.value,vehicleScreenController.seating_capacity.value,
                                  vehicleScreenController.puc_expiry.value,vehicleScreenController.fitupto.value,vehicleScreenController.taxupto.value,
                                  vehicleScreenController.blaclist.value,vehicleScreenController.nocdetails.value,vehicleScreenController.rc_staus.value
                                  ,vehicleScreenController.rc_staus_ason.value,vehicleScreenController.body_type.value
                              );
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration:  BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              color: secondaryColor,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.7,
                              ),
                            ),
                            child: Center(
                              child: textToTrans(
                                  input:
                                "My Vehicle",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      },
    ));
  }
}
