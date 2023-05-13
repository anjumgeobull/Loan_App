import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/widget/common_snackbar.dart';
import '../Dashboard/DashboardController.dart';
import '../Helper/SizedConfig.dart';
import '../Helper/commen_textField.dart';
import '../Helper/globle style.dart';
import 'package:get/get.dart';

import '../Register/register_screen.dart';
import '../config/choosen_lang.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final dashboardController = Get.find<DashboardController>();
  String image = "assets/images/img_2.png";
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String otp = '';
  bool isOtpSend = false;
  bool isOtpVerified=true;

  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color:themeColor,
                ),
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.only(bottom: 30, top: 10),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: SizeConfig.screenWidth * 0.3,
                          height: SizeConfig.screenHeight * 0.15,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.02,
                            vertical: SizeConfig.screenHeight * 0.02,
                          ),
                        child: Image.asset('assets/images/applogo.png'),
                          ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      textToTrans(
                  input:
                        "User Login",
                        style: KH3.copyWith(color: KWHITE_COLOR),
                      )
                    ]),
              ),
              SingleChildScrollView(
                child:
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.62,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.01,
                      horizontal: SizeConfig.screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: textToTrans(
                  input:
                          "Enter Mobile Number",
                          style: KH6_SemiBold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFiledBorderWidget(
                        controller: userName,
                        isEnabled: true,
                        label: 'Enter mobile number',
                        validator: (String) {},
                        width: SizeConfig.screenWidth,
                        inputType: TextInputType.phone,
                        focusNode: userNameFocus,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if(userName.text!="" && userName.text.length==10) {
                              dashboardController.send_otp(contact: userName.text,context: context);
                            }else
                              {
                                showSnackbar(title: "Validation", message: "please enter valid mobile no.");
                              }
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: themeColor,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: textToTrans(
                  input:
                              'Send OTP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textToTrans(
                                input:"Don't Have Any Account?  "),
                            GestureDetector(
                              child: textToTrans(
                                   input:
                                "Sign Up Now",
                                style: TextStyle(color: themeColor),
                              ),
                              onTap: () {
                                Get.to(()=>RegisterScreen());
                              },
                            )
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}








