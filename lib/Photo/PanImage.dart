

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


class PanImagelScreen extends StatefulWidget {
  final GetEnquiryData data;
  PanImagelScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<PanImagelScreen> createState() => _PanImagelScreenState();
}

class _PanImagelScreenState extends State<PanImagelScreen> {

  String document="";
  String pan_pic="";
  late File filedocument;
  bool isIconSelected = false;
  late File icon_img;
  bool isfileuploaded=false;

  @override
  void initState() {
    super.initState();
    pan_pic=widget.data.pancard;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: const Text(
            "Pan Card Image",
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
            pan_pic.isEmpty?

            Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/uploading.png',),
            ) :

            CachedNetworkImage(
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              imageUrl:IMAGE_BASE_URL+pan_pic,
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
