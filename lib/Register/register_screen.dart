
import 'package:flutter/material.dart';
import '../../Helper/SizedConfig.dart';
import '../../Helper/globle style.dart';
import '../Dashboard/Car_details_page.dart';
import '../Dashboard/DashboardController.dart';
import '../Helper/String_constant.dart';
import '../Helper/commen_textField.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../Helper/shared_preferances.dart';
import '../widget/common_snackbar.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({Key? key,})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final dashboardController = Get.find<DashboardController>();
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
  String otp='';
  String verifiedOTP='';
  // bool showTimer=true,isOtpBtn=false;
  // bool showResendButton=false,isOtpSend=false,
  //     isOtpVerified=false;

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
                    padding: const EdgeInsets.all( 10.0),
                    child: Text(
                      "Enter Your Name",
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
                            controller: name,
                            isEnabled: true,
                            label: 'Enter Your Name',
                            validator: (String) {},
                            width: SizeConfig.screenWidth,
                            inputType: TextInputType.text,
                            focusNode: passwordFocus,

                          ),
                        ),

                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: 15,
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 2.0),
                  //   child: Text(
                  //     "Enter email id",
                  //     style: KH6_SemiBold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFiledBorderWidget(
                  //   controller: emailId,
                  //   isEnabled: true,
                  //   label: 'Enter email id',
                  //   validator: (String) {},
                  //   width: SizeConfig.screenWidth,
                  //   inputType: TextInputType.text,
                  //   focusNode: userNameFocus,
                  // ),

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

                  TextFiledBorderWidget(
                    controller: mobile,
                    isEnabled: true,
                    // isEnabled: icContactVerified,
                    label: 'Enter Mobile number',
                    validator: (String) {},
                    width: SizeConfig.screenWidth,
                    inputType: TextInputType.text,
                    focusNode: passwordFocus,
                  ),

                  // SizedBox(
                  //   height: 15,
                  // ),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 2.0),
                  //   child: Text(
                  //     "Enter Address",
                  //     style: KH6_SemiBold,
                  //   ),
                  // ),
                  //
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFiledBorderWidget(
                  //   controller: password,
                  //   // isEnabled: icContactVerified,
                  //   isEnabled: true,
                  //   label: 'Enter Address',
                  //   validator: (String) {},
                  //   width: SizeConfig.screenWidth,
                  //   inputType: TextInputType.text,
                  //   focusNode: passwordFocus,
                  // ),
                  //
                  // SizedBox(
                  //   height: 10,
                  // ),
                  dashboardController.isOtpSend==true ?
                  verifyOtpUi():
                  Container(),

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
                  dashboardController.isOtpVerified==true?
                  Container(
                    margin: const EdgeInsets.only(right: 20.0,top: 5),
                    alignment: Alignment.centerRight,
                    child: const Text("Verified",style: TextStyle(color: Colors.green,fontSize: 13,fontWeight: FontWeight.bold),),
                  ):
                  Container(),
                  Obx(
                    ()=> dashboardController.registered.value==false ?
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          //Redirect to Dashboard / Home activity.
                          await Future.delayed(Duration.zero);

                          if(mobile.text!=0 && name.text!="" && agreeToTerms==true) {
                            dashboardController.registration(token: "",
                                user_name: name.text,
                                contact: mobile.text);
                            if(dashboardController.registered==true)
                              {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CarDetailScreen()));
                              }
                          }
                          else
                          {
                            showSnackbar(title: "", message: "please agree to terms and conditions");
                          }
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
                            'Registration',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ):
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          //Redirect to Dashboard / Home activity.
                          await Future.delayed(Duration.zero);
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
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    // Center(
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       //Redirect to Dashboard / Home activity.
                    //       await Future.delayed(Duration.zero);
                    //       if(agreeToTerms==true) {
                    //         dashboardController.registration(token: "",
                    //             user_name: name.text,
                    //             contact: mobile.text);
                    //       }
                    //       else
                    //         {
                    //           showSnackbar(title: "", message: "please agree to terms and conditions");
                    //         }
                    //     },
                    //     child: Container(
                    //       height: 50,
                    //       width: 250,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color:themeColor,
                    //         borderRadius: BorderRadius.all(Radius.circular(30)),
                    //       ),
                    //       child: Text(
                    //         'Verify',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget verifyOtpUi(){
    return Column(
      children: <Widget>[
        const Text('Please enter the otp sent to your mobile number '),
        SizedBox(height: 10.0),

        OtpTextField(
          numberOfFields: 4,
          borderColor: themeColor,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            otp=code;
            print("onchangeCode: "+code);
            print("onchangeCode: "+otp);
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode){
            verifiedOTP=verificationCode;
            print("verificationCode: "+verificationCode);
            print("verificationCode: "+verifiedOTP);
            setState(() {
            });
          }, // end onSubmit
        ),
        SizedBox(height: 15,),
        dashboardController.isResendApiProcessing==true?
        Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ):
        dashboardController.showResendButton==true?
        GestureDetector(
          onTap: () {
            dashboardController.resendOtpApi(contact:mobile.text);
          },
          child: const Text(
            "Resend OTP Code",
            style: TextStyle(decoration: TextDecoration.underline,fontSize: 16, fontWeight: FontWeight.bold,color:
            Colors.blue),
          ),
        ):
        dashboardController.showTimer==true?
        buildTimer():
        Container(),
        SizedBox(height: 15.0),

      ],
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Resend OTP in " , style: TextStyle(fontSize: 14),),
        TweenAnimationBuilder(
          onEnd: ()=>{
            if(this.mounted){
              setState(() {
                //print('0000');
                dashboardController.showTimer.value=false;
                dashboardController.showResendButton.value=true;
              })
            }
          },
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
