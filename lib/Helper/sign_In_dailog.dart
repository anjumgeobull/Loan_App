import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helper/globle style.dart';
import '../Register/register_screen (1).dart';

class SignInConfirmationDialog extends StatefulWidget {
  const SignInConfirmationDialog({Key? key}) : super(key: key);

  @override
  State<SignInConfirmationDialog> createState() => _SignInConfirmationDialogState();
}

class _SignInConfirmationDialogState extends State<SignInConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return
      SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            width: MediaQuery.of(context).size.width / 1.2,
            child:
            // Consumer<AuthenticationProvider>(
            //     builder: (context, auth, child) {
            //       return
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Do want to create account ?",style: TextStyle(
                                color: themeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end, children: [
                            InkWell(
                              onTap: () async {
                                Get.to(() => RegisterScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 4, bottom: 4, left: 32, right: 32),
                                child: Center(
                                    child:
                                    Text("Yes",style: TextStyle(
                                        color: themeColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                               Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 32, right: 16),
                                child: Center(
                                    child:
                                    Text("No",style: TextStyle(
                                        color: themeColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ),
                              ),
                            ),
                          ])
                        ])
                // }),
          ),
        ]);
  }
}
