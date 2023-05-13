import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../Controller/UserProfileController.dart';
import '../Controller/VehicleDetailedController.dart';
import '../Dashboard/Car_details_page.dart';
import '../Helper/String_constant.dart';
import '../Helper/globle style.dart';
import '../Helper/shared_preferances.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/choosen_lang.dart';
import '../login/login_screen.dart';

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
  TextEditingController car_number = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  bool isIconSelected = false;
  String? token='';
  bool is_my_vehicle=false;
  String my_vehicle="no";
  final profileDataController = Get.find<UserProfileController>();
  final vehicleScreenController = Get.find<VehicleDetailedController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_token();
  }
  get_token()
  async {
    token = await SPManager.instance.getUser(LOGIN_KEY);
    if(token!=null && token!="")
    {
      profileDataController.getUserProfile();
    }
    setState(() {

    });
    print("token " + token.toString());
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
              textToTrans(
                  input:
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
                        child: textToTrans(
                  input:
                          "Enter The Vehicle Number",
                          style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child:
                            TextField(
                              controller: car_number,
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
                              if (token != null) {
                                if(token==""){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                }
                                else {
                                  if(car_number.text.isNotEmpty && car_number.text!="") {
                                    vehicleScreenController
                                        .getVehicleDetailsSearchData(car_number.text);
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => CarDetailScreen()));
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              }
                              // Perform search action here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: textToTrans(
               //   input:
              //     "Recent Search",
              //     style:TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child:
              //   Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Expanded(
              //             child: Image.asset(
              //               image,
              //               width: 50,
              //               height: 80,
              //             ),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children:   [
              //
              //               textToTrans(
               //   input:"MH12TY5476",style: TextStyle(
              //                   fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black
              //               ),),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Row(
              //                 children: const [
              //                   textToTrans(
                //  input:
              //                     "John Smith",
              //                     style: TextStyle(
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.normal,
              //                       color: Colors.black,
              //
              //                     ),
              //                   ),
              //                   SizedBox(width: 10), // Add some space between the two Text widgets
              //                   textToTrans(
               //   input:
              //                     "First Owner",
              //                     style: TextStyle(
              //                       fontSize: 13,
              //                       fontWeight: FontWeight.normal,
              //                       color: Colors.grey,
              //
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //
              //
              //
              //             ],
              //           ),
              //
              //
              //
              //
              //         ],
              //       ),
              //     ),
              //   ),
              //
              // ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: textToTrans(
                  input:
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
                                      content: textToTrans(
                                    input:
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
                                      content: textToTrans(
                                      input:
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
                                      content: textToTrans(
                                      input:
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
                                      content: textToTrans(
                                       input:
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
                                textToTrans(
                                input:
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
                  child:  textToTrans(
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
                            child:  Center(
                              child: textToTrans(
                                  input:
                                "Not My Vehicle",
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
