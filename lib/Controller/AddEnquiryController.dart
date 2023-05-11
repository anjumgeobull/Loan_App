import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/Dashboard/Dashboard.dart';
import '../Helper/String_constant.dart';
import '../Helper/api_constant.dart';
import '../Helper/http_handler/network_http.dart';
import '../Helper/loading_dialog.dart';
import '../Helper/shared_preferances.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEnquiryController extends GetxController
{
  String user_auto_id="";
  RxList enquireyList = [].obs;

  addEnquieryApi({
    String? cityName,
    String? empType,
    String? reuireamt,
    String? profileImg,
    File? icon_img,
    String? panCardImg,
    File? picon_img,
    String? adharCardImg,
    File? aicon_img,
    String? RCImg,
    File? ricon_img,
    String? insuImg,
    File? iicon_img,
    String? bankStatement,
    File? filedocument,

  })
  async {

    showLoadingDialog();
    var url = BASE_URL + add_enquirey;
    Uri uri=Uri.parse(url);

    var request = new http.MultipartRequest("POST", uri);

    //For profile image
    user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;
    try{
      if(icon_img!=null){
        request.files.add(
          http.MultipartFile(
            'photo',
            icon_img.readAsBytes().asStream(),
            await icon_img.length(),
            filename: icon_img.path.split('/').last,),);
      }
      request.fields['photo'] = '';
    }
    catch(exception){
      request.fields['photo'] = '';
      print('Profile image not selected');
    }
//Adhar image

    try{
      if(aicon_img!=null){
        request.files.add(
          http.MultipartFile(
            'aadhar_or_votingcard',
            aicon_img.readAsBytes().asStream(),
            await aicon_img.length(),
            filename: aicon_img.path.split('/').last,),);
      }
      request.fields['aadhar_or_votingcard'] = '';
    }
    catch(exception){
      request.fields['aadhar_or_votingcard'] = '';
      print('aadhar_or_votingcard image not selected');
    }

    //For pan image

    try{
      if(picon_img!=null){
        request.files.add(
          http.MultipartFile(
            'pancard',
            picon_img.readAsBytes().asStream(),
            await picon_img.length(),
            filename: picon_img.path.split('/').last,),);
      }
      request.fields['pancard'] = '';
    }
    catch(exception){
      request.fields['pancard'] = '';
      print('pancard image not selected');
    }

    //for Rc image

    try{
      if(ricon_img!=null){
        request.files.add(
          http.MultipartFile(
            'rc_book',
            ricon_img.readAsBytes().asStream(),
            await ricon_img.length(),
            filename: ricon_img.path.split('/').last,),);
      }
      request.fields['rc_book'] = '';
    }
    catch(exception){
      request.fields['rc_book'] = '';
      print('rc_book image not selected');
    }

    //for Insurance image

    try{
      if(iicon_img!=null){
        request.files.add(
          http.MultipartFile(
            'insurance',
            iicon_img.readAsBytes().asStream(),
            await iicon_img.length(),
            filename: iicon_img.path.split('/').last,),);
      }
      request.fields['insurance'] = '';
    }
    catch(exception){
      request.fields['insurance'] = '';
      print('insurance image not selected');
    }
//Bank statements
    try {
      if (filedocument != null) {
        request.files.add(
          http.MultipartFile(
            'bank_statement',
            filedocument.readAsBytes().asStream(),
            await filedocument.length(),
            filename: filedocument.path.split('/').last,
          ),
        );
      } else {
        request.fields["bank_statement"] = '';
      }
    } catch (exception) {
      print('bank_statement not selected');
      request.fields["bank_statement"] = '';
    }

    // user_auto_id,city,employment_type,requirement_amount,photo,
    // pancard,aadhar_or_votingcard,bank_statement,rc_book,insurance

    request.fields["user_auto_id"] = user_auto_id;
    request.fields["city"] = cityName!;
    request.fields["employment_type"] = empType!;
    request.fields["requirement_amount"] = reuireamt!;

    print(request.fields.toString());

    http.Response response = await http.Response.fromStream(await request.send());

    print(response.toString());

    if (response.statusCode == 200) {
      hideLoadingDialog();
      final resp=jsonDecode(response.body);
      print(resp.toString());

      int status=resp['status'];
      if(status==1){
        Fluttertoast.showToast(
          msg: "Added successfully",
          backgroundColor: Colors.grey,
        );
        Get.off(() => Dashboard());
      }
      else{
        String message=resp['msg'];
        print(message);
      }
    }
    else if(response.statusCode==500){
      hideLoadingDialog();
      print(response.statusCode.toString());
      Fluttertoast.showToast(msg: "Server Error", backgroundColor: Colors.grey,);

    }
    else {
      hideLoadingDialog();
      print(response.statusCode.toString());
      Fluttertoast.showToast(msg: response.toString(), backgroundColor: Colors.grey,);
    }
  }

  // async {
  //
  //   try {
  //     showLoadingDialog();
  //     Get.focusScope!.unfocus();
  //     log('starting to get response');
  //     var response;
  //     log("passed from 1---------");
  //   //   user_auto_id,city,employment_type,
  //   // requirement_amount,
  //   // photo,pancard,aadhar_or_votingcard,
  //   // bank_statement,rc_book,insurance
  //
  //
  //
  //     // response = await HttpHandler.postHttpMethod(url: BASE_URL + add_enquirey, data: {
  //     //   "user_auto_id": user_auto_id,
  //     //   "city": cityName,
  //     //   "employment_type": empType,
  //     //   "requirement_amount": reuireamt,
  //     //   "photo": profileImg,
  //     //   "pancard": panCardImg,
  //     //   "aadhar_or_votingcard": adharCardImg,
  //     //   "bank_statement": bankStatement,
  //     //   "rc_book": RCImg,
  //     //   "insurance": insuImg,
  //     // });
  //     //showSnackbar(title: "Warning", message: "Something went wrong");
  //
  //
  //     log('response data for enquiry $response');
  //
  //     hideLoadingDialog();
  //     if (response["body"]['status'] == "1") {
  //       print(response.toString());
  //       //applyJobsList.value = [response];
  //       showSnackbar(title: "Success", message: "Submitted successfully");
  //       Get.to(() => HomeScreen());
  //
  //       // hideLoadingDialog();
  //     } else if (response["body"]['status'] == "0") {
  //
  //       log("Submitted already");
  //       showSnackbar(title: "Warning", message: response["body"]["msg"]);
  //       // hideLoadingDialog();
  //     }
  //   }
  //   catch (e, s) {
  //     debugPrint("Server Error -- $e  $s");
  //   }
  // }

  getenquirey() async {
    log('entered add my vehicle api ----');
    try {
      showLoadingDialog();
      Get.focusScope!.unfocus();
      user_auto_id = (await SPManager.instance.getUser(LOGIN_KEY))!;
      log('starting to get response for --getEnquirey');
      var response = await HttpHandler.postHttpMethod(
          url: BASE_URL + get_enquirey,
          data: {"user_auto_id": user_auto_id});
      log('response received getEnquirey --$response');

      if (response["body"]['status'] == 1) {
        enquireyList.value = response["body"]["data"];
        enquireyList.refresh();
        hideLoadingDialog();
      } else if (response["body"]['status'] == 0) {
        hideLoadingDialog();
        log("Data Not available");
        enquireyList.clear();
      }
    } catch (e, s) {
      debugPrint("Server Error -- $e  $s");
    }
  }
}