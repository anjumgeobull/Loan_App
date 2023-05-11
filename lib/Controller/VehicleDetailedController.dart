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


class VehicleDetailedController extends GetxController{
  RxString licNo="loading".obs,
      full_chasis="loading".obs,
      owner="loading".obs,
      Reg_date="loading".obs,
      fule_type="loading".obs,
      engine="loading".obs,
      vehicle_class="loading".obs,
      maker_name="loading".obs,
      maker_model="loading".obs,
      ownerCount="loading".obs,
      insu_date="loading".obs,
      pollution="loading".obs,
      fitnessDate="loading".obs,
      isBlacklist="loading".obs,
      model="loading".obs,
      insuerNmae="loading".obs,
      finaincerName="loading".obs,
      vehicleColor="loading".obs,
      manuDate="loading".obs,
      normType="loading".obs,
      ownerFatherName="loading".obs;

  ///get vehicle data
  RxInt isSelected = 0.obs;
  List vehicleList=[];
  String user_auto_id="6458cb6be3ce3346ba00b4f2";
  RxBool isApiCallProcessing=false.obs;
  RxInt status= 0.obs;
  RxList  searchvehicle= [].obs;

///search vehicle details Api Call
  getVehicleDetailsSearchData(String vehicleNumber) async {

    //showLoadingDialog();
    log('controller called');
    log("vehicleNumberData");
    log(vehicleNumber);
    isApiCallProcessing.value = true;

    var url = BASE_URL + search_vehicle_details;
    Uri uri = Uri.parse(url);
    debugPrint(url);
   // /vehicle_number:MH12TY5476
    final body = {
      "vehicle_number": vehicleNumber,
    };

    final response = await http.post(uri,body:body);

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final resp=jsonDecode(response.body);
      int status =resp['status'];
      log("$status");
      if(status==1) {
        VehicleDetailedModel getvehicleSearchlist =
        VehicleDetailedModel.fromJson(json.decode(response.body));
        var vehicleData = getvehicleSearchlist.data ;
        licNo.value=vehicleData.license ;
        log("$licNo");
        full_chasis.value=vehicleData.fullChassis;
        owner.value=vehicleData.owner;
        vehicle_class.value=vehicleData.vehicleClass;
        Reg_date.value=vehicleData.registrationDate;
        fule_type.value=vehicleData.fuelType;
        engine.value=vehicleData.engine;
       //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDetailScreen()));
        Get.to(() => CarDetailScreen());

        searchvehicle.value = List.generate(vehicleList.length, (index) => false);
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

///Add my vehicle Api Call
  addVehicleDetails(String vehicleNumber, String is_my_vehicle)async {

    //showLoadingDialog();
    log('vehcile controller called');
    log("vehicleNumberData");
    log(vehicleNumber);
    isApiCallProcessing.value = true;

    var url = BASE_URL + add_my_vehicle;
    Uri uri = Uri.parse(url);
    debugPrint(url);
    // /vehicle_number:MH12TY5476
    //user_auto_id, vehicle_number,is_my_vehicle(yes/no)
    final body = {
      "user_auto_id":user_auto_id,
      "vehicle_number": vehicleNumber,
      "is_my_vehicle":is_my_vehicle
    };

    final response = await http.post(uri,body:body);
    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final resp=jsonDecode(response.body);
      int status =resp['status'];
      log("$status");
      if(status==1) {
        Fluttertoast.showToast(msg: 'Add Successfully: ' +response.statusCode.toString(), backgroundColor: Colors.grey,);
        Get.to(() => CarDetailScreen());
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


}