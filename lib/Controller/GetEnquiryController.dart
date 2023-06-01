import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../Helper/String_constant.dart';
import '../Helper/api_constant.dart';
import '../Helper/http_handler/network_http.dart';
import '../Helper/loading_dialog.dart';
import '../Helper/shared_preferances.dart';


class GetEnquiryController extends GetxController{
  String name="";
  int ownerCount=0;
  RxList myVehicleList = [].obs;
  RxList getEnqurylist=[].obs;
  ///get vehicle data
  RxInt isSelected = 0.obs;
  String user_auto_id="";
  RxBool isApiCallProcessing=false.obs;
  RxInt status= 0.obs;

  ///search vehicle details Api Call
  getEnquiry() async {
    log('entered add my vehicle api ----');
    try {
      user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;
      showLoadingDialog();
      Get.focusScope!.unfocus();
      log('starting to get response for --getmyVehicleList');
      var response = await HttpHandler.postHttpMethod(
          url: BASE_URL + get_enquirey,
          data: {"user_auto_id": user_auto_id});
      log('response received getMyVehicleList --$response');
      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        getEnqurylist.value = response["body"]["data"];
        getEnqurylist.refresh();
      } else if (response["body"]['status'] == 0) {
        log("Data Not available");
        getEnqurylist.clear();
      }
    } catch (e, s) {
      debugPrint("Server Error -- $e  $s");
    }
  }

}