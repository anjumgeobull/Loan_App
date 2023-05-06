import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helper/api_constants.dart';
import '../Helper/http_handler/network_http.dart';
import '../widget/common_snackbar.dart';
import '../widget/loading_dialog.dart';

class DashboardController extends GetxController
{

  registration({String? token,String? user_name, String? contact}) async {

    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();
      log('starting to get response');
      //log("message body --- $jobAutoId   $employerAutoId ");
      var response;
      //if(token.isNotEmpty){
        log("passed from 1---------");
        response = await HttpHandler.postHttpMethod(url: BASE_URL + user_registration, data: {
          "token": token,
          "name": user_name,
          "contact": contact
        });
      // }else{
      //   log("passed from 2---------");
      //
      //   showSnackbar(title: "Warning", message: "Something went wrong");
      // }

      log('response received apply Jobs api$response');

      hideLoadingDialog();
      if (response["body"]['status'] == "1") {
        print(response.toString());
        //applyJobsList.value = [response];
        showSnackbar(title: "Success", message: "registered successfully");

        // hideLoadingDialog();
      } else if (response["body"]['status'] == "0") {
        // jobSaved.value = true;
        log("saved already");
        showSnackbar(title: "Warning", message: response["body"]["msg"]);
        // hideLoadingDialog();
      }
    }
    catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }
}