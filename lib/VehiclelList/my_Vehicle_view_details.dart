

import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import '../Helper/globle style.dart';
import '../Model/MyVehicleData.dart';
import '../config/choosen_lang.dart';
class my_Vehicle_DetailScreen extends StatefulWidget {
  final MyVehicleData data;
  my_Vehicle_DetailScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<my_Vehicle_DetailScreen> createState() => _my_Vehicle_DetailScreenState();
}

class _my_Vehicle_DetailScreenState extends State<my_Vehicle_DetailScreen> {
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
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:   [
                                textToTrans(
                                  input:
                                  widget.data.owner,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children:  [
                                    textToTrans(
                                      input:
                                      widget.data.vehicleNumber,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
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
                                textToTrans(
                                  input:
                                  "Owner Number: "+widget.data.ownerCount,
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
                                  child: textToTrans(
                                    input:
                                    "PUC Expirey: ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: textToTrans(
                                    input:
                                    widget.data.pucExpiry,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        color: secondaryColor,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.7,
                        ),
                      ),
                      child: Center(
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
                                    textToTrans(
                                      input:
                                      widget.data.owner,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      textToTrans(
                                        input:
                                        widget.data.ownerCount,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                    textToTrans(
                                      input:
                                      widget.data.registrationDate,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                  ],
                                ),
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
                                      textToTrans(
                                        input:
                                        widget.data.registrationAuthority,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Divider(),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child:
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       children: [
                          //         textToTrans(
                          // input:
                          //           "Registered RTO",
                          //           style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //         SizedBox(height: 10,),
                          //         textToTrans(
                          //input:
                          //           widget.data.registrationAuthority,
                          //           style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //
                          // ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      ExpansionTile(
                        title: textToTrans(
                          input:
                          "Financer Details",
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
                                      "Financer Name",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    textToTrans(
                                      input:
                                      widget.data.financierName,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                  ],
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
                                  textToTrans(
                                    input:
                                    widget.data.makerModel,
                                    style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                    textToTrans(
                                      input:
                                      widget.data.vehicleClass,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Fule Type",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      textToTrans(
                                        input:
                                        widget.data.fuelType,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      "Fule Norms",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    textToTrans(
                                      input:
                                      widget.data.normsType,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      textToTrans(
                                        input:
                                        widget.data.engine,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                    textToTrans(
                                      input:
                                      widget.data.registrationDate,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      textToTrans(
                                        input:
                                        "Insurance Expiry Date",
                                        style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                      SizedBox(height: 10,),
                                      textToTrans(
                                        input:
                                        widget.data.insuranceDate,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      "Fitness upto",
                                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey[700] ,fontSize:15 ),
                                    ),
                                    SizedBox(height: 10,),
                                    textToTrans(
                                      input:
                                      widget.data.fitUpto,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      textToTrans(
                                        input:
                                        widget.data.pollution,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

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
                                    textToTrans(
                                      input:
                                      widget.data.fullChassis,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      textToTrans(
                                        input:
                                        widget.data.vehicleColor,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                    textToTrans(
                                      input:
                                      widget.data.vehicleWeight,
                                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
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
                                      textToTrans(
                                        input:
                                        widget.data.rcStatus,
                                        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] ,fontSize:15 ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                        color: secondaryColor,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.7,
                        ),
                      ),
                      child:  Center(
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
                      Column(
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
                          textToTrans(
                            input:
                            widget.data.insurerName,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          textToTrans(
                            input:
                            "Insurance Expiry Date ",
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
                            child: textToTrans(
                              input:
                              widget.data.insuranceDate,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),

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
      builder: (context) => new AlertDialog(
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
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            )
          ])),
    );
  }

  Widget uploadLogoUi() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected
                    ? ClipRRect(
                  child: Image.file(
                    File(icon_img.path),
                    height: 100,
                    width: 100,
                  ),
                )
                    : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/img_3.png',
                          height: 50, width: 50),
                    )),
              ),
            ],
          ),
        ));
  }
}