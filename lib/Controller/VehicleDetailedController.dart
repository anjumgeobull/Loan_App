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
  String licNo="loading",
      full_chasis="loading",
      owner="loading",
      model="loading",
      fule_type="loading",
      engine="loading",
      vehicle_class="loading",
      maker_name="loading",
      maker_model="loading",
      vehicle_color="loading",
      insu_date="loading",
      pollution="loading",
      fitnessDate="loading",
      isBlacklist="loading",
      registration_authority="loading",
      insuerNmae="loading",
      finaincerName="loading",
      vehicleColor="loading",
      norms_type="loading",
      taxupto="loading",
      puc_expiry="loading",
      seating_capacity="loading",
      body_type="loading",
      present_address="loading",
      rc_staus="loading",
      vehicle_weight="loading",
      insuerName="loading",
      rc_staus_ason="loading",
      unladen_weight="loading",
      financier_name="loading",
      count="loading",
      nocdetails="loading",
      owner_father_name="loading",
      insurance_policy_no="loading",
      blaclist="loading",
      manufacturing_date="loading",
      fitupto="loading",
      vehicle_cubic_capacity="loading",
      pucc_no="loading",
      permanent_address="loading",
      registration_date="loading",
      is_blacklisted="loading",
      insuranceDate="loading";
  int ownerCount=0;


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
        licNo=vehicleData.license ;
        log("$licNo");
        full_chasis=vehicleData.fullChassis;
        owner=vehicleData.owner;
        vehicle_class=vehicleData.vehicleClass;
        model=vehicleData.model;
        fule_type=vehicleData.fuelType;
        engine=vehicleData.engine;
        maker_model=vehicleData.makerModel;
        puc_expiry=vehicleData.pucExpiry;
        registration_date=vehicleData.registrationDate;
        finaincerName=vehicleData.financierName;
        registration_authority=vehicleData.registrationAuthority;
        norms_type=vehicleData.normsType;
        fitnessDate=vehicleData.fitnessDt;
        pollution=vehicleData.pollution;
        vehicle_color=vehicleData.vehicleColor;
        unladen_weight=vehicleData.unladenWeight;
        rc_staus=vehicleData.rcStatus;
        maker_name=vehicleData.makerName;
        ownerCount=vehicleData.ownerCount;
        count = ownerCount.toString();
        print(count);
        insuranceDate=vehicleData.insuranceDate;
        body_type=vehicleData.bodyType;
        nocdetails=vehicleData.nocDetails;
        fitupto=vehicleData.fitUpto;
        blaclist=vehicleData.blacklistStatus;
        seating_capacity=vehicleData.seatingCapacity;
        vehicle_weight=vehicleData.vehicleWeight;
        pucc_no=vehicleData.puccNo;
        vehicle_cubic_capacity=vehicleData.vehicleCubicCapacity;
        permanent_address=vehicleData.permanentAddress;
        present_address=vehicleData.presentAddress;
        insurance_policy_no=vehicleData.insurancePolicyNo;
        owner_father_name=vehicleData.ownerFatherName;
        manufacturing_date=vehicleData.manufacturingDate;
        financier_name=vehicleData.financierName;
        insuerName=vehicleData.insurerName;
        //is_blacklisted=vehicleData.isBlacklisted;
        taxupto=vehicleData.taxUpto;
        rc_staus_ason=vehicleData.rcStatusAsOn;
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
  addVehicleDetails(
      String vehicleNumber,
      String is_my_vehicle,
      String lic,
      String full_chassis,
      String owner,
      String registration_date,
      String fuel_type,
      String engine,
      String vehicle_class,
      String maker_name,
      String maker_model,
      String owner_count,
      String insurance_date,
      String pollution,
      String fitness_dt,
      String model,
      String insurer_name,
      String financier_name,
      String vehicle_color,
      String manufacturing_date,
      String norms_type,
      String owner_father_name,
      String registration_authority,
      String insurance_policy_no,
      String present_address,
      String permanent_address,
      String vehicle_cubic_capacity,
      String pucc_no,
      String vehicle_weight,
      String seating_capacity,
      String puc_expiry,
      String fit_upto,
      String tax_upto,
      String blacklist_status,
      String noc_details,
      String rc_status,
      String rc_status_as_on,
      String body_type)async {
    //showLoadingDialog();
    log('vehcile controller called');
    log("vehicleNumberData");
    log(vehicleNumber);
    isApiCallProcessing.value = true;
    var url = BASE_URL + add_my_vehicle;
    Uri uri = Uri.parse(url);
    debugPrint(url);
    //user_auto_id, vehicle_number,is_my_vehicle(yes/no)
    // "_id": "6459d4284c902218200a8ee2",
    // "user_auto_id": "6458cb6be3ce3346ba00b4f2",
    // "vehicle_number": "MH12TY5473",
    // "is_my_vehicle": "yes",
    // "license": "",
    // "full_chassis": "",
    // "owner": "",
    // "registration_date": "",
    // "fuel_type": "",
    // "engine": "",
    // "vehicle_class": "",
    // "maker_name": "",
    // "maker_model": "",
    // "owner_count": "",
    // "insurance_date": "",
    // "pollution": "",
    // "fitness_dt": "",
    // "is_blacklisted": "",
    // "model": "",
    // "insurer_name": "",
    // "financier_name": "",
    // "vehicle_color": "",
    // "manufacturing_date": "",
    // "norms_type": "",
    // "owner_father_name": "",
    // "registration_authority": "",
    // "insurance_policy_no": "",
    // "present_address": "",
    // "permanent_address": "",
    // "vehicle_cubic_capacity": "",
    // "pucc_no": "",
    // "vehicle_weight": "",
    // "seating_capacity": "",
    // "puc_expiry": "",
    // "fit_upto": "",
    // "tax_upto": "",
    // "blacklist_status": "",
    // "noc_details": "",
    // "rc_status": "",
    // "rc_status_as_on": "",
    // "body_type": "",

    final body = {
      "user_auto_id":user_auto_id,
      "vehicle_number": vehicleNumber,
      "is_my_vehicle":is_my_vehicle,
      "license":lic,
      "full_chassis":full_chassis,
      "owner":owner,
      "registration_date":registration_date,
      "fuel_type":fuel_type,
      "engine":engine,
      "vehicle_class":vehicle_class,
      "maker_name":maker_name,
      "maker_model":maker_model,
      "owner_count":owner_count,
      "insurance_date":insurance_date,
      "pollution":pollution,
      "fitness_dt":fitness_dt,
      "is_blacklisted":is_blacklisted,
      "model":model,
      "insurer_name":insurer_name,
      "financier_name":financier_name,
      "vehicle_color":vehicle_color,
      "manufacturing_date":manufacturing_date,
      "norms_type":norms_type,
      "owner_father_name":owner_father_name,
      "registration_authority":registration_authority,
      "insurance_policy_no":insurance_policy_no,
      "present_address":present_address,
      "vehicle_cubic_capacity":vehicle_cubic_capacity,
      "pucc_no":pucc_no,
      "vehicle_weight":vehicle_weight,
      "seating_capacity":seating_capacity,
      "puc_expiry":puc_expiry,
      "fit_upto":fit_upto,
      "tax_upto":tax_upto,

      "noc_details":noc_details,
      "rc_status":rc_status,
      "body_type":body_type,
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