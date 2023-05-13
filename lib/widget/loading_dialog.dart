
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/choosen_lang.dart';
import '../config/text_style.dart';
import '../main.dart';

void showLoadingDialog({bool? loadingText=false}) {
  Future.delayed(
    Duration.zero,
    () {
      appStartLoader.value = true;
      Get.dialog(
          WillPopScope(
            onWillPop: () async{
              return false;
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CircularProgressIndicator(),
                      if(loadingText==true)
                        Padding(padding:EdgeInsets.only(top: Get.width*0.2),child: textToTrans(
                  input:"Loading the data .. Please wait",style: AppTextStyle.regular500.copyWith(fontSize: 18,color: AppColors.whiteColor),))
                // showSnackbar(title: "", message: "Please Wait Loding");

                    ],
                  ),
                ),
              ),
            ),
          ),
          barrierDismissible: false);
    },
  );
}

void hideLoadingDialog({
  bool isTrue = false,
}) {
  appStartLoader.value = false;
  Get.back(
    closeOverlays: isTrue,
  );
}
