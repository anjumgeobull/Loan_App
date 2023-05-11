

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loan_app/Helper/navigation_helper.dart';
import '../Helper/api_constant.dart';
import '../Profile/Pdf_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Controller/MyVehicleDetaileController.dart';
import '../Controller/UserProfileController.dart';
import '../Dashboard/Car_details_page.dart';
import '../Documents/Document_List.dart';
import '../Helper/globle style.dart';
import '../Model/GetEnquiryData.dart';


class ProfileImagelScreen extends StatefulWidget {
  final GetEnquiryData data;
  ProfileImagelScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<ProfileImagelScreen> createState() => _ProfileImagelScreenState();
}

class _ProfileImagelScreenState extends State<ProfileImagelScreen> {

  String document="";
  String profile_pic="";
  late File filedocument;
  bool isIconSelected = false;
  late File icon_img;
  bool isfileuploaded=false;

  @override
  void initState() {
    super.initState();
    profile_pic=widget.data.photo;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          "Profile Image",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
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


      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:
          profile_pic.isEmpty?

          Container(
            height: 100,
            width: 100,
            child: Image.asset('assets/images/uploading.png',),
          ) :

          CachedNetworkImage(
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            imageUrl:IMAGE_BASE_URL+profile_pic,
            placeholder: (context, url) =>
                Container(decoration: BoxDecoration(
                  color: Colors.grey[400],
                )),
            // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),),
      )
      );


  }



}
