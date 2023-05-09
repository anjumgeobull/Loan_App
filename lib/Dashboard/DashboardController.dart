import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helper/String_constant.dart';
import '../Helper/api_constants.dart';
import '../Helper/http_handler/network_http.dart';
import '../Helper/shared_preferances.dart';
import '../Register/register_screen.dart';
import '../widget/common_snackbar.dart';
import '../widget/loading_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Car_details_page.dart';
import 'Dashboard.dart';
import 'otpScreen.dart';
import 'package:connectivity/connectivity.dart';

class DashboardController extends GetxController
{
  RxBool isResendApiProcessing = false.obs;
  RxBool registered = false.obs;
  RxBool showTimer=true.obs,isOtpBtn=false.obs;
  RxBool showResendButton=false.obs,isOtpSend=false.obs,
      isOtpVerified=false.obs;
  RxBool is_registered=false.obs;
  RxList register_response=[].obs;

  registration({String? token,String? user_name, String? contact}) async {
// // Check the network status
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       print("No internet connection");
//     } else {
//       print("Internet connection is available");
//     }

// Listen for changes in network connectivity
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        print("No internet connection");
      } else {
        try {
          showLoadingDialog();
          Get.focusScope!.unfocus();
          final fcmToken = await FirebaseMessaging.instance.getToken(); /// created token for user registration

          if(fcmToken != null){
            token = fcmToken;
          }
          log('starting to get response');
          var response;
          log("passed from 1---------");
          response = await HttpHandler.postHttpMethod(url: BASE_URL + user_registration, data: {
            "token": token,
            "name": user_name,
            "contact": contact
          });

          log('response received apply Jobs api$response');

          hideLoadingDialog();
          if (response["body"]['status'] == 1) {
            print(response.toString());
            registered.value=true;
            register_response=response["body"]['data'];
            SPManager.instance.setUser(LOGIN_KEY, response["body"]['data'][0]['_id']);
            Get.to(CarDetailScreen());
            showSnackbar(title: "Success", message: "registered successfully");

          } else if (response["body"]['status'] == 0) {
            // jobSaved.value = true;
            log("saved already");
            showSnackbar(title: "Warning", message: response["body"]["msg"]);
          }
        }
        catch (e, s) {
          debugPrint("Login Error -- $e  $s");
        }
        //print("Internet connection is available");
      }
    });
  }

  send_otp({String? contact,BuildContext? context}) async {

    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();

      log('starting to get response');
      log("message body --- $contact ");
      var response;

      log("passed from 1---------");
      response = await HttpHandler.postHttpMethod(url: BASE_URL + mobile_send_otp, data: {
        "contact": contact
      });

      log('response received apply Jobs api$response');

      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        print(response.toString());
        is_registered.value=true;
        showSnackbar(title: "Success", message: "otp send successfully");
        showModalBottomSheet(
          context: context!,
          builder: (BuildContext context) =>
              OtpScreen(contact!),
        );
      } else if (response["body"]['status'] == 0) {

        Get.to(RegisterScreen());
        log("saved already");

        showSnackbar(title: "Warning", message: response["body"]["msg"]);

      }
    }
    catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }

  resendOtpApi({String? contact}) async {

    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();

      log('starting to get response');
      var response;
      log("passed from 1---------");
      response = await HttpHandler.postHttpMethod(url: BASE_URL + mobile_send_otp, data: {
        "contact": contact
      });

      log('response received apply Jobs api$response');

      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        print(response.toString());

        showSnackbar(title: "Success", message: "otp send successfully");

      } else if (response["body"]['status'] == 0) {
        log("saved already");
        showSnackbar(title: "Warning", message: response["body"]["msg"]);
      }
    }
    catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }

  verify_otp({String? contact,String? otp}) async {

    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();
      //final fcmToken = await FirebaseMessaging.instance.getToken(); /// created token for user registration

      log('starting to get response');

      var response;
      //if(token.isNotEmpty){
      log("passed from 1---------");
      response = await HttpHandler.postHttpMethod(url: BASE_URL + mobile_verify_otp, data: {
        "otp": otp,
        "contact": contact
      });

      log('response received apply Jobs api$response');

      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        isOtpVerified.value=true;
        SPManager.instance.setUser(LOGIN_KEY, response["body"]['data'][0]['_id']);
        print(response.toString());
        showSnackbar(title: "Success", message: response["body"]["msg"]);
        Get.to(Dashboard());
      } else if (response["body"]['status'] == 0) {
        isOtpVerified.value=false;
        log("saved already");
        showSnackbar(title: "Warning", message: response["body"]["msg"]);
      }
    }
    catch (e, s) {
      debugPrint("Login Error -- $e  $s");
    }
  }
}