import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../Helper/String_constant.dart';
import '../Helper/api_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Helper/http_handler/network_http.dart';
import '../Helper/loading_dialog.dart';
import '../Helper/shared_preferances.dart';
import '../Model/ProfileDetailModel.dart';
import '../Profile/my_profile.dart';
import '../widget/common_snackbar.dart';

class UserProfileController extends GetxController{
  RxString name="".obs,
      contact="loading".obs,
      owner="loading".obs;
  RxInt isSelected = 0.obs;
  String user_auto_id="";
  RxBool isApiCallProcessing=false.obs;
  RxInt status= 0.obs;

  ///get Profile data
  getUserProfile() async {
    //showLoadingDialog();
    log('Profile controller called');
    log("User Profile");
    isApiCallProcessing.value = true;
    user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;
    var url = BASE_URL + get_my_profile;
    Uri uri = Uri.parse(url);
    //debugPrint(url);

    final body = {
      "user_auto_id": user_auto_id,
    };

    final response = await http.post(uri,body:body);

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final resp=jsonDecode(response.body);
      int status =resp['status'];
      //log("$status");
      if(status==1) {
        ProfileModel getProfileData =
        ProfileModel.fromJson(json.decode(response.body));
        var Profile_data = getProfileData.profile ;
        name.value=Profile_data[0].name ;
        log("Name $name");
        contact.value=Profile_data[0].contact;
        //owner.value=Profile_data.uniqueId;
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDetailScreen()));
        //Get.to(() => CarDetailScreen());
        isApiCallProcessing.value = false;
      }
      else{
        isApiCallProcessing.value=false;
        // showSnackbar(title: "Failed!", message: 'Server error: ${response.statusCode}');
        Fluttertoast.showToast(msg: 'Server error: ' +response.statusCode.toString(), backgroundColor: Colors.grey,);

      }
      // hideLoadingDialog();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  ///update Profile data
  updateProfileData({String? user_name, String? contact}) async {

    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();
      log('starting to get response');
      user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;

      //log("message body --- $jobAutoId   $employerAutoId ");
      var response;
      //if(token.isNotEmpty){
      log("passed from 1---------");
      response = await HttpHandler.postHttpMethod(url: BASE_URL + update_profiles, data: {
      //  user_auto_id,name,contact
        "user_auto_id": user_auto_id,
        "name": user_name,
        "contact": contact
      });
      log('response Update profile api$response');
      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        print(response.toString());
        //applyJobsList.value = [response];
        Get.to(() => CoustmerDetailScreen());
        showSnackbar(title: "Success", message: "Updated successfully");
        Get.off(CoustmerDetailScreen());
      }

      else if (response["body"]['status'] == 0) {
        log("Data Not Available");
        showSnackbar(title: "Warning", message: response["body"]["msg"]);
      }
    }
    catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }

}