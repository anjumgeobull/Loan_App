import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../Helper/SizedConfig.dart';
import '../../Helper/globle style.dart';
import 'package:get/get.dart';
import '../Dashboard/home_screen (3).dart';
import '../Dashboard/otpScreen.dart';
import '../Helper/commen_textField.dart';
import '../HomePage.dart';
import '../Controller/UserProfileController.dart';
import '../config/choosen_lang.dart';

class EditProfileScreen extends StatefulWidget {

  const EditProfileScreen({Key? key,})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String image = "assets/images/img_2.png";

  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> mobile = TextEditingController().obs;

  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool agreeToTerms = false;
  bool isVerified = false;
  // bool isVerified = false;
  final profileDataController = Get.find<UserProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileDataController.getUserProfile();
    name.value.text = profileDataController.name.value;
    mobile.value.text = profileDataController.contact.value;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: themeColor,
          title: textToTrans(
                  input:
            "Edit Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 25.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,

        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: themeColor,
                ),
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.only(bottom: 30, top: 10),

              ),
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.74,
                padding: EdgeInsets.symmetric(horizontal: 20),
                // color: kPrimaryColor,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 2.0,top: 30),
                      child: textToTrans(
                  input:
                        "Enter Your Name",
                        style: KH6_SemiBold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFiledBorderWidget(
                      controller: name.value,
                      isEnabled: true,
                      label: 'Enter your name',
                      validator: (String) {},
                      width: SizeConfig.screenWidth,
                      inputType: TextInputType.text,
                      focusNode: userNameFocus,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: textToTrans(
                  input:
                        "Enter Mobile number",
                        style: KH6_SemiBold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFiledBorderWidget(
                      controller: mobile.value,
                      isEnabled: true,
                      label: 'Enter mobile number',
                      validator: (String) {},
                      width: SizeConfig.screenWidth,
                      inputType: TextInputType.text,
                      focusNode: passwordFocus,

                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          // await Future.delayed(Duration.zero);
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                          profileDataController.updateProfileData(user_name: name.value.text,
                              contact: mobile.value.text);

                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: textToTrans(
                  input:
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )

                  ],

                ),
              ),



            ],
          ),
        )

    );
  }
  void _showOtpScreen(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            String otp = "";

            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20,
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textToTrans(
                  input:
                      "Enter OTP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _otpBox(0, otp, setState),
                        _otpBox(1, otp, setState),
                        _otpBox(2, otp, setState),
                        _otpBox(3, otp, setState),
                      ],
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      color: themeColor,
                      onPressed: () {
                        Navigator.of(context).pop();

                      },
                      child: textToTrans(
                  input:
                        "Verify",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Resend OTP
                      },
                      child: textToTrans(
                  input:
                        "Resend OTP",
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _otpBox(int position, String otp, StateSetter setState) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            otp = otp.replaceRange(position, position + 1, value);
            if (position < 3) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
            setState(() {});
          }
        },
      ),
    );
  }

}
