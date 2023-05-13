import 'package:get/get.dart';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../Controller/VehicleDetailedController.dart';
import '../Helper/globle style.dart';
import '../config/choosen_lang.dart';
class CarDetailScreen extends StatefulWidget {
  CarDetailScreen({Key? key}) : super(key: key);

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  bool isApiCallProcessing = false;
  late String name = "Vagnera",
      emailid = "loading",
      mobile_no = "loading",
      dob = "";
  late String profile_pic = '';
  String image = "assets/images/Vagnera.png";
  late File icon_img;
  late File pickedImageFile;

  bool isIconSelected = false;
  final vehicleScreenController = Get.find<VehicleDetailedController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:themeColor,
          title: textToTrans(
            input:
            "Car Details",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          leading:
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 25.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        body:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: themeColor,
                ),
                child:
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
                              width: 120,
                              height: 150,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:   [
                              Obx(()=>vehicleScreenController.owner.value=='loading'?textToTrans(
                                  input:'NA'):
                              textToTrans(
                                input:
                                "${vehicleScreenController.owner.value}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children:  [
                                  Obx(()=>vehicleScreenController.licNo.value=='loading'?textToTrans(
                                      input:'NA'):
                                  textToTrans(
                                    input:
                                    "${vehicleScreenController.licNo.value}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  ),
                                  SizedBox(width: 10), // Add some space between the two Text widgets
                                  // textToTrans(
                                  // input:
                                  //   "First Owner",
                                  //   style: TextStyle(
                                  //     fontSize: 13,
                                  //     fontWeight: FontWeight.normal,
                                  //     color: Colors.grey,
                                  //
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(()=>vehicleScreenController.maker_model.value=='loading'?textToTrans(
                                  input:'NA'):                                 textToTrans(
                                input:
                                "${vehicleScreenController.maker_model.value}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child:
                                Obx(()=>vehicleScreenController.puc_expiry.value=='loading'?textToTrans(
                                    input:'NA'):
                                textToTrans(
                                  input:
                                  "${vehicleScreenController.puc_expiry.value}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),

                        ),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.black,
                          width: 0.7,
                        ),
                      ),
                      child:  Center(
                        child: textToTrans(
                          input:
                          "RC Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Ownership Details",
                          style: TextStyle(fontSize: 18.0,color: Colors.grey[700] ,fontWeight: FontWeight.bold),
                        ),

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Owner Name",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.owner.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.owner.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Ownwership",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.ownerCount.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.ownerCount.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Registration Date",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),

                                    Obx(()=>vehicleScreenController.registration_date.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.registration_date.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Financer's Name",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.finaincerName.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.finaincerName.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.topLeft,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  textToTrans(
                                    input:
                                    "Registered RTO",
                                    style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  SizedBox(height: 10,),
                                  Obx(()=>vehicleScreenController.registration_authority.value=='loading'?textToTrans(
                                      input:'NA'):
                                  textToTrans(
                                    input:
                                    "${vehicleScreenController.registration_authority.value}",
                                    style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Finance Details",
                          style: TextStyle(fontSize: 18.0,color: Colors.grey[700] ,fontWeight: FontWeight.bold),
                        ),

                        children: <Widget>[

                          Align(
                            alignment: Alignment.topLeft,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  textToTrans(
                                    input:
                                    "Financer's Name",
                                    style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  SizedBox(height: 10,),
                                  Obx(()=>vehicleScreenController.finaincerName.value=='loading'?textToTrans(
                                      input:'NA'):
                                  textToTrans(
                                    input:
                                    "${vehicleScreenController.finaincerName.value}",
                                    style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Vehicle Details",
                          style: TextStyle(fontSize: 18.0,color: Colors.grey[700] ,fontWeight: FontWeight.bold),
                        ),

                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textToTrans(
                                    input:
                                    "Maker Model",
                                    style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  SizedBox(height: 10,),
                                  Obx(()=>vehicleScreenController.model.value=='loading'?textToTrans(
                                      input:'NA'):
                                  textToTrans(
                                    input:
                                    "${vehicleScreenController.model.value}",
                                    style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Vehicle Class ",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.vehicle_class.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.vehicle_class.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Fuel Type",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.fule_type.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.fule_type.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Fuel Norms",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.norms_type.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.norms_type.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Engine Number",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.engine.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.engine.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Important Dates",
                          style: TextStyle(fontSize: 18.0,color: Colors.grey[700] ,fontWeight: FontWeight.bold),
                        ),

                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Registration Date",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.registration_date.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.registration_date.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Insurance Date",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.insuranceDate.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.insuranceDate.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Fitness upto",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.fitnessDate.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.fitnessDate.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Pollution Upto",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.pollution.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.pollution.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child:
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Expanded(
                          //         child: Column(
                          //           children: [
                          //             textToTrans(
                          //input:
                          //               "Insurance Expiry(Updated today)",
                          //               style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             textToTrans(
                          //input:
                          //               "${vehicleScreenController.insu_date}",
                          //               style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       // Padding(
                          //       //   padding: const EdgeInsets.only(right: 20.0),
                          //       //   child: Column(
                          //       //     children: [
                          //       //       textToTrans(
                          //input:
                          //       //         "Insurance Expiring in",
                          //       //         style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                          //       //       ),
                          //       //       SizedBox(height: 10,),
                          //       //       textToTrans(
                          //input:
                          //       //         "1 year & 9 months",
                          //       //         style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                          //       //       ),
                          //       //     ],
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),


                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Other Information",
                          style: TextStyle(fontSize: 18.0,color: Colors.grey[700] ,fontWeight: FontWeight.bold),
                        ),

                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Registration Number",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.licNo.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.licNo.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Vehicle Color",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.vehicle_color.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.vehicle_color.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    textToTrans(
                                      input:
                                      "Unloaded weight()kg",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    Obx(()=>vehicleScreenController.unladen_weight.value=='loading'?textToTrans(
                                        input:'NA'):
                                    textToTrans(
                                      input:
                                      "${vehicleScreenController.unladen_weight.value}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "RC Status",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      Obx(()=>vehicleScreenController.rc_staus.value=='loading'?textToTrans(
                                          input:'NA'):
                                      textToTrans(
                                        input:
                                        "${vehicleScreenController.rc_staus.value}",
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child:
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       children: [
                          //         textToTrans(
                          //          input:
                          //           "Insurance Expiry(Updated today)",
                          //           style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //         SizedBox(height: 10,),
                          //         textToTrans(
                          //         input:
                          //           "27-Jan-2025",
                          //           style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //
                          // ),
                          //
                          // Divider(),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child:
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       children: [
                          //         textToTrans(
                          //input:
                          //           "Insurance Expiring in",
                          //           style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //         SizedBox(height: 10,),
                          //         textToTrans(
                          //         input:
                          //           "1 year & 9 months",
                          //           style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //
                          // ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 190,
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.black,
                          width: 0.7,
                        ),
                      ),
                      child: Center(
                        child: textToTrans(
                          input:
                          "Insurance Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              vehicleScreenController.insuerName.value!=""?
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/img_12.png",
                          width: 100,
                          height: 90,
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   [
                            textToTrans(
                              input:"Your are insured",style: TextStyle(
                                fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            textToTrans(
                              input:
                              "Insurance name",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10), // Add some space between the two Text widgets
                            Obx(()=>vehicleScreenController.insuerName.value=='loading'?
                            textToTrans(
                                input:'NA'):
                            textToTrans(
                              input:
                              "${vehicleScreenController.insuerName.value}",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,

                              ),
                            ),),

                            SizedBox(
                              height: 5,
                            ),
                            textToTrans(
                              input:
                              "Insurance Expiring on ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child:
                              Obx(()=>vehicleScreenController.insuranceDate.value=='loading'?textToTrans(
                                  input:'NA'):
                              textToTrans(
                                input:
                                "${vehicleScreenController.insuranceDate.value}",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ):Container(),
              SizedBox(height: 5,),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 30,
              //         width: 190,
              //         decoration:  BoxDecoration(
              //           borderRadius: const BorderRadius.only(
              //             bottomLeft: Radius.circular(20),
              //             bottomRight: Radius.circular(20),
              //             topRight: Radius.circular(20),
              //             topLeft: Radius.circular(20),
              //
              //           ),
              //           color: Colors.grey[200],
              //           border: Border.all(
              //             color: Colors.black,
              //             width: 0.7,
              //           ),
              //         ),
              //         child: const Center(
              //           child: textToTrans(
              //  input:
              //             "Specification",
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ),
              //       )
              //
              //
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              //   child:
              //   Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children:   [
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.percent,
              //                     color: Colors.green,
              //                   ),
              //                   SizedBox(
              //                     width: 5.0,
              //                   ),
              //                   textToTrans(
              //     input:
              //                     "Range",
              //                     style: TextStyle(
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.normal,
              //                         color: Colors.green
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               textToTrans(
              //     input:
              //                 "10lakh-15lakh",
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10,),
              //
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children:   [
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.transform_rounded,
              //                     color: Colors.green,
              //                   ),
              //                   SizedBox(
              //                     width: 5.0,
              //                   ),
              //                   textToTrans(
              //     input:
              //                     "Transmission",
              //                     style: TextStyle(
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.normal,
              //                         color: Colors.green
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               textToTrans(
              //     input:
              //                 "Manual/Automatic",
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10,),
              //
              //
              //
              //
              //
              //         ],
              //       ),
              //     ),
              //   ),
              //
              //
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10),
              //   child:
              //   Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children:   [
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.traffic,
              //                     color: Colors.green,
              //                   ),
              //                   SizedBox(
              //                     width: 5.0,
              //                   ),
              //                   textToTrans(
              //     input:
              //                     "Mileage",
              //                     style: TextStyle(
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.normal,
              //                         color: Colors.green
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               textToTrans(
              //     input:
              //                 "10.778 to 19.3 kmpl",
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10,),
              //
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children:   [
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.star,
              //                     color: Colors.green,
              //                   ),
              //                   SizedBox(
              //                     width: 5.0,
              //                   ),
              //                   textToTrans(
              //     input:
              //                     "Rating",
              //                     style: TextStyle(
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.normal,
              //                         color: Colors.green
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               textToTrans(
              //     input:
              //                 "4.5",
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10,),
              //
              //
              //
              //
              //
              //         ],
              //       ),
              //     ),
              //   ),
              //
              //
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void showprogressDialog(String msg) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[50],
          content: Wrap(children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  textToTrans(
                    input:
                    msg,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            )
          ])),
    );
  }
}