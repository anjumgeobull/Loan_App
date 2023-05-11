import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loan_app/Model/VehicleDetailedModel.dart';
import '../Dashboard/Car_details_page.dart';
import '../Helper/api_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Helper/loading_dialog.dart';
import '../Model/MyVehicleData.dart';
import '../Helper/http_handler/network_http.dart';

class MyVehicleDetailedController extends GetxController{
  RxString licNo="loading".obs;

  ///get vehicle data
  RxInt isSelected = 0.obs;
  List<MyVehicleData> vehicleList=[];
  String user_auto_id="6458cb6be3ce3346ba00b4f2";
  RxBool isApiCallProcessing=false.obs;
  RxInt status= 0.obs;
  RxList  searchvehicle= [].obs;
  RxList myVehicleList = [].obs;
  ///get my vehicle list Api Call
  // getMyVehicleDetail() async {
  //   //showLoadingDialog();
  //   log('My vehicle controller called');
  //   log("user id ===>");
  //   log(user_auto_id);
  //   isApiCallProcessing.value = true;
  //
  //   var url = BASE_URL + get_my_vehicle_list;
  //   Uri uri = Uri.parse(url);
  //   debugPrint(url);
  //   // /vehicle_number:MH12TY5476
  //   final body = {
  //     "user_auto_id": user_auto_id,
  //   };
  //
  //   final response = await http.post(uri,body:body);
  //
  //   log('Response status: ${response.statusCode}');
  //   log('Response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     final resp=jsonDecode(response.body);
  //     int status =resp['status'];
  //     log("$status");
  //     if(status==1) {
  //       MyVehicleModel getmyvehiclelist =
  //       MyVehicleModel.fromJson(json.decode(response.body));
  //       vehicleList = getmyvehiclelist.data ;
  //       licNo.value=vehicleList[0].vehicleNumber ;
  //       log("$licNo");
  //      // Get.to(() => CarDetailScreen());
  //
  //     }
  //     else{
  //       isApiCallProcessing.value=false;
  //       // showSnackbar(title: "Failed!", message: 'Server error: ${response.statusCode}');
  //       Fluttertoast.showToast(msg: 'Server error: ' +response.statusCode.toString(), backgroundColor: Colors.grey,);
  //
  //     }
  //     // hideLoadingDialog();
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  getMyVehicleDetail() async {
    log('entered add my vehicle api ----');
    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();
      log('starting to get response for --getmyVehicleList');
      var response = await HttpHandler.postHttpMethod(
          url: BASE_URL + get_my_vehicle_list,
          data: {"user_auto_id": user_auto_id});
      log('response received getMyVehicleList --$response');
      hideLoadingDialog();
      if (response["body"]['status'] == 1) {
        myVehicleList.value = response["body"]["data"];
        myVehicleList.refresh();
      } else if (response["body"]['status'] == 0) {
        log("Data Not available");
        myVehicleList.clear();
      }
    } catch (e, s) {
      debugPrint("Server Error -- $e  $s");
    }
  }


}