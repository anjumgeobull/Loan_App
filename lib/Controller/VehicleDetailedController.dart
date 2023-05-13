import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loan_app/Model/VehicleDetailedModel.dart';
import '../Dashboard/Car_details_page.dart';
import '../Helper/String_constant.dart';
import '../Helper/api_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Helper/shared_preferances.dart';


class VehicleDetailedController extends GetxController{
  RxString licNo="loading".obs,
      full_chasis="loading".obs,
      owner="loading".obs,
      model="loading".obs,
      fule_type="loading".obs,
      engine="loading".obs,
      vehicle_class="loading".obs,
      maker_name="loading".obs,
      maker_model="loading".obs,
      vehicle_color="loading".obs,
      insu_date="loading".obs,
      pollution="loading".obs,
      fitnessDate="loading".obs,
      isBlacklist="loading".obs,
      registration_authority="loading".obs,
      insuerNmae="loading".obs,
      finaincerName="loading".obs,
      vehicleColor="loading".obs,
      norms_type="loading".obs,
      taxupto="loading".obs,
      puc_expiry="loading".obs,
      seating_capacity="loading".obs,
      body_type="loading".obs,
      present_address="loading".obs,
      rc_staus="loading".obs,
      vehicle_weight="loading".obs,
      insuerName="loading".obs,
      rc_staus_ason="loading".obs,
      unladen_weight="loading".obs,
      financier_name="loading".obs,
      count="loading".obs,
      nocdetails="loading".obs,
      owner_father_name="loading".obs,
      insurance_policy_no="loading".obs,
      blaclist="loading".obs,
      manufacturing_date="loading".obs,
      fitupto="loading".obs,
      vehicle_cubic_capacity="loading".obs,
      pucc_no="loading".obs,
      permanent_address="loading".obs,
      registration_date="loading".obs,
      is_blacklisted="loading".obs,
      insuranceDate="loading".obs,ownerCount='loading'.obs;


  ///get vehicle data
  RxInt isSelected = 0.obs;
  List vehicleList=[];
  String user_auto_id="";
  RxBool isApiCallProcessing=false.obs;
  RxInt status= 0.obs;
  RxList  searchvehicle= [].obs;

///search vehicle details Api Call
  getVehicleDetailsSearchData(String vehicleNumber) async {
    user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;
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
        model.value=vehicleData.model;
        fule_type.value=vehicleData.fuelType;
        engine.value=vehicleData.engine;
        maker_model.value=vehicleData.makerModel;
        puc_expiry.value=vehicleData.pucExpiry;
        registration_date.value=vehicleData.registrationDate;
        finaincerName.value=vehicleData.financierName;
        registration_authority.value=vehicleData.registrationAuthority;
        norms_type.value=vehicleData.normsType;
        fitnessDate.value=vehicleData.fitnessDt;
        pollution.value=vehicleData.pollution;
        vehicle_color.value=vehicleData.vehicleColor;
        unladen_weight.value=vehicleData.unladenWeight;
        rc_staus.value=vehicleData.rcStatus;
        maker_name.value=vehicleData.makerName;
        ownerCount.value=vehicleData.ownerCount;
        count.value = ownerCount.toString();
        //print(count);
        insuranceDate.value=vehicleData.insuranceDate;
        body_type.value=vehicleData.bodyType;
        nocdetails.value=vehicleData.nocDetails;
        fitupto.value=vehicleData.fitUpto;
        blaclist.value=vehicleData.blacklistStatus;
        seating_capacity.value=vehicleData.seatingCapacity;
        vehicle_weight.value=vehicleData.vehicleWeight;
        pucc_no.value=vehicleData.puccNo;
        vehicle_cubic_capacity.value=vehicleData.vehicleCubicCapacity;
        permanent_address.value=vehicleData.permanentAddress;
        present_address.value=vehicleData.presentAddress;
        insurance_policy_no.value=vehicleData.insurancePolicyNo;
        owner_father_name.value=vehicleData.ownerFatherName;
        manufacturing_date.value=vehicleData.manufacturingDate;
        // financier_name.value=vehicleData.financierName;
        insuerName.value=vehicleData.insurerName;
        //is_blacklisted=vehicleData.isBlacklisted;
        taxupto.value=vehicleData.taxUpto;
        rc_staus_ason.value=vehicleData.rcStatusAsOn;
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
    log('vehicle controller called');
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
        Fluttertoast.showToast(msg: 'Added Successfully: ' +response.statusCode.toString(), backgroundColor: Colors.grey,);
        //Get.off(() => CarDetailScreen());
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