import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../Helper/SizedConfig.dart';
import '../../Helper/globle style.dart';

import '../Dashboard/home_screen (3).dart';
import '../Dashboard/otpScreen.dart';
import '../Helper/commen_textField.dart';
import '../HomePage.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({Key? key,})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String image = "assets/images/img_2.png";
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController emailId = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool agreeToTerms = false;
  bool isVerified = false;
  // bool isVerified = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor:themeColor,
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

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    Text(
                      "User Registration",
                      style: KH3.copyWith(color: KWHITE_COLOR),
                    )
                  ]),
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
                    child: Text(
                      "Enter Your Name",
                      style: KH6_SemiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFiledBorderWidget(
                    controller: emailId,
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
                    child: Text(
                      "Enter Mobile number",
                      style: KH6_SemiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: KInputRadius,
                      color: kPrimaryColor,
                      // border: Border.all(color: kPrimaryColor)
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex:5,
                          child: TextFiledBorderWidget(
                            controller: mobile,
                            isEnabled: true,
                            label: 'Enter mobile number',
                            validator: (String) {},
                            width: SizeConfig.screenWidth,
                            inputType: TextInputType.text,
                            focusNode: passwordFocus,

                          ),
                        ),
                                Visibility(
                                  visible:isVerified == false ? true : false,
                                  child: InkWell(
                                    onTap: () async {
                                      _showOtpScreen(context);
                                      setState(() {
                                        isVerified = true;
                                      });
                                    },
                                    child:

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal:  SizeConfig.screenWidth * 0.024,),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kPrimaryColor)
                                      ),
                                      alignment: Alignment.centerRight,
                                      child:
                                      Text("Send OTP",
                                          textAlign:TextAlign.right,
                                          style:
                                          KH7_SemiBold.copyWith(color: KWHITE_COLOR)),


                                    ),


                                  ),
                                ),
                        Visibility(
                          visible:isVerified == true ? true : false,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal:  SizeConfig.screenWidth * 0.024,),
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor)
                            ),
                            alignment: Alignment.centerRight,
                            child:
                            Text("Verified",
                                textAlign:TextAlign.right,
                                style:
                                KH7_SemiBold.copyWith(color: KWHITE_COLOR)),


                          ),
                        ),
                              ]
                    ),



                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: SizeConfig.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: SizeConfig().getTextSize(1.1),
                          child: Checkbox(
                            value: this.agreeToTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                this.agreeToTerms = value!;
                              });
                            },
                          ),
                        ),
                        Text(
                          "I agree to the terms and conditions",
                          style: KH7,
                        ),
                      ],
                    ),

                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        //Redirect to Dashboard / Home activity.
                        await Future.delayed(Duration.zero);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          'Submit',
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
                    Text(
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
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Resend OTP
                      },
                      child: Text(
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
