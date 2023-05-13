
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../Helper/api_constant.dart';
import '../Helper/globle style.dart';
import '../Helper/navigation_helper.dart';
import '../Model/GetEnquiryData.dart';
import '../Photo/AdharCardImage.dart';
import '../Photo/InsuranceImage.dart';
import '../Photo/PanImage.dart';
import '../Photo/ProfileImage.dart';
import '../Photo/RcBook.dart';
import '../Profile/Pdf_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../config/choosen_lang.dart';


class upload_documentDetailScreen extends StatefulWidget {
  final GetEnquiryData data;
  final int index;
  upload_documentDetailScreen({Key? key,required this.data, required this.index}) : super(key: key);

  @override
  State<upload_documentDetailScreen> createState() => _upload_documentDetailScreenState();
}

class _upload_documentDetailScreenState extends State<upload_documentDetailScreen> {
  bool isApiCallProcessing = false;
  late String name = "Vagnera",
      emailid = "loading",
      mobile_no = "loading",
      dob = "";
  late String profile_pic = '';
  late String pan_pic = '';
  late String adhar_pic = '';
  late String rc_pic = '';
  late String insu_pic = '';
  late String bank_stm = '';
  String image = "assets/images/Vagnera.png";
  late File icon_img;
  late File pickedImageFile;

  bool isIconSelected = false;
  String document="";
  late File filedocument;
  bool isfileuploaded=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile_pic=widget.data.photo;
    pan_pic=widget.data.pancard;
    adhar_pic=widget.data.aadharOrVotingcard;
    rc_pic=widget.data.rcBook;
    insu_pic=widget.data.insurance;
    document=widget.data.bankStatement;
    print(document);

  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color:themeColor,
            ),
            child:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textToTrans(
                  input:"Uploads Your Docs",style: TextStyle(
                            fontSize: 15,fontWeight:FontWeight.bold,color: Colors.white
                        ),),
                        GestureDetector(
                          onTap: () async {
                          },
                          child: Icon(
                            Icons.upload_file,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      "Access your docs anytime",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
              child: Center(
                child: textToTrans(
                  input:
                  "Details",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Personal Details",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    textToTrans(
                  input:"Name",style: TextStyle(
                        fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    ),),
                    // GestureDetector(
                    //   onTap: () async {
                    //     if (document.isNotEmpty) {
                    //       push(context, Pdf_viewer(document));
                    //     } else {
                    //       FilePickerResult? result = await FilePicker.platform
                    //           .pickFiles(
                    //           type: FileType.custom,
                    //           allowedExtensions: ['pdf', 'doc'],
                    //           allowMultiple: false);
                    //       if (result != null) {
                    //         PlatformFile file = result.files.first;
                    //         filedocument =File(file.path!);
                    //         isfileuploaded = true;
                    //         print(file.name);
                    //         //print(file.bytes);
                    //         print(file.size);
                    //         print(file.extension);
                    //         print(file.path);
                    //         showAlert(context);
                    //       } else {
                    //         print('No file selected');
                    //       }
                    //       //showAlert();
                    //       setState(() {});
                    //     }
                    //   },
                    //   child: Icon(
                    //     Icons.upload_file,
                    //     size: 30,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      widget.data.name,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: TextColor,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:"Contact",style: TextStyle(
                        fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      widget.data.contact,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: TextColor,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:"City",style: TextStyle(
                        fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      widget.data.city,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: TextColor,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:"Employement Type",style: TextStyle(
                        fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      widget.data.employmentType,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: TextColor,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:"Required Amount",style: TextStyle(
                        fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    textToTrans(
                  input:
                      widget.data.requirementAmount,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: TextColor,
                          fontSize: 15,
                          fontFamily: 'InterRegular'),
                    ),

                  ],
                ),
              ),
            ),

          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
              child: Center(
                child: textToTrans(
                  input:
                  "Documents",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          //profile
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Profile Image",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  //input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  //input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    ProfileImages(),

                  ],
                ),
              ),
            ),

          ),

          //pan card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Pan Card",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  // input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  //input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    PanCardImages(),

                  ],
                ),
              ),
            ),

          ),

          //adhar card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Adhar Card or Voting Card",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  // input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  // input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    AdharCardImages(),

                  ],
                ),
              ),
            ),

          ),

          //Rc card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"RC Book",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  // input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  // input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    RcImages(),

                  ],
                ),
              ),
            ),

          ),

          //insu card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Insurance",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  // input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  // input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    InsuranceImages(),

                  ],
                ),
              ),
            ),

          ),

          //Bank stm
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    textToTrans(
                  input:"Bank Statement",style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey[700]
                    ),),
                    Divider(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     textToTrans(
                  // input:"Uploads Your Docs",style: TextStyle(
                    //         fontSize: 15,fontWeight:FontWeight.bold,color: Colors.black
                    //     ),),
                    //     GestureDetector(
                    //       onTap: () async {
                    //         if (document.isNotEmpty) {
                    //           push(context, Pdf_viewer(document));
                    //         } else {
                    //           FilePickerResult? result = await FilePicker.platform
                    //               .pickFiles(
                    //               type: FileType.custom,
                    //               allowedExtensions: ['pdf', 'doc'],
                    //               allowMultiple: false);
                    //           if (result != null) {
                    //             PlatformFile file = result.files.first;
                    //             filedocument =File(file.path!);
                    //             isfileuploaded = true;
                    //             print(file.name);
                    //             //print(file.bytes);
                    //             print(file.size);
                    //             print(file.extension);
                    //             print(file.path);
                    //             showAlert(context);
                    //           } else {
                    //             print('No file selected');
                    //           }
                    //           //showAlert();
                    //           setState(() {});
                    //         }
                    //       },
                    //       child: Icon(
                    //         Icons.upload_file,
                    //         size: 30,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // textToTrans(
                  // input:
                    //   "Keep PUC Certificate handy",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.normal,
                    //       color: TextColor,
                    //       fontSize: 15,
                    //       fontFamily: 'InterRegular'),
                    // ),
                    // Divider(),
                    BankStement(),

                  ],
                ),
              ),
            ),

          ),


        ],
      );
  }
  
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: textToTrans(
                  input:" Confirmation"),
          content:  textToTrans(
                  input:"Are you sure you want to upload this document?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:  textToTrans(
                  input:"Yes"),
            ),
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              child:  textToTrans(
                  input:"No"),
            ),
          ],
        );
      },
    );
  }
  
  Widget ProfileImages() {
    return
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected ?
                ClipRRect(
                  child: Image.file(File(icon_img.path), height: 100,
                    width: 100,),
                ):

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                  profile_pic.isEmpty?

                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/uploading.png',),
                  ) :

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new ProfileImagelScreen(data: widget.data,)));
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:IMAGE_BASE_URL+profile_pic,
                      placeholder: (context, url) =>
                          Container(decoration: BoxDecoration(
                            color: Colors.grey[400],
                          )),
                      // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget PanCardImages() {

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected ?
                ClipRRect(
                  child: Image.file(File(icon_img.path), height: 100,
                    width: 100,),
                ):

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                  pan_pic.isEmpty?

                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/uploading.png',),
                  ) :

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new PanImagelScreen(data: widget.data,)));
                    },

                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:IMAGE_BASE_URL+pan_pic,
                      placeholder: (context, url) =>
                          Container(decoration: BoxDecoration(
                            color: Colors.grey[400],
                          )),
                      // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  
  Widget AdharCardImages() {

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected ?
                ClipRRect(
                  child: Image.file(File(icon_img.path), height: 100,
                    width: 100,),
                ):

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                  adhar_pic.isEmpty?

                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/uploading.png',),
                  ) :

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new AdharCardImagelScreen(data: widget.data,)));
                    },

                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:IMAGE_BASE_URL+adhar_pic,
                      placeholder: (context, url) =>
                          Container(decoration: BoxDecoration(
                            color: Colors.grey[400],
                          )),
                      // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  
  Widget RcImages() {

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected ?
                ClipRRect(
                  child: Image.file(File(icon_img.path), height: 100,
                    width: 100,),
                ):

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                  rc_pic.isEmpty?

                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/uploading.png',),
                  ) :

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new RcBookImagelScreen(data: widget.data,)));
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:IMAGE_BASE_URL+rc_pic,
                      placeholder: (context, url) =>
                          Container(decoration: BoxDecoration(
                            color: Colors.grey[400],
                          )),
                      // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  
  Widget InsuranceImages() {

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: isIconSelected ?
                ClipRRect(
                  child: Image.file(File(icon_img.path), height: 100,
                    width: 100,),
                ):

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                  insu_pic.isEmpty?

                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/uploading.png',),
                  ) :

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new InsurancelScreen(data: widget.data,)));
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:IMAGE_BASE_URL+insu_pic,
                      placeholder: (context, url) =>
                          Container(decoration: BoxDecoration(
                            color: Colors.grey[400],
                          )),
                      // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget BankStement() {

    return
       GestureDetector(
         onTap: () {
           push(context, Pdf_viewer(document));
         },
         child: 
         textToTrans(
                  input:
           document,
           style: TextStyle(
             fontSize: 15,
             color: Colors.black,
           ),
         ),
       );}
}
