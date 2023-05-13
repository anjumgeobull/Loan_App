import 'package:flutter/material.dart';
import 'package:loan_app/widget/common_snackbar.dart';
import '../Helper/globle style.dart';
import '../config/choosen_lang.dart';
import 'DashboardController.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textToTrans(
                  input:"My App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: (BuildContext context) => OtpScreen(),
            // );
          },
          child: textToTrans(
                  input:"Open OTP Screen"),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  String mobile;
  OtpScreen(this.mobile);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";
  final dashboardController = Get.find<DashboardController>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,top: 20),
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textToTrans(
                  input:
              "Enter OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:themeColor),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // otpBox(0),
                // otpBox(1),
                // otpBox(2),
                // otpBox(3),
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: themeColor,
                  autoFocus: true,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    otp=code;
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    otp=verificationCode;
                  }, // end onSubmit
                ),
              ],
            ),
            SizedBox(height: 30),
            MaterialButton(
              color: themeColor,
              onPressed: () {
                if(otp!="") {
                  dashboardController.verify_otp(contact: widget.mobile,otp:otp);
                  // if (dashboardController.isOtpVerified == true) {
                  //   Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(builder: (context) => Dashboard()));
                  //   SPManager.instance.setUser(LOGIN_KEY, widget.mobile);
                  // }
                  // else {
                  //   showSnackbar(title: "", message: "please enter otp");
                  // }
                } else {
                  showSnackbar(title: "", message: "please enter otp");
                }
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
                if(widget.mobile.isNotEmpty)
                dashboardController.send_otp(contact: widget.mobile);
              },
              child: textToTrans(
                  input:"Resend OTP",style: TextStyle(color:themeColor,fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpBox(int position) {
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
          }
        },
      ),
    );
  }
}
